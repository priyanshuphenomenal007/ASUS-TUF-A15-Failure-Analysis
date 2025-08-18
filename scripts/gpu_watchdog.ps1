# scripts/gpu_watchdog.ps1
# Logs GPU presence every 5 seconds and highlights any changes.

$logFile = Join-Path $PSScriptRoot "..\evidence\gpu_watchdog_log.csv"
$previousStatus = @{}

# Create the log file with a header if it doesn't exist
if (-not (Test-Path $logFile)) {
  "Timestamp,Name,PNPDeviceID,Status" | Out-File $logFile -Encoding UTF8
}

Write-Host "Starting GPU Watchdog. Logging to '$logFile'."
Write-Host "Press CTRL+C to stop the script."
Write-Host "---"

while ($true) {
  $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
  $currentGpus = Get-CimInstance Win32_VideoController | Select-Object Name, PNPDeviceID, Status
  $currentStatus = @{}
  $statusChanged = $false

  # Check current state against previous state
  foreach ($gpu in $currentGpus) {
    $id = $gpu.PNPDeviceID
    $currentStatus[$id] = $gpu.Status
    if (-not $previousStatus.ContainsKey($id) -or $previousStatus[$id] -ne $gpu.Status) {
      $statusChanged = $true
    }
  }

  # Check if a GPU that existed before is now missing
  foreach ($id in $previousStatus.Keys) {
    if (-not $currentStatus.ContainsKey($id)) {
      $statusChanged = $true
    }
  }

  # If this is the first run or if a change was detected, log it.
  if (($previousStatus.Count -eq 0) -or $statusChanged) {
    Write-Host "Change detected at $timestamp. Logging current GPU status..."
    "--- Change Detected at $timestamp ---" | Out-File -Append $logFile -Encoding UTF8
    foreach ($gpu in $currentGpus) {
      "$timestamp,""$($gpu.Name)"",""$($gpu.PNPDeviceID)"",""$($gpu.Status)""" | Out-File -Append $logFile -Encoding UTF8
    }
    # If no GPUs are found, log that state explicitly
    if ($currentGpus.Count -eq 0) {
        "$timestamp,""NO GPU DETECTED"",""N/A"",""Missing""" | Out-File -Append $logFile -Encoding UTF8
    }
  }

  # Update the previous state for the next check
  $previousStatus = $currentStatus
  Start-Sleep -Seconds 5
}