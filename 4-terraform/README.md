# Using terrafrom

1. Move inside the folder  
cd 4-terraform/mongodb/  

2. Initialize terraform (in this demo we are keeping the state locally, using with automation you will want to set a backend to store a persistent and shares state)  
terraform init  

3. Verify the plan of execution  
terraform plan  

4. Create the mongodb replicaset in its own namespace (storage class has been defined for usage in Azure AKS)  
terrafom apply  

4. Check resources created  
kubectl get all --namespace terraformdbdemo  
kubectl get StorageClass mongodelete  

5. What about create a new replicaset?  (please note: we are using the same state file so it will mark what previosly created as to be destroyed and the new resources to be created, we will not create them now, this is just to demonstrate reusaage of same templates with different variables values)  
terraform plan -var="namespace=tfsecondtest"  

6. Cleanup (due to the fact that terraform manages its state, we'll use terraform itself to delete what created, we can check using kubectl the actual deletion)  
terraform destroy  
kubectl get namespace terraformdbdemo  
kubectl get StorageClass mongodelete  
