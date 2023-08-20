## [<- Geri](../README.md)

https://github.com/stacksimplify/kubernetes-fundamentals
- [ReplicaSet (09-11-replicaset) Yaml dosyası var sadece](./09-11-replicaset/README.md)
- [ReplicaSet (09-12-replicaset)](./09-12-replicaset/README.md)
- [Deployment Introduction (09-13-deployment-introduction)](./09-13-deployment-introduction/README.md)
- [Deployment Demo (09-14-deployment)](./09-14-deployment/README.md)
- [Deployment Updates (09-15-deployment)](./09-15-deployment-updates/README.md)
- [Deployment EDIT (09-16-deployment)](./09-16-deployment-edit/README.md)
- [Deployment ROLLBACK (09-17-rollback)](./09-17-rollback/README.md)
- [Deployment Resume Pause (09-18-deployment-resume-pause)](./09-18-deployment-resume-pause/README.md)
- [Service TYPES (09-19-service-types)](./09-19-service-types/README.md)
- [Service TYPES Demo (09-20-service-demo)](./09-20-service-demo/README.md)
- 09-21 Passed
- [Yaml (09-22-yaml-basics)](./09-22-yaml-basics/README.md)
- [Yaml ile POD oluşturma (09-23-pods-with-yaml)](./09-23-pods-with-yaml/README.md)
    - Docs URL
- [Yaml ile NodePort Service oluşturma (09-24-node-port-yaml)](./09-24-node-port-yaml/README.md)
    - Burada hem service oluşturuyoruz. Hemde 09-23'de oluşturduğumuz pod'a bağlıyoruz. `selector` ile
- [Yaml ile ReplicaSet oluşturma (09-25-replicaset-yaml)](./09-25-replicaset-yaml/README.md)
    - ReplicatSet `selector` ile Service `selector`'ün farklını burada görüyoruz. Neden böyle onu henüz anlamadım. Service için dümdüz verirken, ReplicatSet için `matchLabels` diye ayrı bir olay çıktı başımıza
- [Yaml ile ReplicaSet ve NodePort (09-26-node-port-yaml)](./09-26-node-port-yaml/README.md)

# Kubernetes
- Master Node
    - etcd
        - key-value store. master and node information
    - kube-scheduler
        - it is responsible for `distributing containers` accross multiple nodes.
        - It `watches` for newly created Pods with not assigned node, and selects a node for them to run on
    - kube-apiserver
        - it acts as fronte end for the kubernetes control plane. it exposes API
        - CLI (like kubectl), Users and even Master components, Worker node components (Kubelet) everthing talks with API SERVER
    - Kube controller manager
        - responsible for noticing nodes, container or endpoints goes down.
        - Items/Features
            - Node Controller
            - Replication Controller
            - Endpoints Controller
            - Service Account  & Token controller
    - Cloud Controller Manager
        - It is related for `cloud-specific control logic`
        - Items/Features
            - On Premise
            - Node Controller
            - Route Controller
            - service Controller
    - container runtime (Docker)
- Worker Node
    - kubelet
        - agent that runs on every node in cluster
    - kube-proxy
        - it is a network proxy that runs on each node
        - it maintains network rules
    - container runtime (Docker)

# EKS Kubernets Architecture
EKS lets us focus on Application Workloads. We dont need to anything on the below.
- EKS Control Plane
    - Master
        - etcd
        - kube-scheduler
        - kube-apiserver
        - EKS controller manager
        - Fargate Controller Manager
    - Worker Node
        - Kubelet 
        - Kuber-Proxy
    

# K8s Fundamentals
- Pod
    - Single instacne of an applicaton
- ReplicaSet
    - maintains pods count.
- Deployment
    - A deployment runs multiple replicas of your app.
    - Replaces any instances that fail or become unresponsive. 
    - Deployments are well-suited for stateless applications
- Service
    - it is like a load balancer

# Soru Cevap
- Can we have multi container in a single pod
    - yes. %99 you should not do that

# Kullanım
- nodes
    - kubectl get nodes
    - kubectl get nodes -o wide
- pods
    - kubectl get pods -o wide
    - kubectl get pod `my-first-pod` -o yaml
- describe
    - kubectl describe pod POD_NAME
- logs
    - `kubectl logs my-first-pod`
- service
- expose
### Ne oldu
- `kubectl run my-first-pod --image stacksimplify/kubenginx:1.0.0`
    - `kubectl describe pod my-first-pod`
    - Kubernetes created a pod
    - Pulled the docker image from docker hub
    - Created the container in the pod
    - Started the container present in the pod
## Notlar
- Bir pod'a dışarıdan erişmek istiyorsak service kullanmalıyız

### Port Açma (kubectl service expose)
- `kubectl run my-first-pod --image stacksimplify/kubenginx:1.0.0`
- `kubectl expose pod my-first-pod --type=NodePort --port=80 --name=my-first-service`
    - Bu image 80 portunu dinliyor. expose port 80
- `kubectl get services` || `kubectl get svc`
```
NAME               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes         ClusterIP   10.96.0.1        <none>        443/TCP        20h
my-first-service   NodePort    10.103.213.165   <none>        80:31457/TCP   13s
```
- Tüm nodeların bu portu açık ve hepsi bu pod'a gidiyor
- PORTLAR
    - 3 tane port var. :D
        - Target port (container'ın dinlediği port. Dockerfile EXPOSE)
        - Port (Dışarıya bind ettiğimiz port)
        - Dışarıdan istek yaparkenki k8s'in otomatik atadığı port.
    - `kubectl expose pod ...` yazarken 2 port parametresi veriyoruz
        - `--port`(Zorunlu) ve `--target-port`
        - `--target-port` değeri image'ın içindeki port değeri ile aynı olmalı, yoksa ulaşmamız mümkün değil
        - Atıyorum nginx image'ı var (80 dinler)
            - düzgün çalışması için `target-port` değeri 80 olmak zorunda. Ama port değerini 81 yapabiliriz
        - Eğer ki `target-port` vermezisek, `port` değeri ile aynı oluyor.
    - 3. PORT ise, k8s tarafından 30000-32767 arasında verilen rastgele olan bir port. Dış dünyadan gelirken bunu kullanmalıyız

### Logs
- `kubectl logs my-first-pod`
- `kubectl logs -f my-first-pod`

### Exec
- `kubectl exec -ti my-first-pod -- /bin/bash`


