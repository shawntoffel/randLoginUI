# randLoginUI

A simple PowerShell script to set a random wallpaper as the Windows 7 login background. Just pass it a directory of wallpapers.

#### Notes:
* Windows only allows files **up to 256KB in size.** Anything larger will not be displayed.
* The script looks for *.jpg, *.jpeg, and *.png files.

#### Parameters:
I run the script on workstation unlock with the Windows Task Scheduler. 

Program/script:

    powershell
    
Parameters:

    -windowstyle hidden -noprofile -executionpolicy bypass -file "C:\path\to\randLoginUI.ps1" "C:\path\to\wallpapers"
    
Check "Run with highest privileges"
  
I bypass the execution policy since the default is typically "Restricted". The restricted policy prevents all scripts from running. I keep a separate directory for loginUI wallpapers since they need to meet the 256KB size requirement.
  
