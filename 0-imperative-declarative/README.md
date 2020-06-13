
# Imperative Example

1. create a namespace  
kubectl create namespace raunotestns
  
2. create a deployment  
kubectl run nginx --image nginx:1.14.2 --namespace raunotestns
  
3. Check status of deployment  
kubectl get deployment nginx --namespace raunotestns -oyaml
  
4. Label our deployment  
kubectl label deployment nginx context=demo --namespace raunotestns
  
5. Check labels in deployment  
kubectl get deployment nginx --namespace raunotestns -oyaml
  
6. Update the version of nginx used  
kubectl set image deployment.v1.apps/nginx nginx=nginx:1.16.1 --namespace raunotestns
  
7. Check status of rollout  
kubectl rollout status deployment.v1.apps/nginx --namespace raunotestns
  
8. Scale the deployment  
kubectl scale --replicas 3 deployment nginx --namespace raunotestns
  
9. Check status of deployment to see if we have 3 pods and updated version of nginx  
kubectl get pod --namespace raunotestns  
kubectl get deployment nginx --namespace raunotestns -oyaml  

10. Try again to execute the previous commands  
kubectl create namespace raunotestns  
kubectl label deployment nginx context=demo --namespace raunotestns  

11. Cleanup at the end of the demo  
kubectl delete namespace raunotestns  

# Declarive Example  

1. create a name space  
kubectl apply -f ./0-imperative-declarative/manifest/namespace.yaml  

2. create a deployment  
kubectl apply -f ./0-imperative-declarative/manifest/nginx.yaml  

3. Check status of deployment  
kubectl get deployment nginx --namespace raunotestns -oyaml  

4. Label our deployment  
kubectl apply -f ./0-imperative-declarative/manifest/nginxlabel.yaml  

5. Check labels in deployment  
kubectl get deployment nginx --namespace raunotestns -oyaml  

6. Update the version of nginx used  
kubectl apply -f ./0-imperative-declarative/manifest/nginxupdate.yaml  

7. Check status of rollout  
kubectl rollout status deployment.v1.apps/nginx --namespace raunotestns  

8. Scale the deployment  
kubectl apply -f ./0-imperative-declarative/manifest/nginxscale.yaml  

9. Check status of deployment to see if we have 3 pods and updated version of nginx  
kubectl get pod --namespace raunotestns  
kubectl get deployment nginx --namespace raunotestns -oyaml  

10. Try again to execute the previous commands  
kubectl apply -f ./0-imperative-declarative/manifest/namespace.yaml  
kubectl apply -f ./0-imperative-declarative/manifest/nginxscale.yaml  

11. Cleanup at the end of the demo  
kubectl delete namespace raunotestns  