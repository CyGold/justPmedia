az ad sp delete --id <SERVICE_PRINCIPAL_ID> #delete the service principle
az storage account delete --name <STORAGE_ACCOUNT_NAME> --resource-group <RESOURCE_GROUP_NAME> --yes (you might also want to add error handling to check if the account was deleted successfully.)
az group delete --name <RESOURCE_GROUP_NAME> --yes --no-wait