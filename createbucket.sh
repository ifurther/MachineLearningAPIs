#!/bin/sh

if [ ! -e $1 ] && [ -e $DEVSHELL_PROJECCT_ID ];then
Bucket_id=$DEVSHELL_PROJECCT_ID;
elif [ -e $1 ];then
Bucket_id=$1
else
echo 'please check project id'
fi
export Bucket_id=$Bucket_id
gsutil mb gs://$Bucket_id
