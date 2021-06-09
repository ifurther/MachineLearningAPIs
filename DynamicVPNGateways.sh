#!/bin/sh
# Dynamic VPN Gateways

#export FIRST_PROJECT_ID=qwiklabs-gcp-04-4b1f1a86d43a
export FIRST_NETWORK=network-a
export FIRST_Region=us-east1
export FIRST_SUBNET=10.5.4.0/24
export FIRST_ZONE=us-east1-b
export SECOND_NETWORK=network-b
export SECOND_Region=europe-west1
export SECOND_SUBNET=10.1.3.0/24

EnvToArray() {
	for i in $(env |grep ${!1});do
		eval $(echo $i|sed 's/=/]=/g' |sed 's/\_/[/g');done
}

CreateCustomVPC() {
	Array=${!1}
	gcloud compute networks create $Array[NETWORK] --subnet-mode custom
	gcloud compute networks subnets create $Array[NETWORK] --network $Array[NETWORK] \
    		--range Array[SUBNET] --region $Array[Region]
}
