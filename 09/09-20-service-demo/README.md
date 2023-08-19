## [<- Geri](../README.md)

[github.com/stacksimplify/kubernetes-fundamentals/05-Services-with-kubectl](https://github.com/stacksimplify/kubernetes-fundamentals/tree/master/05-Services-with-kubectl)

# k8s service Demo

- Bir önceki videonun [README.md](../09-19-service-types/README.md)'sinde digram çizdik, onu yapıyoruz.
- Frontend içine `nginx` kuruyor ve backend'e yönlendirme yapacağız.

## Steps

- Create Backend
  - `kubectl create deployment my-backend-rest-app --image=stacksimplify/kube-helloworld:1.0.0`
- Create Backend Service
  - `kubectl expose deployment my-backend-rest-app --target-port=8080 --port=8080 --name=my-backend-service`
  - Burada `--type` vermiyoruz. Çünkü oluşturmak istedeğimiz service tipi default olan. Yani `ClusterIP`
- Create Frontend
    - Docker Image [stacksimplify/kube-frontend-nginx](https://hub.docker.com/r/stacksimplify/kube-frontend-nginx)
    - İçinde nginx var, dockerda aynı networkte olan 2 cihazın birbirini görürken ismini kullanıyorduk. Burada da öyle. Ama `namespace` adından birşey daha varmış. Bunu ileride göreceğiz.
    - `kubectl get ns` yazarak bakabilirsiniz.
    -   ```
        server {
            listen       80;
            server_name  localhost;     # Buraya localhost vermiş olması çok iyi olmamış bence
            location / {
                # Update your backend application Kubernetes Cluster-IP Service name  and port below      
                # proxy_pass http://<Backend-ClusterIp-Service-Name>:<Port>;      
                proxy_pass http://my-backend-service:8080;
            }
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   /usr/share/nginx/html;
            }
        }
        ```
    - `kubectl create deployment my-frontend-nginx-app --image=stacksimplify/kube-frontend-nginx:1.0.0`
    - `kubectl expose deployment my-frontend-nginx-app --port=80 --target-port=80 --type=NodePort --name=my-frontend-service`
    - `kubectl scale deployment my-backend-rest-app --replicas=10`
    - http://localhost:{PORT}/hello
    - Buraya yaptığımız her requestte yeni bir response alıyoruz.
