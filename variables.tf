
variable "name" {
  description = "Name given to the managed instance"
  type        = string
}

variable "ssh_user" {
  description = "Default SSH user to give SSH acces"
  type        = string
}

variable "account_id" {
  description = "Account id"
  type        = string
}

variable "source_image" {
  description = "Source image of instances deployed in the instance group"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "disk_size" {
  description = "Size of disks deployed by the instance group"
  type        = number
  default     = 10
}

variable "ssh_key" {
  description = "SSH key authorized to connect to machines"
  type        = string
}

variable "machine_type" {
  description = "Type of machine to deploy in the instance group"
  type        = string
}

variable "region" {
  description = "Region to deploy the instance group"
  type        = string
  default     = "asia-south1"
}

variable "base_instance_name" {
  description = "Base name given to instance group"
  type        = string
  default     = "mig"
}

variable "max_replicas" {
  description = "Maximum number of instances to deploy"
  type        = number
  default     = 2
}

variable "min_replicas" {
  description = "Minimum number of instances to deploy"
  type        = number
  default     = 1
}

variable "cooldown_period" {
  description = "Cooldown period before launching a new machine if needed in seconds"
  type        = number
  default     = 60
}

variable "cpu_target_threshold" {
  description = "CPU threshold for triggering new deployments"
  type        = number
  default     = 0.8
}

variable "metadata_startup_script " {
  description = "Metadata startup script to execute"
  type        = string
  default     = ""
}