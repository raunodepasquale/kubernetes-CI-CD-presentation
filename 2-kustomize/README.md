# Using kustomize

1. Merge and override data from kustomization.yaml to the resources (output on video only)
kubectl kustomize ./2-kustomize/mongodb

2. Apply changes without saving the amended yaml file
kubectl apply -k ./2-kustomize/mongodb

3. Check resources created
kubectl get all --namespace kustomizedemodb

4. What about create a new replicaset? 
kubectl kustomize ./2-kustomize/secondsetup
kubectl apply -k ./2-kustomize/secondsetup

5. Check resources created
kubectl get all --namespace kustomizedemodb
kubectl get all --namespace kustomizationseconddb

6. Cleanup
kubectl delete namespace kustomizedemodb
kubectl delete namespace kustomizationseconddb
kubectl delete StorageClass mongodelete

