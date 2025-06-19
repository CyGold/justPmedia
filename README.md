#PREREQUSITE

-An Azure account with an active subscription. Create an account for free.
-A GitHub repository with your static website code.
-A working static website hosted in Azure Storage. Learn how to host a static website in Azure Storage. To follow this example, you should also deploy Azure CDN.

##SERVICE PRINCIPAL ##
In GitHub, go to your repository.
Go to Settings in the navigation menu.
Select Security > Secrets and variables > Actions.
Select New repository secret.
Paste the entire JSON output from the Azure CLI command into the secret's value field. Give the secret the name AZURE_CREDENTIALS.
Select Add secret.

@@@Use the Azure CLI action to upload your code to blob storage and to purge your CDN endpoint. For az storage blob upload-batch, replace the placeholder with your storage account name. The script will upload to the $web container. For az cdn endpoint purge, replace the placeholders with your CDN profile name, CDN endpoint name, and resource group. To speed up your CDN purge, you can add the --no-wait option to az cdn endpoint purge. To enhance security, you can also add the --account-key option with your storage account key.@@@

Create and configure an Azure Storage Account with Static Website hosting enabled.
Create a Service Principal (App Registration) in Microsoft Entra ID (formerly Azure Active Directory).
Assign appropriate roles to the Service Principal for accessing the storage account.
Set up a Service Connection in Azure DevOps using the Service Principal.
Create a Release Pipeline in Azure DevOps to deploy your static website.


[text](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-static-site-github-actions?source=recommendations&tabs=openid)
-Assign an appropriate role to your service principal by Azure portal, Azure CLI, or Azure PowerShell.
Configure a federated identity credential on a Microsoft Entra application to trust tokens issued by GitHub Actions to your GitHub repository.
chmod +x deploy_static.sh
./deploy_static.sh
az ad sp list --output table
az ad sp delete --id <SERVICE_PRINCIPAL_ID> #delete the service principle
az storage account delete --name <STORAGE_ACCOUNT_NAME> --resource-group <RESOURCE_GROUP_NAME> --yes (you might also want to add error handling to check if the account was deleted successfully.)
az group delete --name <RESOURCE_GROUP_NAME> --yes --no-wait




******
There are no credentials provided in your command and environment, we will query for account key for your storage account.
It is recommended to provide --connection-string, --account-key or --sas-token in your command as credentials.

You also can add `--auth-mode login` in your command to use Azure Active Directory (Azure AD) for authorization if your login account is assigned required RBAC roles.
For more information about RBAC roles in storage, visit https://learn.microsoft.com/azure/storage/common/storage-auth-aad-rbac-cli.

In addition, setting the corresponding environment variables can avoid inputting credentials in your command. Please use --help to get more information about environment variable usage.
_ log in
_welcome i am aisha yusuf
_spacing (word-spacing: normal and white-space: normal)(text-align: left/justify)
_hamburger

