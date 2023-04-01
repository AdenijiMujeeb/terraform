locals {
  project = "lambda-arch-project"
}

resource "google_storage_bucket" "raw-datalake" {
  name          = "raw-datalake"
  location      = "europe-west6"
  versioning    = true
  storage_class = ""

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  iam_configuration {
    bindings {
      role    = "roles/storage.objectAdmin"
      members = ["serviceAccount:platform-infra", "serviceAccount:platform-ko"]
    }
    bindings {
      role    = "roles/storage.objectViewer"
      members = ["serviceAccount:viewer-infra", "serviceAccount:viewer-ko"]
    }
    bindings {
      role    = "roles/storage.objectCreator"
      members = ["serviceAccount:creator-infra", "serviceAccount:creator-ko"]
    }
    bindings {
      role    = "roles/storage.admin"
      members = ["serviceAccount:bucket-infra", "serviceAccount:bucket-ko"]
    }
  }
}

resource "google_storage_bucket" "sensitive-datalake" {
  name          = "sensitive-datalake"
  location      = "europe-west6"
  versioning    = true
  storage_class = ""

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }

  iam_configuration {
    bindings {
      role    = "roles/storage.objectAdmin"
      members = ["serviceAccount:platform-infra", "serviceAccount:platform-ko"]
    }
    bindings {
      role    = "roles/storage.objectViewer"
      members = ["serviceAccount:viewer-infra", "serviceAccount:viewer-ko"]
    }
    bindings {
      role    = "roles/storage.objectCreator"
      members = ["serviceAccount:creator-infra", "serviceAccount:creator-ko"]
    }
    bindings {
      role    = "roles/storage.admin"
      members = ["serviceAccount:bucket-infra", "serviceAccount:bucket-ko"]
    }
  }
}
