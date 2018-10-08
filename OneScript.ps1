﻿# OneScript for Azure Stack Development Kit (ASDK)
Set-ExecutionPolicy Unrestricted -Force

Set-PSRepository `
  -Name "PSGallery" `
  -InstallationPolicy Trusted

# Install the AzureRM.Bootstrapper module. Select Yes when prompted to install NuGet
Install-Module -Name AzureRm.BootStrapper

# Install and import the API Version Profile required by Azure Stack into the current PowerShell session.
Use-AzureRmProfile -Profile 2018-03-01-hybrid -Force

Install-Module -Name AzureStack -RequiredVersion 1.5.0

# Change directory to the root directory. 
cd \

# Enforce usage of TLSv1.2 to download the Azure Stack tools archive from GitHub
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
invoke-webrequest `
  https://github.com/Azure/AzureStack-Tools/archive/master.zip `
  -OutFile master.zip

# Expand the downloaded files.
expand-archive master.zip `
  -DestinationPath . `
  -Force

# Change to the tools directory.
cd AzureStack-Tools-master

#Enter-PSSession -ComputerName AzS-ERCS01 -ConfigurationName PrivilegedEndpoint
#Test-AzureStack

Set-ADDefaultDomainPasswordPolicy -MaxPasswordAge 180.00:00:00 -Identity azurestack.local

$ExecutionContext.SessionState.LanguageMode

# Add the Azure cloud subscription environment name. Supported environment names are AzureCloud or, if using a China Azure Subscription, AzureChinaCloud.
  Add-AzureRmAccount -EnvironmentName "AzureCloud"

  # Register the Azure Stack resource provider in your Azure subscription
  Register-AzureRmResourceProvider -ProviderNamespace Microsoft.AzureStack

  #Import the registration module that was downloaded with the GitHub tools
  Import-Module C:\AzureStack-Tools-master\Registration\RegisterWithAzure.psm1

  #Register Azure Stack
  $AzureContext = Get-AzureRmContext
  $CloudAdminCred = Get-Credential -UserName AZURESTACK\CloudAdmin -Message "Enter the credentials to access the privileged endpoint."
  Set-AzsRegistration `
  -PrivilegedEndpointCredential $CloudAdminCred `
  -PrivilegedEndpoint AzS-ERCS01 `
  -BillingModel Development `
  -RegistrationName "TSC"
