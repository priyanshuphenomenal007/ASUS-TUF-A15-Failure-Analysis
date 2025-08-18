# scripts/collect_baseline.ps1
# This script collects a static baseline of system information.

# Get the absolute path to the 'baseline' directory
$root = Join-Path $PSScriptRoot "..\baseline"

# Ensure the baseline directory exists
New-Item -ItemType Directory -Force -Path $root | Out-Null

Write-Host "Capturing baseline information. This may take a couple of minutes..."

# --- System Identity ---
Write-Host " - Getting systeminfo and msinfo32 reports..."
systeminfo | Out-File -Encoding UTF8 "$root\systeminfo.txt"
# msinfo32 is sometimes slow, we run it last as it can be skipped if needed
# msinfo32 /report "$root\msinfo32.txt"

# --- DirectX and GPU Environment ---
Write-Host " - Getting DirectX diagnostics (dxdiag)..."
dxdiag /t "$root\dxdiag.txt"

# --- Current GPU & Display Class Devices ---
Write-Host " - Checking for present GPU and Display devices..."
"=== WMIC VideoController ===" | Out-File "$root\gpu_presence_baseline.txt" -Encoding UTF8
wmic path win32_videocontroller get Name,PNPDeviceID,Status /format:list | Out-File -Append "$root\gpu_presence_baseline.txt" -Encoding UTF8

"=== PnP Display Class ===" | Out-File -Append "$root\gpu_presence_baseline.txt" -Encoding UTF8
Get-PnpDevice -Class Display | Format-List -Property * | Out-File -Append "$root\gpu_presence_baseline.txt" -Encoding UTF8

# --- Driver Information ---
Write-Host " - Exporting key driver versions..."
Get-CimInstance Win32_PnPSignedDriver |
  Where-Object { $_.DeviceClass -in @('Display', 'Net', 'System', 'Bluetooth') } |
  Select-Object DeviceName, DriverVersion, DriverDate, DriverProviderName, InfName |
  Sort-Object DeviceName |
  Export-Csv "$root\driver_versions.csv" -NoTypeInformation -Encoding UTF8

# --- Power and Battery Reports ---
Write-Host " - Generating power configuration and battery reports..."
powercfg /energy /duration 120 /output "$root\energy-report.html" | Out-Null
powercfg /batteryreport /output "$root\battery-report.html" | Out-Null

Write-Host "---"
Write-Host "Baseline capture complete. All files saved in the 'baseline' folder." -ForegroundColor Green