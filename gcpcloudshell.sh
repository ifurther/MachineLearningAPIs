#!/bin/sh

CheckProjectID(){
	if [ ! -e $DEVSHELL_PROJECT_ID ];then
		read -p 'Please type project_id' project_id
		echo $project_id
		gcloud config set project $project_id
	fi
}
