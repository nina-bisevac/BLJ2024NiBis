# Retrieve a list of all the members (methods and properties) of the Get-ChildItem cmdlet.
# Use Get-ChildItem to retrieve a list of the files in the current directory and the Get-Member cmdlet to retrieve a list of all the members
Get-Command Get-ChildItem | Get-Member

# Retrieve a list of all the files in the current directory and then sort them ascending by size. 
# Use the Get-ChildItem cmdlet to retrieve the list of files and the Sort-Object cmdlet to sort them by size.
Get-ChildItem | Where-Object { -not $_.PSIsContainer } | Sort-Object Length


# Retrieve a list of all the processes currently running on the computer and then select the processes that have a high CPU usage (>50%). 
# Use the Get-Process cmdlet to retrieve the list of processes and the Where-Object cmdlet to select only the processes with a high CPU usage.
Get-Process | Where-Object { $_.CPU -gt 50 }


# Retrieve a list of all the services and select only the processes which are running. Display only the service name and the service description.
# Use the Get-Service cmdlet to retrieve a list of all services, the Where-Object cmdlet to select running processes and the Select-Object cmdlet to display  the service name and the service description.
Get-Service | Where-Object { $_.Status -eq "Running" } | Select-Object DisplayName, Description


# Retrieve a list of all the processes on the computer and then stop the processes that contain "Team" in the name. 
Get-Process | Where-Object { $_.Name -like "*Team*" } | Stop-Process


# Retrieve a list of all the local users username and last logon time and sort them by their last logon time. Don't list users, which have never logged on.
Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} | 
    ForEach-Object {
        $xml = [xml]$_.ToXml()
        $time = $xml.Event.EventData.Data | Where-Object {$_.Name -eq "SubjectLogonId"} | ForEach-Object {([datetime]$_.InnerText)}
        $user = $xml.Event.EventData.Data | Where-Object {$_.Name -eq "TargetUserName"} | ForEach-Object {($_.InnerText)}
        [PSCustomObject]@{
            Username = $user
            LastLogon = $time
        }
    } | Sort-Object -Property LastLogon


# Retrieve a list of all the files in the current directory and then select the files that have been modified in the past week. Sort them by their modification date.
Get-ChildItem | Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) } | Sort-Object LastWriteTime


