## [<- Geri](../README.md)

https://github.com/stacksimplify/kubernetes-fundamentals/blob/master/04-Deployments-with-kubectl/04-02-Update-Deployment/README.md
# Update Deployments in k8s

## Update image (rollout)
- `kubectl get deployment my-first-deployment -o yaml`
    - Buradan eski image ve versionunu bulduk. `stacksimplify/kubenginx:1.0.0`
    - container'ın image name değeri bizim için önemli o da. `kubenginx` imiş
- `kubectl set image deployment/my-first-deployment kubenginx=stacksimplify/kubenginx:2.0.0 --record=true`
- Warning aldık bakalım `Flag --record has been deprecated, --record will be removed in the future`

### Kontrol etme
- `kubectl rollout status deployment/my-first-deployment`
- `kubectl get pod`
- `kubectl get deploy`


> Note:
> Update için 2 yöntem varmış
>    - Rolling Update. Zerodown time sağlıyor ve default
>    - Recreate bla bla. Mysql için falan bunu yapmak iyi oluyormuş

### Describe
- `kubectl describe deployment my-first-deployment`
- Bu süreçte yeni ReplicaSet oluşuyor.
### Verify ReplicaSet
- kubectl get rs
```
NAME                             DESIRED   CURRENT   READY   AGE
my-first-deployment-5bb6c98c88   10        10        10      9m44s
my-first-deployment-74d6555999   0         0         0       34m
```
### Verify Pods
- kubectl get pods
### Verify Rollout History of a Deployment
- `kubectl rollout history deployment/my-first-deployment`
```
deployment.apps/my-first-deployment
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl.exe set image deployment/my-first-deployment kubenginx=stacksimplify/kubenginx:2.0.0 --record=true
```
Networkten tekrardan istek atınca yeni response'u almamız lazım V2 olanı :)