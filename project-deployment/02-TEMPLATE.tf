## TEMPLATE TERRAFORM FILE FOR DEPLOYMENT OF A COMPONENT

# Deployment of <COMPONENT_NAME> using a static IP address and a plain cloud-init file
######################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-static-ip"

#   lxd_remote                 = local.lxd_remote_name
#   host_external_ipv4_address = local.lxd_host_public_ipv4_address
#   container_image            = join("-", [ local.project_name, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_name, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = "LXD NETWORK TO USE"
#   container_ipv4_address     = join(".", [ local.LXD_NETWORK_TO_USE, "10" ])

#   container_cloud-init       = file("cloud-init/cloud-TEMPLATE.yml")

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_NAME>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT NAME> using a static IP address and a cloud-init template file
#########################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-static-ip"

#   lxd_remote                 = local.lxd_remote_name
#   host_external_ipv4_address = local.lxd_host_public_ipv4_address
#   container_image            = join("-", [ local.project_name, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_name, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = "LXD NETWORK TO USE"
#   container_ipv4_address     = join(".", [ local.LXD_NETWORK_TO_USE, "10" ])

#   container_cloud-init = templatefile(
#     "cloud-init/cloud-init-<COMPONENT_NAME>.tpl.yml",
#     {
#       variable_to_pass    = local.VARIABLE_NAME,
#       variable_to_pass    = local.VARIABLE_NAME
#     })

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_NAME>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT_NAME> using a dynamic IP address and a plain cloud-init file
#######################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-dynamic-ip"

#   lxd_remote                 = local.lxd_remote_name
#   container_image            = join("-", [ local.project_name, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_name, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = "LXD NETWORK TO USE"

#   container_cloud-init       = file("cloud-init/cloud-TEMPLATE.yml")

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_NAME>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT_NAME> using a dynamic IP address and a cloud-init template file
#########################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-dynamic-ip"

#   lxd_remote                 = local.lxd_remote_name
#   container_image            = join("-", [ local.project_name, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_name, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = "LXD NETWORK TO USE"

#   container_cloud-init = templatefile(
#     "cloud-init/cloud-init-<COMPONENT_NAME>.tpl.yml",
#     {
#       variable_to_pass    = local.VARIABLE_NAME,
#       variable_to_pass    = local.VARIABLE_NAME
#     })

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_NAME>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }
