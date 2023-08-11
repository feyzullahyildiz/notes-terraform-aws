## [<- Geri](../README.md)
[04-Deployments-with-kubectl/04-02-Update-Deployment/README.md EDIT](https://github.com/stacksimplify/kubernetes-fundamentals/blob/master/04-Deployments-with-kubectl/04-02-Update-Deployment/README.md#step-02-update-the-application-from-v2-to-v3-using-edit-deployment-option)

# EDIT Deployment
- `kubectl edit deployment/my-first-deployment --record=true`
    - vim editörü açıyor ve yaml üzerinde çalışıyorsun. WOW
- ` kubectl rollout status deployment/my-first-deployment`
> deployment "my-first-deployment" successfully rolled out
- kubectl rollout history deployment/my-first-deployment
```
deployment.apps/my-first-deployment 
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl.exe set image deployment/my-first-deployment kubenginx=stacksimplify/kubenginx:2.0.0 --record=true
3         kubectl.exe edit deployment/my-first-deployment --record=true
```
