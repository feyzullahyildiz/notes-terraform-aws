## [<- Geri](../README.md)

https://github.com/stacksimplify/kubernetes-fundamentals
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