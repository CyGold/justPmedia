#!/bin/bash

# variables
RESOURCE_GROUP_NAME="myResourceGroup"  # Name of the resource group
STORAGE_ACCOUNT_NAME="staticweb$RANDOM"  # Unique name for the storage account

az storage account delete --name $STORAGE_ACCOUNT_NAME --resource-group 
$RESOURCE_GROUP_NAME --yes 

(you might also want to add error handling to check if the account was deleted successfully.)
az group delete --name $RESOURCE_GROUP_NAME --yes --no-wait

learn how to host a static website in Azure Storage. To follow this example, you should also deploy Azure CDN.