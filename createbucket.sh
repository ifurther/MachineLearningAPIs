#!/bin/bash

if [ ! -e $1 ] && [ -e $DEVSHELL_PROJECT_ID ];then
Bucket_id=$DEVSHELL_PROJECT_ID;
elif [ -e $1 ];then
Bucket_id=$1
else
echo 'please check project id'
fi
export Bucket_id=$Bucket_id
gsutil mb gs://${Bucket_id} #2> success-stderr > success-stdout
