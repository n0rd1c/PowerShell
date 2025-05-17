<#
======================================================================================================================
Name:           GeneratingIPinfoXMLfile
Description:    Creates XML file to use in GettingInfoFromIPInfo.ps1
Author:         n0rd1c
Version:        1.0
======================================================================================================================

1. Create  an account at ipinfo.io
2. Find your token on the Dashboard page under 'API Token' - This will be your password for later
3. Create an empty file named token.xml
3. You only need to run this one time to generate the contents for the XML
4. The user name it prompts you for doesnt matter
5. The  password is your token from ipinfo.io
#>

$token=Get-Credential
$token | Export-Clixml -Path "D:\n0rd1c's stuff\PowerShell Code\ipinfo\token.xml"

