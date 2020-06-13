# Using terrafrom

1. Create namespace executing all files in folder and check errors due to wrong order  
kubectl apply -f ./1-kubectl/Namespace/  

2. Cleanup the test namespace  
kubectl delete namespace demok8s  

3. Create the mongodb replicaset in its own namespace (storage class has been defined for usage in Azure AKS)  


4. Check resources created  
kubectl get all --namespace terraformdbdemo  

5. What about create a new replicaset?  


6. Cleanup
kubectl delete namespace terraformdbdemo  
kubectl delete StorageClass mongodelete  
