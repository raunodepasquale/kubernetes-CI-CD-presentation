# Using helm

1. Locally render the template  
helm template helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb  

2. Create the deployment  
helm install helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb  

3. Check resources created  
kubectl get all --namespace helmmongodb  

4. What about create a new replicaset?  
helm template helmmongodbdemo -f ./3-helm/mongodb/secondvalues.yaml ./3-helm/mongodb  

5. Cleanup  
kubectl delete namespace helmmongodb  
kubectl delete StorageClass mongodelete  

6. Bonus - Helm plus Kustomize (use Helm to package application and order dependencies and kustomize to patch the result)  
helm template helmmongodbdemo -f ./3-helm/mongodb/values.yaml ./3-helm/mongodb > ./3-helm/bonus/output.yaml  
kubectl kustomize ./3-helm/bonus > ./3-helm/bonus/outputfinal.yaml  
