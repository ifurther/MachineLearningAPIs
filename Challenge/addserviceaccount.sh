gcloud compute networks create NETWORK \
    --subnet-mode=custom \
    --bgp-routing-mode=DYNAMIC_ROUTING_MODE \
    --mtu=MTU
gcloud compute networks subnets create SUBNET \
    --network=NETWORK \
    --range=PRIMARY_RANGE \
    --region=REGION
gcloud compute networks subnets delete SUBNET \
    --region=REGION
gcloud compute networks subnets update SUBNET \
  --region=REGION \
  --add-secondary-ranges=SECONDARY_RANGE_NAME=SECONDARY_RANGE

