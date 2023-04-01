# exit if any of the commands fails
set -o errexit

# initialization of terraform
terraform init -upgrade
terraform get