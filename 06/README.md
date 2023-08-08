## [<- Geri](../README.md)

#  VPC
![Steps](./assets/section_06.jpg)

### STEP 2
- Create From AWS Manager (Web)
    - VPC
    - subnet private, subnet public
    - Internet Gateway ans Associate it to VPC
    - Go to Nat Gateways
        - use public-subnet
        - allocate elastic-ip
    - Route table with VPC (my-public-route-table)
        - **ROUTES** 
        - select created route table
        - go routes tab
        - edit routes
        - add route
            - Destination 0.0.0.0/0
            - Target igw (INTERNET GATEWAY NOT NAT GATEWAY)
        - **SUBNET** 
            - Subnet Associations
            - Click `Edit Subnet Associations`
            - select public subnet that we created
    - Route table with VPC (my-private-route-table)
        - **ROUTES** 
        - go routes tab
        - edit routes
        - add route
            - Destination 0.0.0.0/0
            - Target igw (NAT GATEWAY)
        - **SUBNET** 
            - Subnet Associations
            - Click `Edit Subnet Associations`
            - select private subnet that we created

- Nasıl sileriz
    - NAT gatewayi sil. 2-5 dk beklemek gerekiyor.
    - VPC'yi sil
    - TAMAM
## Notes
- Nat gateways
    - Public ip veriyor, elastic-ip atadığımız için.
    - İşimizi tamamlayınca bunu kapatın, para yazar :D
    