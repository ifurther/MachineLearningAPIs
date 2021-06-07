#!/bin/sh

if [[ $1 ]];then
FILE_id=$1
else
echo 'please check file name'
fi

if [[ $Bucket_id ]];then

gsutil acl $2 gs://${Bucket_id}/${FILE_id/../}
else
echo 'please check project id'
fi

