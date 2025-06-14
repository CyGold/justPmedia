#!/bin/bash

set -e  # Exit immediately on any error
set -o pipefail  # Catch errors in piped commands

# Variables
RESOURCE_GROUP="myResourceGroup" # Name of the resource group
STORAGE_ACCOUNT="staticweb$RANDOM"  # Unique name for the storage account
LOCATION="eastus" 
CONTAINER_NAME="\$web"  # reserved container for static websites
LOCAL_FOLDER="./site"  # Replace with your website folder /mnt/c/Users/Hp/Desktop/projects/capstone/website/justPmedia

# error handling function
handle_error() {
    echo "error occurred at line $1."
    exit 1
}
trap 'handle_error $LINENO' ERR

# azure login
az login --only-show-errors > /dev/null

echo "Azure CLI login successful."

# Check if local folder exists
if [ ! -d "$LOCAL_FOLDER" ]; then
    echo " '$LOCAL_FOLDER' does not exist. exiting..."
    exit 1
fi

echo " '$LOCAL_FOLDER' found."

# create resource group
az group create --name $RESOURCE_GROUP --location $LOCATION
echo "$RESOURCE_GROUP created successfully."

# Create storage account
az storage account create --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --location eastus --sku Standard_LRS --kind StorageV2
echo "$STORAGE_ACCOUNT created successfully."

# Enable static website hosting
az storage blob service-properties update --account-name $STORAGE_ACCOUNT --static-website --index-document index.html
echo "Static website hosting enabled for storage account: $STORAGE_ACCOUNT"

# Upload files to Blob Storage
az storage blob upload-batch --account-name $STORAGE_ACCOUNT --destination $CONTAINER_NAME --source $LOCAL_FOLDER --overwrite
echo "Files uploaded to $STORAGE_ACCOUNT."

sleep 5 

PUBLIC_URL=$(az storage account show --name $STORAGE_ACCOUNT --query "primaryEndpoints.web" --output tsv)
echo "Your static website is hosted at: $PUBLIC_URL"

sleep 5

az ad sp create-for-rbac --name "github-actions-deployer" --role Contributor --scopes /subscriptions/<YOUR_SUBSCRIPTION_ID>/resourceGroups/<YOUR_RESOURCE_GROUP_NAME> --sdk-auth
echo "Service principal created for GitHub Actions deployment."