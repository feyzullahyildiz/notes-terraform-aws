## [<- Geri](../README.md)

# Deployment
- Replicasetteki herşey ile aynı neredeyse
    - Yaml dosyalarındaki farkları için, `kind: ReplicaSet` -> `kind: Deployment` bu kadar diyebiliriz
- Not
    - labelleri güncelliyoruz. `app: myapp3` olacak.
- `cd 09-27-create-deployments`
- `kubectl create -f 01-deployment.yml`
- `kubectl create -f 02-nodeport.yml`
- Buradaki tüm `labels` değerleri çok kıymetli. Çok hassas olabiliyorlar.