#!/bin/bash

if ! [[ $1 ]] && [[ $DEVSHELL_PROJECT_ID ]];then
Bucket_id=$DEVSHELL_PROJECT_ID;
elif [[ $1 ]];then
Bucket_id=$1
else
echo 'please check project id'
fi
export Bucket_id=$Bucket_id
gsutil mb -c multi_regional gs://${Bucket_id} #2> success-stderr > success-stdout
