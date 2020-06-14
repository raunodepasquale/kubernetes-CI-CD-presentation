# Using kubectl and plain manifest

1. Create namespace executing all files in folder and check errors due to wrong order  
kubectl apply -f ./1-kubectl/Namespace/  

2. Cleanup the test namespace  
kubectl delete namespace demok8s  

3. Create the mongodb replicaset in its own namespace  (storage class has been defined for usage in Azure AKS)  
kubectl apply -f ./1-kubectl/mongodb/1-namespaces  
kubectl apply -f ./1-kubectl/mongodb/2-storage-class  
kubectl apply -f ./1-kubectl/mongodb/3-rbac  
kubectl apply -f ./1-kubectl/mongodb/4-database  

4. Check resources created  
kubectl get all --namespace databasetest  
kubectl get StorageClass mongodelete  

5. What about create a new replicaset?  
If you want to deploy a new replica set in one other namespace or change the storage class or the label, you need to copy the YAML files used and edit them
Or you can put placeholders in the YAML file and populate those placeholders with variables using a pipeline to execute (but does yaml would not work from command line on your local computer)  

6. Cleanup  
kubectl delete namespace databasetest  
kubectl delete StorageClass mongodelete  
