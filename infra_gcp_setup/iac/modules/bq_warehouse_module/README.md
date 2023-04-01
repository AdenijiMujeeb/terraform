   "bq_prod_dwh": {
        "dataset_id": "bq_prod_dwh",
        "location" : "europe-west6",
        "friendly_name" : "Name",
        "description" : "This dataset is used for storing data to be mask.",
        "role": "roles/bigquery.admin",
        "service_account": "account2@<project>.iam.gserviceaccount.com"
        "delete_contents_on_destroy": true
    }

# https://cloud.google.com/bigquery/docs/access-control-basic-roles
# https://cloud.google.com/bigquery/docs/access-control#bigquery.dataViewer
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
# https://stackoverflow.com/questions/74586936/how-to-create-a-multiple-datasets-and-set-acess-in-bigquery