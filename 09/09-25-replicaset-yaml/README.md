## [<- Geri](../README.md)

# ReplicaSet with Yaml
- [ReplicaSet Docs](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#replicaset-v1-apps)
- ilginç birşey var. Verison değeri burada farklı. `apps/v1`
    - Pod ve Service için olan dökümantasyondaki `Group` değerleri `core` idi. Ama Replicaset için açılmış `Group` değeri `apps`
    - Bu durum yaml dosyasındaki `apiVersion` değerini bildiğimiz syntax'ın dışında oluğunu görmemize sebep oluyor. Yani herzaman `v1` yazmıyormuşuz.
- Gerçek hayatta sadece `ReplicaSet` kullanmayacağız gibi duruyor. Deploymentsız pek anlamı yok. Ama Deployment ile aynı sytax'ı var.
- `selector.matchLabels`
    - RS hangi podları oluşturacağına buradan bakıyor. Ve servicedeki gibi çalışmıyor. template içindeki metadata.labels ile eşleşmeli. Yoksa hangi POD için oluşturulacağını bilemiyor. Bir ReplicaSet'i de POD'suz hayal edemeyiz herhalde.
