## [<- Geri](../README.md)

# k8s base definicition
> [Docs in kubernetes.io](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#pod-v1-core)
```yaml
apiVersion: v1
kind: Pod   # OR ReplicaSet | Deployment # falan filan
metedata:
    name: myapp-pod
    labels:
        app: myapp
spec:
    containers: #List
        - name: myapp
          image: stacksimplify/kubenginx:2.0.0
          ports:
            - containerPort: 80
        
```
- `kubectl create -f pod-definition.yml`
- `kubectl apply -f pod-definition.yml` Sonradan image verisonu değiştirince buradan güncellenebilyor galiba. Ama emin değilim.