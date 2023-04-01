resource "google_service_account" "default" {
  account_id   = "service_account_id"
  display_name = "Service Account"
}

#creating virtual Private Cloud Network
resource "google_compute_network" "vpc_network" {
  name                    = "${var.company}-vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

#creating subnet and attaching it with vpc
resource "google_compute_subnetwork" "default" {
  name          = "${var.company}-subnet"
  ip_cidr_range = var.subnet
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

#creating a VM Instance 
resource "google_compute_instance" "default" {
  name         = local.instance_name
  machine_type = "e2-micro"
  zone         = var.region
  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

# Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python3-pip rsync; pip install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.default.name

    access_config {
      // Ephemeral public IP
    }
  }
  
# vpc_flask_quickstart_ssh_fw
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.name
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# vpc_flask_quickstart_5000_fw
resource "google_compute_firewall" "flask" {
  name    = "${var.company}-flask-app-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# storage_bucket_tf_with_versioning
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = var.region
  storage_class = var.storage_class
  versioning {
    enabled = true
  }
}

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}