# Hide PowerShell Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

#-----[functions area]------

#Disable all
function DisableAll {
    #This change will override all other buttons settings:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_All" -PropertyType DWord -Value "1" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
}

#Enable all
function EnableAll { 
    #This change will override all other buttons settings:
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "Deny_All" -PropertyType DWord -Value "0" -Force
    #Removable Storage to Remote Session
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "0" -Force
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
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
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
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
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
}

#Disable Remote Removable Storage access
function DisableRemote { 
    #Removable Storage to Remote Session
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "1" -Force
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
}

#Enable Remote Removable Storage access
function EnableRemote { 
    #Removable Storage to Remote Session
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Name "AllowRemoteDASD" -PropertyType DWord -Value "0" -Force
  if($?)
  {
    $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
  }
  else
  {
    $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
  }
}

#Reboot PC with confirmation
function RebootPC { 
  $RebootMsg                    = [System.Windows.MessageBox]::Show($RebootMsgbody,$RebootMsgTitle,$ButtonBool,$RebootMsgIcon)
  if ($RebootMsg -eq 'Yes')
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
    $ExistMsgTitle               = “Already Default Setting”
    $ExistMsgbody                = “The setting is already Windows Default, no change have made.”
    $ExistMsgIcon                = [System.Windows.MessageBoxImage]::Information
    $ExistMsg                    = [System.Windows.MessageBox]::Show($ExistMsgbody,$ExistMsgTitle,$ButtonOK,$ExistMsgIcon)
    }
  else
    {
        Remove-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\RemovableStorageDevices" -Force  
        if($?)
        {
        $SuccssMsg                    = [System.Windows.MessageBox]::Show($SuccessMsgbody,$SuccessMsgTitle,$ButtonOK,$SuccessMsgIcon)
        }
        else
        {
        $FailMsg                      = [System.Windows.MessageBox]::Show($FailMsgbody,$FailMsgTitle,$ButtonOK,$FailMsgIcon)
        }
    }  
}

# Init PowerShell Gui
Add-Type -AssemblyName System.Windows.Forms
# Create a new form
$Form                    = New-Object system.Windows.Forms.Form
# Define the size, title and background color
$Form.ClientSize         = '500,300'
$Form.text               = "Removable Storage Disable Tool"
$Form.BackColor          = "#ffffff"

#GUI Start Here

$Titel                           = New-Object system.Windows.Forms.Label
$Titel.text                      = "Removable Storage Disable Tool"
$Titel.AutoSize                  = $true
$Titel.width                     = 25
$Titel.height                    = 10
$Titel.location                  = New-Object System.Drawing.Point(20,10)
$Titel.Font                      = 'Microsoft Sans Serif,13'
$Description                     = New-Object system.Windows.Forms.Label
$Description.text                = "Run this program as admin.`nTo Enable/Disable all kind of removable storage inculding USB Drive, Floppy, CD/DVD, WPD devices and Tape drives access."
$Description.AutoSize            = $false
$Description.width               = 450
$Description.height              = 50
$Description.location            = New-Object System.Drawing.Point(20,40)
$Description.Font                = 'Microsoft Sans Serif,10'
$HTUWarn                         = New-Object system.Windows.Forms.Label
$HTUWarn.text                    = "Please ensure the PC needs to reboot to make the change activcated."
$HTUWarn.AutoSize                = $true
$HTUWarn.location                = New-Object System.Drawing.Point(20,100)
$HTUWarn.Font                    = 'Microsoft Sans Serif,10,style=Bold'

#-----------------[ Buttons ]------------------

#Add Buttons
#Disable All Button
$DisableAllBtn                   = New-Object system.Windows.Forms.Button
$DisableAllBtn.BackColor         = "#E32D4E"
$DisableAllBtn.text              = "Disable All Access`n(Override all setting)"
$DisableAllBtn.width             = 150
$DisableAllBtn.height            = 50
$DisableAllBtn.location          = New-Object System.Drawing.Point(20,120)
$DisableAllBtn.Font              = 'Microsoft Sans Serif,10'
$DisableAllBtn.ForeColor         = "#ffffff"
$DisableAllBtn.Add_Click({ DisableAll })
$Form.Controls.Add($DisableAllBtn)


#Enable All Button
$EnableAllBtn                    = New-Object system.Windows.Forms.Button
$EnableAllBtn.BackColor          = "#54BF26"
$EnableAllBtn.text               = "Enable All Access`n(Override all setting)"
$EnableAllBtn.width              = 150
$EnableAllBtn.height             = 50
$EnableAllBtn.location           = New-Object System.Drawing.Point(200,120)
$EnableAllBtn.Font               = 'Microsoft Sans Serif,10'
$EnableAllBtn.ForeColor          = "#ffffff"
$EnableAllBtn.Add_Click({ EnableAll })
$Form.Controls.Add($EnableAllBtn)

#Disable Write Access Button
$DisableWTBtn                    = New-Object system.Windows.Forms.Button
$DisableWTBtn.BackColor          = "#E32D4E"
$DisableWTBtn.text               = "Disable Write Access Only"
$DisableWTBtn.width              = 150
$DisableWTBtn.height             = 50
$DisableWTBtn.location           = New-Object System.Drawing.Point(20,175)
$DisableWTBtn.Font               = 'Microsoft Sans Serif,10'
$DisableWTBtn.ForeColor          = "#ffffff"
$DisableWTBtn.Add_Click({ DisableWT })
$Form.Controls.Add($DisableWTBtn)


#Enable All Button
$EnableWTBtn                    = New-Object system.Windows.Forms.Button
$EnableWTBtn.BackColor          = "#54BF26"
$EnableWTBtn.text               = "Enable Write Access Only"
$EnableWTBtn.width              = 150
$EnableWTBtn.height             = 50
$EnableWTBtn.location           = New-Object System.Drawing.Point(200,175)
$EnableWTBtn.Font               = 'Microsoft Sans Serif,10'
$EnableWTBtn.ForeColor          = "#ffffff"
$EnableWTBtn.Add_Click({ EnableWT })
$Form.Controls.Add($EnableWTBtn)

#Disable Remote Removable Storage access
$DisableRemoteBtn                    = New-Object system.Windows.Forms.Button
$DisableRemoteBtn.BackColor          = "#E32D4E"
$DisableRemoteBtn.text               = "Disable Removable Storage Access tho Remote session"
$DisableRemoteBtn.width              = 150
$DisableRemoteBtn.height             = 60
$DisableRemoteBtn.location           = New-Object System.Drawing.Point(20,230)
$DisableRemoteBtn.Font               = 'Microsoft Sans Serif,10'
$DisableRemoteBtn.ForeColor          = "#ffffff"
$DisableRemoteBtn.Add_Click({ DisableRemote })
$Form.Controls.Add($DisableRemoteBtn)


#Enable Remote Removable Storage access
$EnableRemoteBtn                    = New-Object system.Windows.Forms.Button
$EnableRemoteBtn.BackColor          = "#54BF26"
$EnableRemoteBtn.text               = "Enable Removable Storage Access tho Remote session"
$EnableRemoteBtn.width              = 150
$EnableRemoteBtn.height             = 60
$EnableRemoteBtn.location           = New-Object System.Drawing.Point(200,230)
$EnableRemoteBtn.Font               = 'Microsoft Sans Serif,10'
$EnableRemoteBtn.ForeColor          = "#ffffff"
$EnableRemoteBtn.Add_Click({ EnableRemote })
$Form.Controls.Add($EnableRemoteBtn)

#Reboot Button
$RebootBtn                    = New-Object system.Windows.Forms.Button
$RebootBtn.BackColor          = "#BF26AC"
$RebootBtn.text               = "Reboot Computer"
$RebootBtn.width              = 100
$RebootBtn.height             = 40
$RebootBtn.location           = New-Object System.Drawing.Point(380,150)
$RebootBtn.Font               = 'Microsoft Sans Serif,10'
$RebootBtn.ForeColor          = "#ffffff"
$RebootBtn.Add_Click({ RebootPC })
$Form.Controls.Add($RebootBtn)

#Reset Button
$ResetBtn                    = New-Object system.Windows.Forms.Button
$ResetBtn.BackColor          = "#BF26AC"
$ResetBtn.text               = "Reset All Setting"
$ResetBtn.width              = 100
$ResetBtn.height             = 40
$ResetBtn.location           = New-Object System.Drawing.Point(380,200)
$ResetBtn.Font               = 'Microsoft Sans Serif,10'
$ResetBtn.ForeColor          = "#ffffff"
$ResetBtn.Add_Click({ ResetSetting })
$Form.Controls.Add($ResetBtn)


# ---------------[ Message Box ] ------------------
Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonBool                   = [System.Windows.MessageBoxButton]::YesNo
$ButtonOK                     = [System.Windows.MessageBoxButton]::OK

#Config Success

$SuccessMsgTitle              = “Done”
$SuccessMsgbody               = “Configuration Success”
$SuccessMsgIcon               = [System.Windows.MessageBoxImage]::Information


#Config Fail
$FailMsgTitle                 = “Fail”
$FailMsgbody                  = “Configuration Failed ! `nPlease check if you have Admin Right or use Run as Admin to run this program.`nOr reset all setting first before apply the new setting again.”
$FailMsgIcon                  = [System.Windows.MessageBoxImage]::Error


#Reboot Confirmation
$RebootMsgTitle               = “Reboot Confirm”
$RebootMsgbody                = “Are you sure you have saved all your documents and ready to reboot?”
$RebootMsgIcon                = [System.Windows.MessageBoxImage]::Warning
#$RebootMsg                    = [System.Windows.MessageBox]::Show($RebootMsgbody,$RebootMsgTitle,$ButtonBool,$RebootMsgIcon)


# ADD OTHER ELEMENTS ABOVE THIS LINE IF NEEDED
# Add the elements to the form
$Form.controls.AddRange(@($Titel,$Description,$HTUWarn))


# Display the form
[void]$Form.ShowDialog()
