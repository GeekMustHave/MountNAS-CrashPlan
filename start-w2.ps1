# --- StartW2.PS1 (Child script of start-w.ps1)
#     GeekMustHave, Phoenix Workgroup LLC
#     09/05/21017
#     Starts process of mounting the NAS drive as W:
#     So it can be used by CrashPlan

# --- NOTE: Because the authority\SYSTEM account home directory is C:\windows\system32
#     the boxes command will not work unless it is included in SYSTEMS
#     environmnet variables, so I didn't use it here

# --- This is the command that will mount the NAS drive as Drive W: that CrashPlan can see.
#     The /u: is used to pass user credentials to connect to the NAS drive
$netuse = "net use W: \\MONDONAS\BigDrive01 /u:jschust2 landsra9035"

clear-host
write-host "As a result of the PSExec64 we should be the authority\system account`n" -foregroundcolor yellow
$whoami = whoami
write-host "This script is running as: $whoami `n" -ForegroundColor yellow
pause

write-host "`nRun NET USE as authority\system" -foregroundcolor yellow
write-host "`n $netuse `n" -ForegroundColor cyan
pause

# --- Run the mapping command
Invoke-Expression $netuse

# ---  Display something "Short" to confirm, let's show available drive space
# ---  REFERENCE: 
#       https://stackoverflow.com/questions/12159341/how-to-get-disk-capacity-and-free-space-of-remote-computer
write-host "`nThe W: drive space is shown below`n" -ForegroundColor Yellow
Get-PSDrive W | Select-Object Used,Free | Format-Table

$message = "`nPhoenix Workgroup LLC`nMapping W: as the MONDO BigDrive01 done.`n"
$message2 = "Control will now be returned the original script`n"
$message = $message + $message2
write-host $message -ForegroundColor yellow
pause

# --- We are done here, exit this script
#     return to the monther script  Start-W.ps1
exit