#https://aka.ms/cosmosdb-emulator
(New-Object System.Net.WebClient).DownloadFile('https://aka.ms/cosmosdb-emulator', 'cosmos.msi')

Write-Output "Intalling Cosmos DB Emulator"
Start-Process -wait cosmos.msi -ArgumentList "/quiet"

Copy-Item "C:\vagrant\startup.cmd" -Destination "C:\Users\vagrant\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Output "Done"

#(New-Object System.Net.WebClient).DownloadFile('http://nssm.cc/release/nssm-2.24.zip', 'nssm.zip')
#Expand-Archive C:\vagrant\nssm.zip -DestinationPath C:\vagrant\nssm
#C:\vagrant\nssm\nssm-2.24\win64\nssm.exe install cosmosdbemulator "C:\Program Files\Azure Cosmos DB Emulator\Microsoft.Azure.Cosmos.Emulator.exe" /AllowNetworkAccess /Key=C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw==

