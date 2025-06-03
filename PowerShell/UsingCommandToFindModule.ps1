<#
=============================================================================================
Name:           UsingCommandToFindModule
Description:    Uses a PowerShell command to locate the module that contains the command
Author:         n0rd1c
Version:        1.0
============================================================================================
#>

$commandName = $(Write-Host -NoNewLine) + $(Write-Host "Please enter the name of the command you wish to find the module for: " -ForegroundColor Yellow -NoNewLine; Read-Host)
Find-Command -Repository PSGallery $commandName | Select-Object Repository,Name,ModuleName