# MountNAS-CrashPlan
How to Mount NASShare so CrashPlan Pro can back it up

Backup tip, How to mount a NAS share drive so CrashPlan Pro can use it.  GMH-062
I use CrashPlan Pro for making a backup copy of my stuff on a large NAS system.
I discovered that the standard (NET USE) command didn't mount the NAS Share as a SYSTEM drive.
CrashPlan Pro runs as a SYSTEM service and could not see my W: or NAS Share.

**NOTE:** Crashplan Pro does not support or recommend this suggested solution.  Use at your own risk!

I tried a number of solutions from Google and ended up with this one working the best of all of them.
This set of Powershell scripts are tarted up to make them look pretty and contain links to all the people who helped make it work.

Let me know in the comments if this works for you.

## Credits

Boxes, Thomas Jensen  http://boxes.thomasjensen.com/docs/index.html

System Internals Microsoft https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite

## YouTube video 

BACKUP Tip Mount NAS Share to backup with CrashPlan Pro https://www.youtube.com/watch?v=vE3SbvQin6A
