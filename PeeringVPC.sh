#!/bin/sh
# VPC Network Peering 

export FIRST_PROJECT_ID=qwiklabs-gcp-04-4b1f1a86d43a
export FIRST_NETWORK=network-a
export PROJECT_ID2=qwiklabs-gcp-04-0b7f245cfe5d
export SECOND_NETWORK=network-b

Changeproject() {
	project=${!1}
	gcloud config set project $project
}

# FIRST_PROJECT_ID VPC instance
Changeproject FIRST_PROJECT_ID
gcloud compute networks create $FIRST_NETWORK --subnet-mode custom
gcloud compute networks subnets create $FIRST_NETWORK-central --network $FIRST_NETWORK \
    --range 10.0.0.0/16 --region us-central1
gcloud compute instances create vm-a --zone us-central1-a --network $FIRST_NETWORK --subnet $FIRST_NETWORK-central
gcloud compute firewall-rules create $FIRST_NETWORK-fw --network $FIRST_NETWORK --allow tcp:22,icmp


# PROJECT_ID2 VPC instance
Changeproject FIRST_PROJECT_ID
gcloud config set project $PROJECT_ID2
gcloud compute networks create $SECOND_NETWORK --subnet-mode custom
gcloud compute networks subnets create $SECOND_NETWORK-central --network $SECOND_NETWORK \
    --range 10.8.0.0/16 --region us-central1
gcloud compute instances create vm-b --zone us-central1-a --network $SECOND_NETWORK --subnet $SECOND_NETWORK-central
gcloud compute firewall-rules create $SECOND_NETWORK-fw --network $SECOND_NETWORK --allow tcp:22,icmp

# Peering
Changeproject PROJECT_ID2
gcloud compute networks peerings create peer-ba \
    --network=$FIRST_NETWORK \
    --peer-project $PROJECT_ID2 \
    --peer-network $PROJECT_NETWORK
gcloud config set project $PROJECT_ID2
gcloud compute networks peerings create peer-ba \
    --network=$SECOND_NETWORK \
    --peer-project $FIRST_PROJECT_ID \
    --peer-network $FIRST_NETWORK 

