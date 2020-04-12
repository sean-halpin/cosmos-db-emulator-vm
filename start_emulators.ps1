Write-Output "Starting Azure Emulator Services"

Import-Module -Name "C:\Program Files\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator" -Verbose

$cosmosStatus = "Stopped"
Do {
    # $cosmosStatus = Get-CosmosDbEmulatorStatus
    $date1 = Get-Date -Date "01/01/1970"
    $date2 = Get-Date
    $epoch = (New-TimeSpan -Start $date1 -End $date2).TotalSeconds
    Add-Content C:\loop.txt $epoch

    Start-Sleep -s 60
    Start-CosmosDbEmulator -AllowNetworkAccess -NoFirewall -NoUI -Key C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw== 

    cmd.exe /c "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe init /forceCreate"
    cmd.exe /c "C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe start"
    
} while($true)
# } while($cosmosStatus -eq "Stopped")