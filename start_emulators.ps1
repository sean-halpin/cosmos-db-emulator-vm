Write-Output "Starting Azure Emulator Services"

Import-Module -Name "C:\Program Files\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator" -Verbose

$cosmosStatus = "Stopped"
Do {
    # $cosmosStatus = Get-CosmosDbEmulatorStatus
    Start-CosmosDbEmulator -AllowNetworkAccess -NoFirewall -NoUI -Key C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw== 

    cmd.exe /c "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe init /forceCreate"
    cmd.exe /c "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe start"
    Start-Sleep -s 15
    
} while($cosmosStatus -eq "Stopped")
