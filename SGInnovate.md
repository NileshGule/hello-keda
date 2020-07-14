# SGInnovate demo

```powershell

az storage account create `
--sku Standard_LRS `
--location SouthEastAsia `
--resource-group kedaResourceGroup `
--name ngkedastorageaccount

$CONNECTION_STRING=$(az storage account show-connection-string --name ngkedastorageaccount --query connectionString)

az storage queue create `
--name js-queue-items `
--connection-string $CONNECTION_STRING

az storage account show-connection-string `
--name ngkedastorageaccount `
--query connectionString

func kubernetes install --namespace keda

kubectl get customresourcedefinition

func kubernetes deploy --name hello-keda --registry nileshgule

func kubernetes deploy --name hello-keda --registry nileshgule --javascript --dry-run > deploy.yaml

func kubernetes deploy --name hello-keda --registry nileshgule --javascript --dry-run > deploy1.yaml

func kubernetes deploy --name hello-keda --registry nileshgule --javascript --dry-run > deploy2.yaml

docker build -t nileshgule/hello-keda .
docker push nileshgule/hello-keda

kubectl apply -f deploy.yaml

dotnet new console -n QueueMessageGenertor

kubectl config set current-context aksmqCluster

kubectl config use-context aksmqCluster

kubectl config use-context aksKedaCluster


.\browseAKS.ps1 -resourceGroupName techTalksRG -clusterName aksmqCluster

.\browseAKS.ps1 -resourceGroupName kedaResourceGroup -clusterName aksKedaCluster

az storage account create `
--sku Standard_LRS `
--location SouthEastAsia `
--resource-group demo-GAB-2020-func-app `
--name gabsgstorageaccount

func kubernetes deploy `
--name hello-keda `
--registry nileshgule `
--max-replicas 30 `
--cooldown-period 10 `
--polling-interval 5

```
