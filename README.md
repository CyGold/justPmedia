# Automated static website upload using github-actions

## Features
-Continuous deployment: with every push, github-actions automatically build and deploy sites
-Version Control Integration: full history of changes, the ability to roll back, and traceability for every update.
-Secure Credentials Management: Azure credentials are stored securely in Github-secrets
-Fail safe scripts: error handling and logging in deployment scripts to catch issues early.

## PREREQUSITE

1. An Azure account with an active subscription. 
2. A GitHub repository with static website files.
3. Aworking static website hosted in Azure Storage.

## Deployment

1. Clone the repository:
     ```bash
   git clone https://github.com/CyGold/justPmedia.git
2. make the script executable
     ```bash
   chmod +x script.sh

3. run the script
      ```bash
   ./script.sh

4. click on the output with website link to view link site
    [portfolio](https://staticweb67.z13.web.core.windows.net/)

5. copy the outputted storage account keys and in GitHub, go to your repository.

6. Go to Settings in the navigation menu.

7. Select Security > Secrets and variables > Actions.

8. Select New repository secret.

9. Create a new repository secret for STORAGE_ACCOUNT_NAME with Azure Storage account name

10. Create a new repository secret for STORAGE_ACCOUNT_KEY with copied storage key.

11. push to GitHub repository and the changes are relected in the live website.

To avoid costs, the del.sh script is used to delete all created resources
     ```bash
   ./del.sh




