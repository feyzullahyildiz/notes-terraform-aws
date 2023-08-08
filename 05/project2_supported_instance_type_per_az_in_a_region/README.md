## [<- Geri](../README.md)

```bash
# Determine which Availability Zones support your instance type
aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.micro --region us-east-1 --output table

-------------------------------------------------------
|            DescribeInstanceTypeOfferings            |
+-----------------------------------------------------+
||               InstanceTypeOfferings               ||
|+--------------+--------------+---------------------+|
|| InstanceType |  Location    |    LocationType     ||
|+--------------+--------------+---------------------+|
||  t3.micro    |  us-east-1a  |  availability-zone  ||
||  t3.micro    |  us-east-1b  |  availability-zone  ||
||  t3.micro    |  us-east-1f  |  availability-zone  ||
||  t3.micro    |  us-east-1c  |  availability-zone  ||
||  t3.micro    |  us-east-1d  |  availability-zone  ||
|+--------------+--------------+---------------------+|
```
location-type  -> availability-zone, availability-zone-id, and region

> t3.micro is not in us-east-1e