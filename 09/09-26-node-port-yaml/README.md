## [<- Geri](../README.md)

# Replicaset NodePort with Yaml
- Eski dosyalar ile ilişkili bir şekilde yazmaya devam ediyoruz.
- Bir önceki videodaki `replicaset` [../09-25-replicaset-yaml/replicaset-definition.ym](../09-25-replicaset-yaml/replicaset-definition.yml) için yaptığımız config dosyasını çalıştırdıktan sonra bunu çalıştırmamız gerekiyor.
    - Oradaki `spec.template.metadata.labels` **BURASI ÖNEMLİ** içindekiler ile eşleniyor. rooddaki `metadata.labels` ile değil.
- Nasıl çalıştırırız.
    - Ana dizinde gidin
    - `cd 09`
    - `kubectl create -f .\09-25-replicaset-yaml\replicaset-definition.yml`
    - `kubectl create -f .\09-26-node-port-yaml\replicaset-nodeport-service.yml`