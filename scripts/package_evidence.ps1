# scripts/package_evidence.ps1
# Creates a zip archive of the latest evidence run and generates checksums for all files.

$root = Join-Path $PSScriptRoot ".."
$latestRun = Get-ChildItem (Join-Path $root "evidence\runs") -Directory | Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $latestRun) {
    Write-Error "No evidence runs found. Please run export_eventlogs.ps1 first."
    exit 1
}

# Define the path for the new zip file
$zipFile = Join-Path $root "Evidence_Package_$((Get-Date).ToString('yyyy-MM-dd_HH-mm-ss')).zip"

Write-Host "Packaging the latest evidence run into a zip file..."
Write-Host "Source: $($latestRun.FullName)"
Write-Host "Destination: $zipFile"

# Compress the key evidence files into a single archive
Compress-Archive -Path $latestRun.FullName, (Join-Path $root "baseline\*"), (Join-Path $root "SERVICE_BRIEF.md") -DestinationPath $zipFile -Force

# Generate a checksum file for all files in the repository to prove their integrity
Write-Host "Generating SHA256 checksums for all repository files..."
$checksumFile = Join-Path $root "CHECKSUMS_SHA256.csv"

Get-ChildItem $root -Recurse -File |
  Where-Object { $_.FullName -notmatch '\\.git\\' -and $_.Name -ne "CHECKSUMS_SHA256.csv"} |
  Get-FileHash -Algorithm SHA256 |
  Select-Object Path, Algorithm, Hash |
  Export-Csv $checksumFile -NoTypeInformation -Encoding UTF8

Write-Host "---"
Write-Host "Evidence packaged successfully: $zipFile" -ForegroundColor Green
Write-Host "Checksum file created: $checksumFile" -ForegroundColor Green