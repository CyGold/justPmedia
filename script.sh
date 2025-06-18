#!/bin/bash

set -e  # Exit immediately on any error
set -o pipefail  # Catch errors in piped commands

# Variables
RESOURCE_GROUP="myResourceGroup" # Name of the resource group
STORAGE_ACCOUNT="staticweb$RANDOM"  # Unique name for the storage account
LOCATION="eastus" 
CONTAINER_NAME="\$web"  # reserved container for static websites
LOCAL_FOLDER="/mnt/c/Users/Hp/Desktop/projects/capstone/website/justPmedia/website" 
SP_NAME="github-actions-static"  # service principal name.

az login

# error handling function
handle_error() {
    echo "error occurred at line $1."
    exit 1
}
trap 'handle_error $LINENO' ERR

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

az storage blob upload-batch --account-name $STORAGE_ACCOUNT --destination $CONTAINER_NAME --source $LOCAL_FOLDER --auth-mode login
echo "Files uploaded to $STORAGE_ACCOUNT."

sleep 5 

PUBLIC_URL=$(az storage account show --name $STORAGE_ACCOUNT --query "primaryEndpoints.web" --output tsv)
echo "Your static website is hosted at: $PUBLIC_URL"

sleep 5

# Prompt for the subscription ID.
read -p "Enter your Subscription ID: " SUBSCRIPTION_ID

# Construct the scope string.
SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"

# Notify the user about the process start.
echo "Creating service principal '$SP_NAME' with scope '$SCOPE'..."

# Create the service principal and output the JSON credentials.
az ad sp create-for-rbac --name "$SP_NAME" --role Contributor --scopes "$SCOPE" --sdk-auth

# Check if the command was successful.
if [ $? -eq 0 ]; then
    echo "✅ Service principal created successfully."
else
    echo "❌ Failed to create the service principal."
fi
