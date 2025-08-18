# scripts/redact_text.ps1
# Version 3 - Adds username redaction and handles empty files.

param(
    [string]$Target = (Join-Path $PSScriptRoot "..")
)
Write-Host "Scanning for files to redact in: $Target"

$patterns = @(
  @{ Name="Username";  Pattern='C:\\Users\\ASUS';                         Replacement='C:\Users\USER' },
  @{ Name="Email";     Pattern='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}';   Replacement='[redacted-email]' },
  @{ Name="Phone";     Pattern='(?<!\d)(\+?\d[\d\s-]{8,}\d)';                      Replacement='[redacted-phone]' },
  @{ Name="Serial";    Pattern='(N7NRCX07W)97730(4)';                            Replacement='$1******$2' }
)

$filesToScan = Get-ChildItem $Target -Recurse -File -Include *.txt, *.md, *.csv, *.log

foreach ($file in $filesToScan) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
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