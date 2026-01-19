<#
=============================================================================================
Name:           DNS Lookup
Description:    Pulls DNS information
Author:         Mike Norwood
Version:        1.0

Script Highlights: 
~~~~~~~~~~~~~~~~~
1. Customizeable menu for repeat actions without need to relogin every time
2. Presents choices for most used DNS records
3. Allows you to choose a specific DNS record not listed

============================================================================================
#>

Write-Host "What is the domain you are wanting DNS information on?" -ForegroundColor DarkCyan
$domain = Read-Host

function Show-Menu {
    Write-Host "==============================================" -ForegroundColor Magenta
    Write-Host "DNS Lookup Menu" -ForegroundColor Magenta
    Write-Host "==============================================" -ForegroundColor Magenta
    Write-Host "1. Do an A Record Lookup" -ForegroundColor Magenta
    Write-Host "2. Do an MX Record Lookup" -ForegroundColor Magenta
    Write-Host "3. Do an TXT Record Lookup" -ForegroundColor Magenta
    Write-Host "4. Do another type of DNS Lookup" -ForegroundColor Magenta
    Write-Host "Q. Exit Script" -ForegroundColor Magenta       
    Write-Host "==============================================" -ForegroundColor Magenta
}

do {
    Show-Menu 
    $Choice = Read-Host "Enter your choice"

    # Offboards user
    switch ($Choice) {
        "1" {
            try {
                Resolve-DnsName -Name $domain -Type A
            }
            catch {
                <#Do this if a terminating exception happens#>
            }
        }            
        "2" {
            try {
                Resolve-DnsName -Name $domain -Type MX
            }
            catch {
                <#Do this if a terminating exception happens#>
            }    
        }
        "3" {
            try {
                Resolve-DnsName -Name $domain -Type TXT
            }
            catch {
                <#Do this if a terminating exception happens#>
            }                
        }
        "4" {
            try {
                Write-Host "What type of DNS record are you wanting to look up? Example: SOA, SRV, PTR" -ForegroundColor DarkCyan
                Write-Host "Type your selection:" -ForegroundColor DarkCyan
                $dnsType = Read-Host
                Resolve-DnsName -Name $domain -Type $dnsType
            }
            catch {
                <#Do this if a terminating exception happens#>
            }    
        }
        # Exists script
        "Q" {
            Write-Host "Exiting script..." -ForegroundColor Yellow
            exit
        }
        default {
            Write-Host "Invalid choice. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($Choice -ne "Q")
