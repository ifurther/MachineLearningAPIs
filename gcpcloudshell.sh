#!/bin/sh

CheckProjectID(){
	if [ ! -e $DEVSHELL_PROJECT_ID ];then
		read -p 'Please type project_id' project_id
		echo $project_id
		gcloud config set project $project_id
	fi
}

GETACCESSTOKEN(){
	ACCESS_TOKEN=$(gcloud auth print-access-token)
	echo $ACCESS_TOKEN
}

GETAPIKEY(){
	API_KEY=$(curl -X POST https://apikeys.googleapis.com/v1/projects/$PROJECT_ID/apiKeys?access_token=$ACCESS_TOKEN | jq -r ".currentKey")

	echo $API_KEY
}
