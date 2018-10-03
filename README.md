# AzureStackDevKit-OneScript

This is a simplified script for those who install the Microsoft Azure Stack Development Kit multiple times.  This saves you from running multiple scripts as found in the ASDK setup process.  It it recommended that you go through the entire process at least once before using this script. https://docs.microsoft.com/en-us/azure/azure-stack/asdk/ 

Important: The ASDK is not intended to be used or supported in a production environment.

# Updated as of 1.1808.0.97 build
 - https://docs.microsoft.com/en-us/azure/azure-stack/asdk/asdk-release-notes#build-11808097

Assumptions:
- Your hardware meets (or exceeds) the minimum hardware specification: 
  - https://docs.microsoft.com/en-us/azure/azure-stack/asdk/asdk-deploy-considerations
- You have installed (and booted) to the ASDK
  - https://docs.microsoft.com/en-us/azure/azure-stack/asdk/asdk-install 
- You have an active Microsoft Azure Account
  - https://portal.azure.com
- You have configured the system as per deployment considerations
  - https://docs.microsoft.com/en-us/azure/azure-stack/asdk/asdk-deploy-considerations

This script performs the following activities:
---------------------------------------------------
- Post ASDK installation configuration tasks
  - Install Azure Stack PowerShell
  - Download the Azure Stack tools
  - Validate the ASDK installation (WIP)
  - Activate the administrator and tenant portals
  - Reset the password expiration policy to 180 days
 - Azure Stack registration 
    
 
 If you have general questions about Microsoft Azure Stack - check here first! 
 https://social.msdn.microsoft.com/Forums/azure/en-US/home?forum=AzureStack
