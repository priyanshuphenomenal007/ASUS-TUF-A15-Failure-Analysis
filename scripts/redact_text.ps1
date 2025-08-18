# scripts/redact_text.ps1
# Scans text-based files in the repository and redacts common PII patterns. (Version 2 - handles empty files)

param(
    # By default, it targets the parent directory of the script (the repo root)
    [string]$Target = (Join-Path $PSScriptRoot "..")
)

Write-Host "Scanning for files to redact in: $Target"

# Define patterns to find and what to replace them with
$patterns = @(
  @{ Name="Email";     Pattern='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}';   Replacement='[redacted-email]' },
  @{ Name="Phone";     Pattern='(?<!\d)(\+?\d[\d\s-]{8,}\d)';                      Replacement='[redacted-phone]' },
  # This pattern is specifically designed to find and mask only the middle part of the serial number
  @{ Name="Serial";    Pattern='(N7NRCX07W)97730(4)';                            Replacement='$1******$2' }
)

# Find all relevant text files
$filesToScan = Get-ChildItem $Target -Recurse -File -Include *.txt, *.md, *.csv

foreach ($file in $filesToScan) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content

    # --- SAFETY CHECK ADDED HERE ---
    # Only process the file if it actually contains text content.
    if (-not [string]::IsNullOrWhiteSpace($content)) {
        foreach ($p in $patterns) {
          $content = [regex]::Replace($content, $p.Pattern, $p.Replacement, "IgnoreCase")
        }

        if ($content -ne $originalContent) {
          Write-Host "Redacting PII in: $($file.Name)" -ForegroundColor Yellow
          Set-Content $file.FullName $content -Encoding UTF8
        }
    }
}

Write-Host "---"
Write-Host "Redaction scan complete." -ForegroundColor Green