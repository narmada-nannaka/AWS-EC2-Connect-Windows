﻿# ========================================================================
# The below script will automatically connect the specified EC2 instance 
#  via SSH from your Windows 10 (or more).
# =========================================================================
#
#
#
# Author: Narmada Chowdary Nannaka
# Date: 01/02/2021
#
#
#NOTE:  Update the below parameters with you EC2 details before running this script.

#Parameters for Running the script
[string] $keyFile = "C:\AWS\ec2KeyPair.pem"
[string] $publicip = "ec2-user@XX.xXX.xXX.xxX" #update the public ip address here


#view the security key file permissions
Write-Host "Current ACL permissions to the security file:"
Get-Acl $keyFile | fl

#add current user with full control to the security file
$acl = Get-Acl $keyFile
$uName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($uName,"FullControl","Allow")
$acl.SetAccessRule($accessRule)
$acl | Set-Acl $keyFile

#Delete inherited permissions
$acl.SetAccessRuleProtection($true,$false)
$acl | Set-Acl $keyFile

Write-Host "ACL Permissions after disabling inheritance and adding full control access to current user:"
Get-Acl $keyFile | fl

# ssh to the ec2-instance
ssh -i $keyFile $publicip
