## [<- Geri](../README.md)

# ReplicaSet
- Load Balancing
    - k8s provides Load Balancing out of the box using `Services`
    - Labels & Selectors are the key items which ties all e together (Pod, ReplicaSet, Service)
- Scaling
    - this is going to be seamless and super quick

## Nasıl yaparız
Yaml dosyası şart galiba. Ama şart yani
- kubectl create -f replicatset-demo.yaml
- replicatset-demo.yml
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-helloworld-rs
  labels:
    app: my-helloworld
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-helloworld
  template:
    metadata:
      labels:
        app: my-helloworld
    spec:
      containers:
      - name: my-helloworld-app
        image: stacksimplify/kube-helloworld:1.0.0
```
- kubectl get rs
- kubectl describe rs my-helloworld-rs
- kubectl get pods -o wide
```
NAME                     READY   STATUS    RESTARTS   AGE
my-helloworld-rs-bg4cd   1/1     Running   0          4m6s
my-helloworld-rs-c2r54   1/1     Running   0          4m6s
my-helloworld-rs-txq5m   1/1     Running   0          4m6s
```
- kubectl get pods my-helloworld-rs-bg4cd -o wide
- `kubectl get pods my-helloworld-rs-bg4cd -o yaml` (MORE DETAIL)
    - verify under `name` tag under `ownerReferences`. You will see the replicaset

## EXPOSE PORT
- `kubectl expose rs my-helloworld-rs --type=NodePort --port=80 --target-port=8080 --name=my-helloworld-rs-service`
- kubectl get svc
```
NAME                       TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes                 ClusterIP   10.96.0.1     <none>        443/TCP        21h
my-helloworld-rs-service   NodePort    10.98.33.48   <none>        80:30439/TCP   3s
```
- http://localhost:30439/hello
    - reponse'da görülen şey pod idsi. Image'ı o şekilde yazmış
## High Availability OR Reliability
- ReplicatSet içinde bir pod crash olursa otomatik olarak 1 tane kaldıracaktır.
    - Galiba bu olaya, `High Availability` ve/veya `Reliability` deniyor
- `kubectl get pods`
- kubectl delete pod my-helloworld-rs-bg4cd
- `kubectl get pods`
## Scalability 
- replicaset-demo.yaml içindeki replicas sayısını değiştiriyoruz
- `kubectl replace -f replicaset-demo.yaml`
- `kubectl get rs`
- `kubectl get pods`
#### Clean up
- kubectl delete svc my-helloworld-rs-service
- kubectl delete rs my-helloworld-rs