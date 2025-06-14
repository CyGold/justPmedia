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
chmod +x deploy_static.sh
./deploy_static.sh