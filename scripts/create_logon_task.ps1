# scripts/create_logon_task.ps1
# Registers a Windows Scheduled Task to run the event log exporter at every user logon.

Write-Host "Setting up an automated task to collect evidence after every reboot..."

# Define the name of the scheduled task
$taskName = "PostBoot_Evidence_Collector"

# Define the path to the script that the task will run
$scriptToRun = Join-Path $PSScriptRoot "export_eventlogs.ps1"

# Define the action: run PowerShell, bypassing security policy for this task, and execute our script
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptToRun`" -Days 14"

# Define the trigger: run at any user logon
$trigger = New-ScheduledTaskTrigger -AtLogOn

# Register the task with the Windows Task Scheduler
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Description "Collects critical system logs after each boot to document system instability." -Force

Write-Host "---"
Write-Host "Scheduled task '$taskName' has been created successfully." -ForegroundColor Green
Write-Host "This will now automatically save new crash logs to your 'evidence/runs' folder each time you log into Windows."