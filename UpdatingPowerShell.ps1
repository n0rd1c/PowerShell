<#
Upgrading PowerShell 
--------------------
For best results when upgrading, you should use the same install method you used when you first installed PowerShell. 
If you aren't sure how PowerShell was installed, you can check the value of the $PSHOME variable.
This always points to the directory containing PowerShell that the current session is running.
    If the value is $HOME\.dotnet\tools, PowerShell was installed with the .NET Global tool.
    If the value is $Env:ProgramFiles\PowerShell\7, PowerShell was installed as an MSI package or with WinGet on a computer with an X86 or x64 processor.
    If the value starts with $Env:ProgramFiles\WindowsApps\, PowerShell was installed as a Microsoft Store package or with WinGet on computer with an ARM processor.
    If the value is anything else, it's likely that PowerShell was installed as a ZIP package.
#>

# Checks where PowerShell is installed
$PSHOME

#This will check to see if there are any updates/upgrades available
winget list --id Microsoft.PowerShell --upgrade-available

#This will upgrade powershell using MSI/winget
winget upgrade --id Microsoft.PowerShell