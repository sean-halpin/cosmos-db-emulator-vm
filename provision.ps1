#https://aka.ms/cosmosdb-emulator
(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/cosmosdb-emulator', 'C:\vagrant\cosmos.msi')

Write-Output "Intalling Cosmos DB Emulator"
Start-Process -wait C:\vagrant\cosmos.msi -ArgumentList "/quiet"

Write-Output "Installing NSSM"
(New-Object System.Net.WebClient).DownloadFile('http://nssm.cc/release/nssm-2.24.zip', 'C:\vagrant\nssm.zip')
Expand-Archive C:\vagrant\nssm.zip -DestinationPath C:\vagrant\nssm

Write-Output "Installing Cosmos DB Emulator as a Service"
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe install cosmosdbemulator "C:\vagrant\startup.cmd"
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe set cosmosdbemulator Start SERVICE_DELAYED_START
C:\vagrant\nssm\nssm-2.24\win64\nssm.exe set cosmosdbemulator Type SERVICE_INTERACTIVE_PROCESS

Write-Output "Done"
