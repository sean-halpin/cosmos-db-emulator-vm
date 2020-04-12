Write-Output "Intalling Cosmos DB Emulator"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/cosmosdb-emulator', 'C:\vagrant\cosmos.msi')
Start-Process -wait C:\vagrant\cosmos.msi -ArgumentList "/quiet"

Write-Output "Installing NSSM"
(New-Object System.Net.WebClient).DownloadFile('https://nssm.cc/release/nssm-2.24.zip', 'C:\vagrant\nssm.zip')
Expand-Archive C:\vagrant\nssm.zip -DestinationPath C:\vagrant\nssm -Force

Write-Output "Installing Cosmos DB Emulator as a Service"
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe install cosmosdbemulator "C:\vagrant\service_startup.cmd"
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe set cosmosdbemulator Start SERVICE_DELAYED_AUTO_START
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe set cosmosdbemulator Type SERVICE_INTERACTIVE_PROCESS
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe start cosmosdbemulator

Write-Output "Setting Service Failure Actions"
Set-ItemProperty -Name 'FailureActions' -Path 'HKLM:\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cosmosdbemulator' -Value ([byte[]](0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x3,0x0,0x0,0x0,0x14,0x0,0x0,0x0,0x1,0x0,0x0,0x0,0x60,0xea,0x0,0x0,0x1,0x0,0x0,0x0,0x60,0xea,0x0,0x0,0x1,0x0,0x0,0x0,0x60,0xea,0x0,0x0))

Write-Output "Disabling Windows Firewall"
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

Write-Output "Installing SQLLocalDB"
(New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/8/D/D/8DD7BDBA-CEF7-4D8E-8C16-D9F69527F909/ENU/x64/SqlLocalDB.MSI', 'C:\vagrant\SqlLocalDB.MSI')
Start-Process -wait msiexec -ArgumentList "/i","C:\vagrant\SqlLocalDB.MSI","/qn","IACCEPTSQLLOCALDBLICENSETERMS=YES"
& "C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SqlLocalDB.exe create MSSQLLocalDB"
& "C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SqlLocalDB.exe start MSSQLLocalDB"

Write-Output "Installing Azure Storage Emulator"
(New-Object System.Net.WebClient).DownloadFile('https://go.microsoft.com/fwlink/?linkid=717179&clcid=0x409', 'C:\vagrant\az_storage_emulator.msi')
Start-Process -wait C:\vagrant\az_storage_emulator.msi -ArgumentList "/quiet"

Write-Output "Done"
