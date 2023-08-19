## [<- Geri](../README.md)

# Node Port Service with YAML
[Service Doc](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#service-v1-core)

- [node-port-demo.yml](./node-port-demo.yml)
- Bu dosyadaki en kritik şeyden birisi de `seletor`.
    - selector; Map/Dictionary gibi çalışıyor. Ve içindeki propertyler ile başka objenin içindeki `metadata.labels` ile eşlenen ne var ise ona bağlanıyor diye anlıyorum.
    - Buradaki değer şöyle
    -   ```yaml
        kind: Service
        metaata:
            ...
        spec:
            selector:
                app: myapp # Bu değer çok kritik
        ```
    - [09-23-pods-with-yaml/pod-definition.yml](../09-23-pods-with-yaml/pod-definition.yml) buradaki `metadata.labels` ile eşleşmeli, diğer türlü bağlanmaz.
- nodePort Değeri atayabiliyoruz...