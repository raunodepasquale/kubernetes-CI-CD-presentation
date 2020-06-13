# Using terrafrom

1. Move inside the folder  
cd 4-terraform/mongodb/  

2. Initialize terraform (in this demo we are keeping the state locally, using with automation you will want to set a backend to store a persistent and shares state)  
terraform init  

3. Create the mongodb replicaset in its own namespace (storage class has been defined for usage in Azure AKS)  


4. Check resources created  
kubectl get all --namespace terraformdbdemo  

5. What about create a new replicaset?  


6. Cleanup
kubectl delete namespace terraformdbdemo  
kubectl delete StorageClass mongodelete  
