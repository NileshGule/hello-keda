Param(
    [parameter(Mandatory = $false)]
    [string]$resourceGroupName = "kedaResourceGroup",
    [parameter(Mandatory = $false)]
    [string]$clusterName = "aksKedaCluster"
)

# Browse AKS dashboard
Write-Host "Browse AKS cluster $clusterName" -ForegroundColor Yellow
az aks browse `
    --resource-group=$resourceGroupName `
    --name=$clusterName