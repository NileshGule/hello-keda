Param(
    [parameter(Mandatory = $false)]
    [string]$subscriptionName = "Microsoft Azure Sponsorship",
    [parameter(Mandatory = $false)]
    [string]$resourceGroupName = "acrResourceGroup",
    [parameter(Mandatory = $false)]
    [string]$resourceGroupLocaltion = "South East Asia"
)

$acrRegistryName = "ngAcrRegistry"

# Set Azure subscription name
Write-Host "Setting Azure subscription to $subscriptionName"  -ForegroundColor Yellow
az account set --subscription=$subscriptionName

Create resource group name
Write-Host "Creating resource group $resourceGroupName in region $resourceGroupLocaltion" -ForegroundColor Yellow
az group create `
    --name=$resourceGroupName `
    --location=$resourceGroupLocaltion `
    --output=jsonc

# Create Azure Container Registry
Write-Host "Creating Azure Container Registry $acrRegistryName under resource group $resourceGroupName " -ForegroundColor Yellow
az acr create `
    --name=$acrRegistryName `
    --resource-group=$resourceGroupName `
    --sku=Basic `
    --output=jsonc


az acr update -n ngAcrRegistry --admin-enabled true

az acr credential show -n ngAcrRegistry

kubectl create secret docker-registry regcred --docker-server=ngacrregistry.azurecr.io --docker-username=ngAcrRegistry --docker-password=OiY4ILE2FEH8YlT=Hn8P8kHNoemP6o5X --docker-email=nileshgule@outlook.com

kubectl get secret regcred --output=yaml

kubectl get secret regcred --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode