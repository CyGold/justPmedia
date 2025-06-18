Create and configure an Azure Storage Account with Static Website hosting enabled.
Create a Service Principal (App Registration) in Microsoft Entra ID (formerly Azure Active Directory).
Assign appropriate roles to the Service Principal for accessing the storage account.
Set up a Service Connection in Azure DevOps using the Service Principal.
Create a Release Pipeline in Azure DevOps to deploy your static website.
##prerequsiite
Prerequisites
Azure Subscription: Access to an Azure subscription with permissions to create resources.
An Azure account with an active subscription. Create an account for free.
A GitHub repository with your static website code. If you do not have a GitHub account, sign up for free.
A working static website hosted in Azure Storage. Learn how to host a static website in Azure Storage. To follow this example, you should also deploy Azure CDN.
HTML Content: Your static website files (e.g., index.html, 404.html) stored in a repository connected to Azure DevOps.

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

