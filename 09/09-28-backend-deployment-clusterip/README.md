## [<- Geri](../README.md)

# Backend ClusterIP Deployment
- Abimiz, Deployment ile Backend'i kaldırdı. ClusterIP Service Oluşturdu. Bir sonraki örnekte frontend'i de yapacak.
- cluster-ip içindeki name değeri çok kritik. Frontend içinde kullanılan `nginx` içinde `proxy_pass` yapıyoruz ve isim aynen bu şekilde. İsim aynen şu şekilde olmalı. `my-backend-service`
- Aynı Anda iki dosyayı bu şekilde bağlayabiliyoruz...
- `kubectl apply -f 01-backend-deployment.yml -f 02-backend-clusterip-service.yml`
