#!/bin/sh

if [ -e $1 ];then
FILE_id=$1
else
echo 'please check file name'
fi

if [ -e $Bucket_id ];then
gsutil mb ./FILE_id gs://$Bucket_id/FILE_id
else
echo 'please check project id'
fi


