# scripts/export_eventlogs.ps1
# This script exports raw system logs and focused CSVs for key events.

param(
  [int]$Days = 14
)

# Create a unique, timestamped folder for this evidence run
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$destinationFolder = Join-Path $PSScriptRoot "..\evidence\runs\$timestamp"
New-Item -ItemType Directory -Force -Path $destinationFolder | Out-Null

Write-Host "Exporting event logs to a new folder: $destinationFolder"

# --- 1) Export Raw .evtx Log Files ---
# These are the complete, raw logs for independent verification.
Write-Host " - Exporting raw System and Application logs (.evtx)..."
wevtutil epl System "$destinationFolder\System_Log_$timestamp.evtx"
wevtutil epl Application "$destinationFolder\Application_Log_$timestamp.evtx"

# --- 2) Extract Focused CSVs for Key Events (Last N Days) ---
$startTime = (Get-Date).AddDays(-$Days)

# Critical Crashes: Kernel-Power ID 41 and Unexpected Shutdown ID 6008
Write-Host " - Extracting critical crash events (Kernel-Power)..."
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$startTime; Id=41,6008} |
  Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message |
  Export-Csv "$destinationFolder\system_critical_shutdowns_$timestamp.csv" -NoTypeInformation -Encoding UTF8

# GPU/Display Driver Errors (TDR events are often from the 'Display' provider)
Write-Host " - Extracting display driver errors (TDRs)..."
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$startTime; ProviderName='Display'} |
  Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message |
  Export-Csv "$destinationFolder\system_display_errors_$timestamp.csv" -NoTypeInformation -Encoding UTF8
  
# NVIDIA-specific driver errors
Write-Host " - Extracting NVIDIA-specific driver errors (nvlddmkm)..."
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$startTime; ProviderName='nvlddmkm'} |
  Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message |
  Export-Csv "$destinationFolder\system_nvlddmkm_errors_$timestamp.csv" -NoTypeInformation -Encoding UTF8

# WHEA Hardware Errors (WHEA-Logger)
Write-Host " - Extracting hardware errors (WHEA-Logger)..."
Get-WinEvent -FilterHashtable @{LogName='System'; StartTime=$startTime; ProviderName='WHEA-Logger'} |
  Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message |
  Export-Csv "$destinationFolder\system_whea_errors_$timestamp.csv" -NoTypeInformation -Encoding UTF8

# --- 3) Copy the setupapi.dev.log for Reference ---
Write-Host " - Copying the device setup log (setupapi.dev.log)..."
$setupApiLog = Join-Path $env:windir "\inf\setupapi.dev.log"
if (Test-Path $setupApiLog) {
  Copy-Item $setupApiLog "$destinationFolder\setupapi.dev.log"
}

Write-Host "---"
Write-Host "Event log export complete." -ForegroundColor Green