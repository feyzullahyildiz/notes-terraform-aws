## [<- Geri](../README.md)

https://github.com/stacksimplify/kubernetes-fundamentals/blob/master/04-Deployments-with-kubectl/04-01-CreateDeployment-Scaling-and-Expose-as-Service/README.md

# Deployments in k8s
- `kubectl create deployment my-first-deployment --image=stacksimplify/kubenginx:1.0.0`
- `kubectl get deployments` OR `kubectl get deploy`
- `kubectl describe deployment my-first-deployment`
- `kubectl get pods`
```
NAME                                   READY   STATUS    RESTARTS   AGE
my-first-deployment-74d6555999-kflgl   1/1     Running   0          99s
```
- `kubectl scale --replicas=20 deployment my-first-deployment`
- `kubectl get deploy`
```
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
my-first-deployment   20/20   20           20          3m11s
```
- `kubectl get rs`
```
NAME                             DESIRED   CURRENT   READY   AGE
my-first-deployment-74d6555999   20        20        20      3m21s
```
### Expose Deployment as a Service
- kubectl expose deployment my-first-deployment --type=NodePort --port=80 --target-port=80 --name=my-first-deployment-service
- kubectl get svc

> Buraya kadar Replicaset ile sanki aynıydı. Her bir deployment için bir replicaset oluştuyormuş, onu da görmüş olduk. Replicaset için yaml file kullanmak zorunda kalmıştık. Onda da scale yöntemi vardı.