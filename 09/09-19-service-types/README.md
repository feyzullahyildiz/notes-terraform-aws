## [<- Geri](../README.md)

# Services

```mermaid
flowchart TB
    s[Services]
    s --> ClusterIP
    s --> NodePort
    s --> LoadBalancer
    s --> Ingress
    s --> externalName
```

### ClusterIP
- Used for communicaiton between applications inside k8s cluster
- (Example: Frontend application accessing backend application)
- YORUMUM: Açıklama bana saçma geldi. Bence böyle değil. Çoğu zaman 2 applicationı da dışarı açarsın kanki.
### NodePort
- Used for accessing applications outside of k8s cluster using Worker Node Ports
- Example: Accessing Frontend application on browser
### LoadBalancer
- Primarily for cloud providers to integrate with their Load Balancer services
- Example: AWS Elastic Load Balancer
### Ingress
- Advanced load balancer which provides Context path based routing, SSL SSL Redirect and many more
- Exmaple: AWS ALB
### externalName
- To access external hosted apps in k8s cluster
- Example: Access AWS RDS Database endpoint by applciation present inside k8s cluster


```mermaid
flowchart TB
  subgraph users [Users]
  end
  subgraph k8s[Kubernetes Cluster]

    serviceClusterIP[Backend App - ClusterIP Service]
    serviceExternal[DB-External Service]
    serviceNodePort[Frontend App-NodePort or LoadBalancer or Ingress Service]
    
    subgraph DepFrontend["`Deployment  (app=Frontend)`"]
        subgraph RepFr[ReplicaSet]
            PFrontend1[POD]
            PFrontend2[POD]
            PFrontend3[POD]
        end
    end
    
    DepFrontend --> serviceClusterIP
    subgraph DepBackend["`Deployment  (app=Backend)`"]
        subgraph RepBe[ReplicaSet]
            PBackend1[POD]
            PBackend2[POD]
            PBackend3[POD]
        end
    end
    serviceClusterIP --> DepBackend
    
    DepBackend --> serviceExternal
    serviceNodePort --> DepFrontend
  end
  subgraph Cloud[AWS CLOUD]
    DB[(AWS RDS Database)]
  end
  serviceExternal --> DB
  users --> serviceNodePort
```