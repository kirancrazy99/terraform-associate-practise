REM This command retrieves the email of the service account named "terraform@" using the "gcloud iam service-accounts list" command
for /f "tokens=*" %i in ('gcloud iam service-accounts list --format="value(email)" --filter="name:terraform@"') do set GOOGLE_SERVICE_ACCOUNT=%i

REM This command retrieves the current Google Cloud project using the "gcloud info" command
for /f "tokens=*" %i in ('gcloud info --format="value(config.project)"') do set GOOGLE_CLOUD_PROJECT=%i

REM This command adds the service account to the IAM policy binding of the Google Cloud project with the "roles/editor" role
gcloud projects add-iam-policy-binding %GOOGLE_CLOUD_PROJECT% --member="serviceAccount:%GOOGLE_SERVICE_ACCOUNT%" --role="roles/editor"

REM This command creates a key file named "terraform.json" for the service account using the "gcloud iam service-accounts keys create" command
gcloud iam service-accounts keys create "./terraform.json" --iam-account=%GOOGLE_SERVICE_ACCOUNT%