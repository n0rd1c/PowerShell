# Is the host up and is that port open? ping and telnet in one command
Test-NetConnection host -Port 443

# like netstat 
# pipe to Get-Process and it will show you what program is using what port
Get-NetTCPConnection #| Get-Process

# Searches for a string in a file 
# useful for searching logs
Select-String -Pattern "error"

# tail -f
Get-Content app.log -Wait


#checks hash of file you download
Get-FileHash setup.exe


# outgrid
Get-Process | Out-GridView

# search for commands
Get-Command -Name *Get-Process*