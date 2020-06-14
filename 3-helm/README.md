# Using helm

1. Locally render the template  
helm template helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb  

2. Create the deployment  
helm install helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb  

3. Check resources created  
kubectl get all --namespace helmmongodb  
kubectl get StorageClass mongodelete  

4. Use Helm also to see the status
helm list  
helm history helmmongodbdemo  
helm get all helmmongodbdemo  

5. What about create a new replicaset?  (we are going just to show what would be created without actually creating it to save time)
helm template helmmongodbdemo -f ./3-helm/mongodb/secondvalues.yaml ./3-helm/mongodb  

6. Cleanup (because helm manages its own history we can use helm directly to uninstall what we have created, it is important to do so because you'll not be able to install again the same chart release if not uninstalled; we can use kubectl to see that deletion happened)
helm uninstall helmmongodbdemo  
helm history helmmongodbdemo  
kubectl get namespace helmmongodb  
kubectl get StorageClass mongodelete  

7. Bonus - Helm plus Kustomize (use Helm to package application and order dependencies and kustomize to patch the result)  
helm template helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb > ./3-helm/bonus/output.yaml  
kubectl kustomize ./3-helm/bonus > ./3-helm/bonus/outputfinal.yaml  
