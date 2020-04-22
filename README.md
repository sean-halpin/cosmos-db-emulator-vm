# Provision VM & Access Desktop

### Start VM

`vagrant up`

### Reprovision - reboot & run provision.ps1 again

`vagrant reload --provision`

### RDP to the VM

`xfreerdp /cert-ignore /u:vagrant /p:vagrant /v:127.0.0.1:33389`

# Azure Comsos Emulator

### Cosmos Web UI

`https://localhost:8081/_explorer/index.html`

### Key

`C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw==`

### Screenshots

![alt text](/imgs/az_cosmos_1.jpg)

![alt text](/imgs/az_cosmos_2.jpg)

# Azure Storage Emulator

### Credentials 

```
Account name: devstoreaccount1
Account key: Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==
```

### Endpoints

The service endpoints for the storage emulator are:
 - Blob service: http://127.0.0.1:10000/<account-name>/<resource-path>
 - Queue service: http://127.0.0.1:10001/<account-name>/<resource-path>
 - Table service: http://127.0.0.1:10002/<account-name>/<resource-path>


### Connection Strings

 ```
 DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;
AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;
BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;
TableEndpoint=http://127.0.0.1:10002/devstoreaccount1;
QueueEndpoint=http://127.0.0.1:10001/devstoreaccount1;
```