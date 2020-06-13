# Using kubectl and plain manifest

1. Create namespace executing all files in folder and check errors due to wrong order
kubectl apply -f ./1-kubectl/Namespace/

2. Cleanup the test namespace
kubectl delete namespace demok8s

3. Create the mongodb replicaset in its own namespace (storage class has been defined for usage in Azure AKS)
kubectl apply -f ./1-kubectl/mongodb/1-namespaces
kubectl apply -f ./1-kubectl/mongodb/2-storage-class
kubectl apply -f ./1-kubectl/mongodb/3-rbac
kubectl apply -f ./1-kubectl/mongodb/4-database

4. Check resources created
kubectl get all --namespace databasetest

5. What about create a new replicaset? 
If you want to deploy a new replica set in one other namespace or change the storage class or the label, you need to copy the YAML files used and edit them
Or you can put placeholders in the YAML file and populate those placeholders with variables using a pipeline to execute (but does yaml would not work from command line on your local computer)

6. Cleanup
kubectl delete namespace databasetest
kubectl delete StorageClass mongodelete


Kubectl
During the demo we will not be using a pipeline but we’ll execute the deployment from the command line. We will use the same example for all tools, with the creation of a namespace, settings default limits and quotas to the namespace and creating a Mongodb replicaset deployment.
During this demo we’ll also show the need to order the execution of the files correctly to avoid errors.


Kustomize
Because we already used our default namespace name in the previous demo, we will now use Kustomize to change the namespace used for the Mongodb deployment; we will also add a specific label. 



Helm
We’ll show how our previously used manifests are transformed to become a Helm Chart. We will use the value to define a third name space and how we will not have to care about the order of execution of the single elements.



Terraform
We will not demonstrate the Helm provider for Terraform, but we’ll define our usual Mongodb replicaset using the Kubernetes provider and execute the deployment. 
