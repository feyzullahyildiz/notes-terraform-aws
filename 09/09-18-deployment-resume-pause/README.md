## [<- Geri](../README.md)

# Pause
- `kubectl rollout pause deployment my-first-deployment`
- devam ettirene kadar yapılan hiçbir işlem başlamaz
- `kubectl set image deploy/my-first-deployment kubenginx=stacksimplify/kubenginx:4.0.0 --record=true`
- Henüz update başlamadı
- kubectl set resources deploy/my-first-deployment -c=kubenginx --limits=cpu=200m,memory=512Mi
- `kubectl rollout status deployment/my-first-deployment`
    - Böyle birşey varmış.
    - rollout pause edildiğinde burası terminali bırakmıyor. Bu şekilde anlayabiliriz galiba.
    - Ama sadece pause etmek watch etmesini sağlamıyor. Sonrasında bir update geçmek lazım
- `kubectl rollout resume deployment my-first-deployment`