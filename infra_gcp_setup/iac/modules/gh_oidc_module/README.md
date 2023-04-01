 'github_actions_sa@${ PROJECT_ID }.iam.gserviceaccount.com'
 'projects/lambda-377114/locations/global/workloadIdentityPools/lambda-pool/providers/gh-oidc-provider'

 - id: 'list-buckets-contents'
        run: |-
          curl -sSf https://storage.googleapis.com/storage/v1/b/iodc-keystore/o \
          --header "Authorization: Bearer ${{ steps.auth.outputs.access_token }}"