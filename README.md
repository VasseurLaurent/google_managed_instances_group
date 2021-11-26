## Description

This module creates a Google compute instance template and launch an instance group with this template.
You can add a startup script to automate jobs

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance_template.template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template) | resource |
| [google_compute_region_autoscaler.autoscaler](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_autoscaler) | resource |
| [google_compute_region_instance_group_manager.manager](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager) | resource |
| [google_compute_target_pool.target](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_pool) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Account id | `string` | n/a | yes |
| <a name="input_base_instance_name"></a> [base\_instance\_name](#input\_base\_instance\_name) | Base name given to instance group | `string` | `"mig"` | no |
| <a name="input_cooldown_period"></a> [cooldown\_period](#input\_cooldown\_period) | Cooldown period before launching a new machine if needed in seconds | `number` | `60` | no |
| <a name="input_cpu_target_threshold"></a> [cpu\_target\_threshold](#input\_cpu\_target\_threshold) | CPU threshold for triggering new deployments | `number` | `0.8` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Size of disks deployed by the instance group | `number` | `10` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Type of machine to deploy in the instance group | `string` | n/a | yes |
| <a name="input_max_replicas"></a> [max\_replicas](#input\_max\_replicas) | Maximum number of instances to deploy | `number` | `2` | no |
| <a name="input_metadata_startup_script "></a> [metadata\_startup\_script ](#input\_metadata\_startup\_script ) | Metadata startup script to execute | `string` | `""` | no |
| <a name="input_min_replicas"></a> [min\_replicas](#input\_min\_replicas) | Minimum number of instances to deploy | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Name given to the managed instance | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy the instance group | `string` | `"asia-south1"` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | Source image of instances deployed in the instance group | `string` | `"debian-cloud/debian-11"` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key authorized to connect to machines | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Default SSH user to give SSH acces | `string` | n/a | yes |

## Outputs

No outputs.
