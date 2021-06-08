gcloud iam service-accounts create my-account --display-name my-account
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=serviceAccount:my-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --role=roles/bigquery.admin
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member=serviceAccount:my-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com --role=roles/storage.objectAdmin
gcloud iam service-accounts keys create key.json --iam-account=my-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/key.json

#gsutil cp gs://$DEVSHELL_PROJECT_ID/analyze-images.py .
