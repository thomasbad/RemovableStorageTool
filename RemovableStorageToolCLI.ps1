#Created by Thomas Hon aka mka
#Licensed with GNU Lesser General Public License v2.1
# Ask if the script have run as admin, if not, run as admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
# PowerShell Window Title
$host.UI.RawUI.WindowTitle = "Removable Storage Tool"

#Put your code below

function Display-Menu {
    Clear-Host
    Write-Host @'
    
 ____  ____    _____  ____  ____  _    
/  __\/ ___\  /__ __\/  _ \/  _ \/ \   
|  \/||    \    / \  | / \|| / \|| |   
|    /\___ |    | |  | \_/|| \_/|| |_/\
\_/\_\\____/    \_/  \____/\____/\____/

---------------------------------------------------------------------------------                                       
Tool to enable / disable the removable storage access on access PC.
If you use it to temporary enable the access on domain GPO controlled PC,
remember to run "gpupdate" after use.
All change needs to reboot PC once to apply.
---------------------------------------------------------------------------------
Press 1 - Disable all removable storage access (Will override all other change)
Press 2 - Enable all removable storage access (Will override all other change)
Press 3 - Disable all removable storage write access only
Press 4 - Enable all removable storage write access only
Press 5 - Disable removable storage access within remote desktop session
Press 6 - Enable removable storage access within remote desktop session
Press 7 - Reset all settings back to Windows default
Press 8 - Reboot PC
Press 9 - Update Group Policy
Press 0 - Exit the tool
---------------------------------------------------------------------------------
'@
Choice-Forward
}

function Choice-Forward {
    $Choice = Read-Host -Prompt 'Input your selection'
    switch -Exact ($Choice)
    {
        '1' {
            Clear-Host
            DisableAll
            if($?)
                {
                Clear-Host
                '===================COMPLETED==================='
                '-----------------------------------------------'
                '      All Removable Storage access disabled    '
                '   Please reboot the PC to activate the change '
                '-----------------------------------------------'
                '==========PRESS ANY KEY TO BACK TO MENU========'
                Read-Host
                Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }            
             }
        '2' {
            Clear-Host
            EnableAll
            if($?)
                {
                Clear-Host
                '===================COMPLETED==================='
                '-----------------------------------------------'
                '      All Removable Storage access enabled     '
                '   Please reboot the PC to activate the change '
                '-----------------------------------------------'
                '==========PRESS ANY KEY TO BACK TO MENU========'
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }            
            }
        '3' {
            Clear-Host
            DisableWT
            if($?)
                {
                Clear-Host
                '===================COMPLETED==================='
                '-----------------------------------------------'
                '    Removable Storage write access disabled    '
                '   Please reboot the PC to activate the change '
                '-----------------------------------------------'
                '==========PRESS ANY KEY TO BACK TO MENU========'
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }            
            }
        '4' {
            Clear-Host
            EnableWT
            if($?)
                {
                Clear-Host
                '===================COMPLETED==================='
                '-----------------------------------------------'
                '     Removable Storage write access disabled   '
                '   Please reboot the PC to activate the change '
                '-----------------------------------------------'
                '==========PRESS ANY KEY TO BACK TO MENU========'
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }            
            }
        '5' {
            Clear-Host
            DisableRemote
            if($?)
                {
                Clear-Host
                '======================COMPLETED========================'
                '-------------------------------------------------------'
                '     Removable Storage from remote session disabled    '
                '       Please reboot the PC to activate the change     '
                '-------------------------------------------------------'
                '=============PRESS ANY KEY TO BACK TO MENU============='
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }            
            }
        '6' {
            Clear-Host
            EnableRemote
            if($?)
                {
                Clear-Host
                '======================COMPLETED========================'
                '-------------------------------------------------------'
                '     Removable Storage from remote session enabled    '
                '       Please reboot the PC to activate the change '
                '-------------------------------------------------------'
                '=============PRESS ANY KEY TO BACK TO MENU============='
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }             
            }
         '7' {
             Clear-Host
             ResetSetting
             if($?)
                {
                Clear-Host
                '======================COMPLETED========================'
                '-------------------------------------------------------'
                '       All Setting revert back to Windows default      '
                '       Please reboot the PC to activate the change     '
                '-------------------------------------------------------'
                '=============PRESS ANY KEY TO BACK TO MENU============='
            Read-Host
            Display-Menu
                }
            else
                {
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                Write-Host "Error detected, please ensure this script is started with admin rights, or investage the error above" -ForegroundColor yellow
                }           
            }
         '8' {
             Clear-Host
             RebootPC
             Clear-Host
            '========================Cancel========================='
            '-------------------------------------------------------'
            '                    Reboot Canceled                    '
            '-------------------------------------------------------'
            '=============PRESS ANY KEY TO BACK TO MENU============='
            Read-Host
            Display-Menu
            }
        '9' {
             Clear-Host
             gpupdate /Force
             Clear-Host
                '======================COMPLETED========================'
                '-------------------------------------------------------'
                '                  Group Policy Updated                 '
                '       Please reboot the PC to activate the change     '
                '-------------------------------------------------------'
                '=============PRESS ANY KEY TO BACK TO MENU============='
            Read-Host
            Display-Menu
            }
         '0' {
              Exit
             }
        default {
                 Write-Warning '============INVALID INPUT============'
                 Write-Warning '-------------------------------------'
                 Write-Warning 'Please select a number from the Main'
                 Write-Warning 'Menu [1 - 9], or select [0] to quit.'
                 Write-Warning '-------------------------------------'
                 Write-Warning '======PRESS ANY KEY TO CONTINUE======'
                 Read-Host
                 Clear-host
                 Display-Menu
                }
    }
}

#-----[functions area]------

#Disable all
function DisableAll {
    #This change will override all other buttons settings:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_All" -PropertyType DWord -Value "1" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
    }

#Enable all
function EnableAll {
    #This change will override all other buttons settings:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_All" -PropertyType DWord -Value "0" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "0" -Force
    }

#Disable Write Access
function DisableWT { 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    #CD/DVD:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56308-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56308-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    #Floppy
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56311-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56311-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    #USB Disk
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    #Tape Drive 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    #WPD Devices
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{6AC27878-A6FA-4155-BA85-F98F491D4F33}" -Force
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{F33FDC04-D1AC-4E8E-9A30-19BBD4B108AE}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{6AC27878-A6FA-4155-BA85-F98F491D4F33}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{F33FDC04-D1AC-4E8E-9A30-19BBD4B108AE}" -Name "Deny_Write" -PropertyType DWord -Value "1" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
    }
      
#Enable Write Access
function EnableWT { 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    #CD/DVD:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56308-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56308-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    #Floppy
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56311-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f56311-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    #USB Disk
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    #Tape Drive 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630b-b6bf-11d0-94f2-00a0c91efb8b}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    #WPD Devices
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{6AC27878-A6FA-4155-BA85-F98F491D4F33}" -Force
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{F33FDC04-D1AC-4E8E-9A30-19BBD4B108AE}" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{6AC27878-A6FA-4155-BA85-F98F491D4F33}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices\{F33FDC04-D1AC-4E8E-9A30-19BBD4B108AE}" -Name "Deny_Write" -PropertyType DWord -Value "0" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
    }

#Disable Remote Removable Storage access
function DisableRemote { 
    #Removable Storage to Remote Session
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
    }

#Enable Remote Removable Storage access
function EnableRemote {
    #Removable Storage to Remote Session
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "0" -Force
    }

#Reboot PC with confirmation
function RebootPC { 
  $rebootConfirm = Read-Host "Are you sure you have saved all your documents and ready to boot?  [Y/N]"
  
  if ($rebootConfirm -eq 'y', 'Y', 'yes', 'YES', 'Yes')
    {
        Restart-Computer
    }
    else
    {
        #Do Nothing
    }
}

#Reset all settings
function ResetSetting {
  #Check if any change have been made before 
  $testPath = test-path -path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices"
  if(-not($testPath))
    {
        Clear-Host
        Write-Host @'
==========================Cancel===========================
-----------------------------------------------------------
The Setting is already Windows default, no change have made
            Press any key to get back to menu                    
-----------------------------------------------------------
===============PRESS ANY KEY TO BACK TO MENU===============
        
'@ -ForegroundColor yellow
        Read-Host
        Display-Menu
    }
  else
    {
        Remove-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force -Recurse
    }  
}

Display-Menu
