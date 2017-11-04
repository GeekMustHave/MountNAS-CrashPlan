# --- StartW.PS1 (Mother Script)
#     GeekMustHave, Phoenix Workgroup LLC
#     09/05/2017
#     Starts process of mouning the NAS drive as W:
#     So it can be used by CrashPlan

# --- 


$message = "Set W: drive as NAS Share`nPhoenix Workgroup LLC" 
$message2 = "`nReopen Powershell as Administrator"
$message = $message + $message2 
$message | .\boxes -d "girl" -ac

$message = "`nPowerShell is usually opened with typical user access`nWe need to be using Powershell as the Administrator"
$message2 = "`nThis next step will automatically reopen Powershell in the 'Administrator' mode`n"
$message3 = "`n`nPress (Yes) when you asked 'Do you want his app to make changes...'`n" 
$message = $message + $message2 
write-host $message -foreground yellow
#
write-host  "`nPress (Yes) when you asked 'Do you want this app to make changes to this device?'`n" -ForegroundColor cyan
# --- When this script gets rerun after RUN AS ADMINISTRATOR we don't want to see this
#     first introduction screen, so we will only PAUSE if we are not the Adminstrator
#     REFERENCE: https://stackoverflow.com/questions/7690994/powershell-running-a-command-as-administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {pause}



# --- Changes the script to self elevate itself as RUN AS ADMINISTRATOR
#     This is required to get the PSEexec command to run
#     REFERENCE: https://stackoverflow.com/questions/7690994/powershell-running-a-command-as-administrator
#     the RunAS in this line is how your become authority/system
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Clear-Host

# --- Boxes just Cutes up the messagwe
$message =  "Set W: drive as NAS Share`nPhoenix Workgroup LLC" 
$message | .\boxes -d "boy" -ac

Write-host "`n** You should be in Powershell admin Mode now." -ForegroundColor Yellow
Write-host "`n** Verify this by looking in the header of this window for 'Adimistator Windows Powershell'`n" -ForegroundColor Yellow
pause 

$whoami = whoami
$message = "`n`nYou are currently logged in as the regular user: $whoami"
$message2 = "`nFor CrashPlan to see the W: drive, it must be mounted by the authority\system user"
$message3 = "`nby running PSExec we can become authority/system"
$Message = $message + $message2 + $message3
write-host $message -foregroundcolor yellow
#
Write-host "`n`n** PS Exec will open a new PowerShell window`n" -ForegroundColor cyan
Pause




#     Download REFERENCE: https://docs.microsoft.com/en-us/sysinternals/downloads/psexec
#     Usage REFERENCE: http://windowsitpro.com/systems-management/psexec
# --- PsExec is a light-weight telnet-replacement that lets you execute processes on other system
#     In this use we are using it to our system in order to launch a CMD window
#     That is Owner is the (authority\SYSTEM)
# --- (i) Run program interactive at console, display confidence messages
#     (s) Run in authority\System Account, This is the trick for getting
#         NAS Share to work with CrashPlan
#     This CMD opens up in the (System32) so you need to use Absolute pathnames
#     The CMD script to be run is (C:\myCommands\Start-W2.ps1)

$cmd = "psexec -i -s powershell.exe 'c:\myCommands\Start-W2.ps1 '"
write-host $cmd -ForegroundColor cyan
# --- After the statement below is run, control will be turned over to Start-W2.ps1
psexec -i -s powershell.exe "c:\myCommands\Start-W2.ps1 "

# ---- After the authoritySYSTEM Powershell window Start-W2.PS1 is (exited) the PS script resumes here
$message =  "Phoenix Learning Labs`nMounting MondoNAS as W: script completed" 
$message | .\boxes -d "parchment" -ac
write-host
pause







