Write-Output "Starting Azure Emulator Services"

Start-Process -wait SQLLocalDb -ArgumentList "create","MSSQLLocalDb"
Start-Process -wait SQLLocalDb -ArgumentList "start","MSSQLLocalDb"

Start-Process -wait "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe" -ArgumentList "init","/forceCreate"
Start-Process -wait "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe" -ArgumentList "start"

Import-Module -Name "C:\Program Files\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator" -Verbose

$cosmosStatus = "Stopped"
Do {
    $cosmosStatus = Get-CosmosDbEmulatorStatus
    Start-CosmosDbEmulator -AllowNetworkAccess -NoFirewall -NoUI -Key C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw== 
} while($cosmosStatus -eq "Stopped")
