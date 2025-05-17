<#
======================================================================================================================
Name:           GettingInfoFromIPinfo
Description:    Pulls info from ipinfo.io
Author:         n0rd1c
Version:        1.0

Script Highlights:
~~~~~~~~~~~~~~~~~
1. Pulls info from ipinfo.io using an API - setup a free account
2. Requires an XML file to be created - use GeneratingIPinfoXMLfile.ps1 to generate it
3. Asks user for IP to look up and returns results
======================================================================================================================
#>

<#
Initial code before turning it into a function

$token=Import-Clixml -Path "D:\n0rd1c's stuff\PowerShell Code\ipinfo\token.xml"
$ipAddress="184.174.142.16"
$apiURI="https://api.ipinfo.io/lite/$($ipAddress)?token=$($token.GetNetworkCredential().Password)"
Invoke-RestMethod -Uri $apiURI  | Format-Table
#>

function  Get-IPInfo{
    [CmdletBinding()]
    Param(
        [string]$ipAddress
    )
    $token=Import-Clixml -Path "D:\n0rd1c's stuff\PowerShell Code\ipinfo\token.xml"

    $apiURI="https://api.ipinfo.io/lite/$($ipAddress)?token=$($token.GetNetworkCredential().Password)"
    
    Invoke-RestMethod -Uri $apiURI    
}

Write-Host "What IP Address do you want to look up?"  -ForegroundColor Blue
$ip = Read-Host
Get-IPInfo -ipAddress $ip