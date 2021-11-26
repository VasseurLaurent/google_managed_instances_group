/*
* ## Description
*
* This module creates a Google compute instance template and launch an instance group with this template.
* You can add a startup script to automate jobs
*/



resource "google_service_account" "sa" {
  account_id   = var.account_id
  display_name = "sa-${var.name}"
}


resource "google_compute_instance_template" "template" {
  name                    = "template-${var.name}"
  machine_type            = var.machine_type
  metadata_startup_script = var.metadata_startup_script

  disk {
    source_image = var.source_image
    auto_delete  = true
    disk_size_gb = var.disk_size
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
  can_ip_forward = false

  service_account {
    email  = google_service_account.sa.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_region_instance_group_manager" "manager" {
  name               = "manager-${var.name}"
  base_instance_name = var.base_instance_name
  region             = var.region

  version {
    name              = var.name
    instance_template = google_compute_instance_template.template.id
  }

  target_pools = [google_compute_target_pool.target.id]
}

resource "google_compute_region_autoscaler" "autoscaler" {
  name   = "autoscaler-${var.name}"
  region = var.region
  target = google_compute_region_instance_group_manager.manager.id

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    cpu_utilization {
      target = var.cpu_target_threshold
    }
  }
}

resource "google_compute_target_pool" "target" {
  name   = "target-${var.name}"
  region = var.region
}