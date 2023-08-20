## [<- Geri](../README.md)

# Frontend Deployment oluşturma ve Node Port
- Buradaki network olayı kafamı karşıtırdı.
- Dockerda network adında bir kavram vardı. 2 container aynı networkde değil ise (host hariç) birbirlerine erişemezler idi. Halbuki buradaki frontend içindeki nginx'den backend'e istek yaptığını görebiliyoruz ki backendin dışarı açık bir portu dahi yok. Node portu yok
- Burada illaki bunu engellemek için bir kavram vardır, muhtemelen bu işi `namespace` yapıyor ama henüz öğrenmedim...

## Nasıl
- kubectl apply -f 03-frontend-deployment.yml -f 04-frontend-nodeport-service.yml

## Not:
Bu arada, nginx içindeki yapıyı öğrenmek isterseniz. [09-20-service-demo](../09-20-service-demo/README.md)'ye göz atabilirsin.