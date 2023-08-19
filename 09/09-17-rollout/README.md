## [<- Geri](../README.md)


# Compare with rollout history
-  `kubectl rollout history deployment my-first-deployment --revision=2`
> Şuanki durumu ile 2. revision'daki durumu kıyaslanıyor.
```
deployment.apps/my-first-deployment with revision #2
Pod Template:
  Labels:       app=my-first-deployment
        pod-template-hash=5bb6c98c88
  Annotations:  kubernetes.io/change-cause: kubectl.exe set image deployment/my-first-deployment kubenginx=stacksimplify/kubenginx:2.0.0 --record=true
  Containers:
   kubenginx:
    Image:      stacksimplify/kubenginx:2.0.0
    Port:       <none>
    Host Port:  <none>
    Environment:        <none>
    Mounts:     <none>
  Volumes:      <none>
```
- `kubectl rollout undo deployment my-first-deployment`
- Bu kod bir önceki haline getiriyor. İki kere çalıştırırsak stack mantığı gibi çalışmıyor.
- `kubectl set image deploy/my-first-deployment kubenginx=stacksimplify/kubenginx:1.0.0 --record=true`
- `kubectl set image deploy/my-first-deployment kubenginx=stacksimplify/kubenginx:2.0.0 --record=true`
- `kubectl set image deploy/my-first-deployment kubenginx=stacksimplify/kubenginx:3.0.0 --record=true`
- `kubectl set image deploy/my-first-deployment kubenginx=stacksimplify/kubenginx:4.0.0 --record=true`
- Yeni revision => kubenginx:4.0.0
- `kubectl rollout undo deployment my-first-deployment`
- Yeni revision => kubenginx:3.0.0
- `kubectl rollout undo deployment my-first-deployment`
- Yeni revision => kubenginx:4.0.0
- Yani 2.0.0'a bu kod ile geçiş mümkün değil
> **rollout undo `WITH` --to-revision**
- `kubectl rollout undo deployment my-first-deployment --to-revision=1`
> **restart pods with rollout**
- `kubectl rollout restart deployment/my-first-deployment`