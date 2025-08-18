# scripts/make_timeline.ps1
# Builds a simple timeline.md from the latest evidence run.

# Find the most recent evidence run folder
$runsRoot = Join-Path $PSScriptRoot "..\evidence\runs"
$latestRunFolder = Get-ChildItem $runsRoot -Directory | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $latestRunFolder) {
    Write-Error "No evidence run folders found in '$runsRoot'. Please run export_eventlogs.ps1 first."
    exit 1
}

$destinationFile = Join-Path $latestRunFolder.FullName "timeline.md"

# Find the key CSV log files in the latest run folder
$kernelLog = Get-ChildItem $latestRunFolder.FullName -Filter "system_critical_shutdowns_*.csv" | Select-Object -First 1
$displayLog = Get-ChildItem $latestRunFolder.FullName -Filter "system_display_errors_*.csv" | Select-Object -First 1
$nvidiaLog = Get-ChildItem $latestRunFolder.FullName -Filter "system_nvlddmkm_errors_*.csv" | Select-Object -First 1
$wheaLog    = Get-ChildItem $latestRunFolder.FullName -Filter "system_whea_errors_*.csv" | Select-Object -First 1

# Initialize the timeline content
$timelineEntries = @(
    "# Crash and Error Timeline (Auto-Generated from System Logs)",
    "**Latest Evidence Run:** $($latestRunFolder.Name)",
    "---",
    "| Timestamp (IST) | Source | Event ID | Details |",
    "|---|---|---|---|"
)

# Function to process a CSV file and add its events to the timeline
function Add-EventsFromCsv {
    param(
        [Parameter(Mandatory=$true)]
        [string]$CsvPath,

        [Parameter(Mandatory=$true)]
        [string]$SourceDisplayName
    )

    if (-not (Test-Path $CsvPath)) { return }

    Import-Csv $CsvPath | ForEach-Object {
        $timestamp = Get-Date $_.TimeCreated -Format "yyyy-MM-dd HH:mm:ss"
        $eventId = $_.Id
        # Sanitize the message for Markdown table by removing pipe characters and newlines
        $message = ($_.Message -replace '\|', ' ' -replace '[\r\n]+', ' ')
        
        # Add the formatted line to our collection
        $timelineEntries += "| $timestamp | $SourceDisplayName | $eventId | $message |"
    }
}

# Add events from all our log files
Add-EventsFromCsv -CsvPath $kernelLog.FullName -SourceDisplayName "Kernel-Power (Crash)"
Add-EventsFromCsv -CsvPath $displayLog.FullName -SourceDisplayName "Display (TDR)"
Add-EventsFromCsv -CsvPath $nvidiaLog.FullName -SourceDisplayName "NVIDIA Driver (nvlddmkm)"
Add-EventsFromCsv -CsvPath $wheaLog.FullName -SourceDisplayName "WHEA (Hardware Error)"

# Save the collected timeline entries to the timeline.md file
$timelineEntries | Set-Content -Path $destinationFile -Encoding UTF8

Write-Host "---"
Write-Host "Timeline.md has been generated successfully in the folder: $($latestRunFolder.FullName)" -ForegroundColor Green