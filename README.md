# AWS-EC2-Connect-Windows
Powershell script to automatically connect EC2 instance from Windows 10 (or more) supplied with a security key pair file.

*An alternative to **chmod400** for Windows run.*

![Screenshot of an example connection made using this script.](https://raw.githubusercontent.com/narmada-nannaka/AWS-EC2-Connect-Windows/main/SSH%20EC2%20Connect%20From%20Windows%2010.png)

## Pre-Requisites
1. Install OpenSSH.Client and OpenSSH.Server using [this link](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)
2. Powershell should have Microsoft.Powershell.Security Module installed. This script makes use of some of the cmdlets from this module. 

## How to run the script
1. Clone the code. 
2. Open the file in your local machine for editing.
3. Update the parameters section with the location of your secuirty keypair file and EC2 instance IP address.
4. Save the file. 
5. Open Powershell and run the script. 

## Troubleshooting Tips

### Powershell script cannot be loaded because running scripts is disabled on this system

Use the bypass command to run the script: _powershell.exe -ExecutionPolicy Bypass -File '.\ec2 Connect.ps1'_

### SSH is not recognized

Run the script on Windows Powershell and not on Windows Powershell x86

### Request timed out

- [ ] Ensure the inbound rules for the security group selected for the EC2 instance is configured with SSH and is open to your IP Address. 
- [ ] If it is open to internet, it should be as follows:

 Type | Protocol | Port Range | Source
 ---- | -------- | ---------- | ------
 SSH | TCP | 22| 0.0.0.0/0
 SSH| TCP | 22 | ::/0
 
 - [ ] Verify firewall settings 
