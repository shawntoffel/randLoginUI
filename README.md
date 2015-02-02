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

    -windowstyle hidden -noprofile -executionpolicy bypass -file "PATH_TO_randLoginUI.ps1" WALL_DIRECTORY
  
I bypass the execution policy since the default is typically "Restricted", which prevents all scripts from running. WALL_DIRECTORY is the location of the wallpapers the script will choose from. I keep a separate directory since they must meet the 256KB size requirement.
  
