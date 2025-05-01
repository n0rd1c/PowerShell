<#
======================================================================================================================
Name:           CheckModuleInstallation
Description:    Will check to see if specified module is installed and install if not present
Author:         n0rd1c
Version:        1.0

Script Highlights:
~~~~~~~~~~~~~~~~~
1. Script checks to see if module is installed
2. If it is installed, shows green text and version number
3. If not installed, shows red
4. Then asks if you wish to install the latest module
5. Provides you with the code to install a specific version of the module.  All you have to add is the version number.
======================================================================================================================
#>

# name of the module to be checked
$moduleName = $(Write-Host -NoNewLine) + $(Write-Host "Please enter the name of the module you are looking for: " -ForegroundColor Yellow -NoNewLine; Read-Host)

# checks if module is installed
if (Get-Module -Name $moduleName -ListAvailable) {
    # Get the installed version of the Exchange Online PowerShell module
    $moduleVersion = (Get-Module -Name $moduleName -ListAvailable).Version
    
    Write-Host "$moduleName module is installed." -ForegroundColor Green
    Write-Host "Version: $moduleVersion" -ForegroundColor Green
} else {
    Write-Host "$moduleName module is not installed." -ForegroundColor Red
    $response = $(Write-Host -NoNewLine) + $(Write-Host "Do you wish to install the latest version of the module? (Y/N)" -ForegroundColor Yellow -NoNewLine; Read-Host)
        if ($response -match '^[Yy]') {
    Write-Host "Installing the latest module..." -ForegroundColor Blue
    Install-Module -Name $moduleName -Force -Scope CurrentUser -AllowClobber
    Write-Host "$moduleName has been installed" -ForegroundColor Green
    Get-Module -Name $moduleName
        } else {
    Write-Host "Installation cancelled.  " -ForegroundColor Red -NoNewLine; Write-Host "If you wish to install a specific version use:" -ForegroundColor Yellow
    Write-Host "Install-Module -Name $moduleName -RequiredVersion <versionNumber> -Force -Scope CurrentUser" -ForegroundColor Magenta
    }
}