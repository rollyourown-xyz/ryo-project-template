## TERRAFORM FILE EXAMPLES FOR DEPLOYMENT OF A COMPONENT

# Deployment of certificate domains for certbot for the project
###############################################################
# module "<COMPONENT_NAME>-cert-domains" {
#   source = "./modules/deploy-cert-domains"

#   depends_on = [ module.deploy-consul ]

#   certificate_domains = {
#     domain_1 = {domain = local.project_domain_name, admin_email = local.project_admin_email},
#     domain_2 = {domain = join("", [ "www.", local.project_domain_name]), admin_email = local.project_admin_email}
#   }
# }


# Deployment of <COMPONENT_NAME> using a static IP address and a plain cloud-init file
######################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-static-ip"

#   depends_on = [ module.deploy-consul ]
  
#   lxd_remote                 = local.lxd_remote_name
#   host_external_ipv4_address = local.lxd_host_public_ipv4_address
#   container_image            = join("-", [ local.project_id, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_id, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = local.project_id
#   container_ipv4_address     = join(".", [ local.LXD_NETWORK_TO_USE, "10" ])

#   container_cloud-init       = file("cloud-init/cloud-TEMPLATE.yml")

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_ID>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT NAME> using a static IP address and a cloud-init template file
#########################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-static-ip"

#   depends_on = [ module.deploy-consul ]

#   lxd_remote                 = local.lxd_remote_name
#   host_external_ipv4_address = local.lxd_host_public_ipv4_address
#   container_image            = join("-", [ local.project_id, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_id, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = local.project_id
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
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_ID>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT_NAME> using a dynamic IP address and a plain cloud-init file
#######################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-dynamic-ip"

#   depends_on = [ module.deploy-consul ]

#   lxd_remote                 = local.lxd_remote_name
#   container_image            = join("-", [ local.project_id, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_id, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = local.project_id

#   container_cloud-init       = file("cloud-init/cloud-TEMPLATE.yml")

#   # OPTIONAL PROXIES - THE FOLLOWING AS EXAMPLE
#   container_proxies = [
#     {name = "proxy0", protocol = "tcp", listen = "80", connect = "80"},
#     {name = "proxy1", protocol = "tcp", listen = "443", connect = "443"},
#   ]

#   # OPTIONAL CONTAINER MOUNTS - THE FOLLOWING AS EXAMPLE
#   container_mounts = [
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_ID>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of <COMPONENT_NAME> using a dynamic IP address and a cloud-init template file
#########################################################################################

# module "deploy-<COMPONENT_NAME>" {
#   source = "./modules/deploy-container-dynamic-ip"

#   depends_on = [ module.deploy-consul ]

#   lxd_remote                 = local.lxd_remote_name
#   container_image            = join("-", [ local.project_id, "COMPONENT_NAME", var.image_version ])
#   container_name             = join("-", [ local.project_id, "COMPONENT_NAME" ])
#   container_profiles         = ["default"]
#   container_network          = local.project_id

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
#     {name = "<NAME>", host_path = "/var/containers/<PROJECT_ID>/<SUBDIRECTORY>", mount_path = "<PATH>", mount_readonly = true}
#   ]
# }


# Deployment of load balancer / TLS proxy configuration for <COMPONENT_NAME>
############################################################################

# module "deploy-<COMPONENT_NAME>-haproxy-backend-service" {
#   source = "./modules/deploy-haproxy-backend-services"

#   depends_on = [ module.deploy-consul ]

#   non_ssl_backend_services = [ join("-", [ local.project_id, "<COMPONENT_NAME>" ]) ]
# }


# module "deploy-<COMPONENT_NAME>-haproxy-acl-configuration" {
#   source = "./modules/deploy-haproxy-configuration"

#   depends_on = [ module.deploy-<COMPONENT_NAME>-haproxy-backend-service ]

#   haproxy_host_only_acls = {
#     domain     = {host = local.project_domain_name},
#     domain-www = {host = join("", [ "www.", local.project_domain_name])}
#   }

#   haproxy_host_path_acls = {
#     domain-admin = {host = local.project_domain_name, path = "/admin"},
#   }
# }


# module "deploy-<COMPONENT_NAME>-haproxy-backend-configuration" {
#   source = "./modules/deploy-haproxy-configuration"

#   depends_on = [ module.deploy-<COMPONENT_NAME>-haproxy-backend-service ]

#   haproxy_acl_denys = [ "domain-admin" ]

#   haproxy_tcp_listeners = {
#     22   = {backend_service = join("-", [ local.project_id, "<COMPONENT_NAME>" ])},
#     3022 = {backend_service = join("-", [ local.project_id, "<COMPONENT_NAME>" ])}
#   }

#   haproxy_acl_use-backends = {
#     domain     = {backend_service = join("-", [ local.project_id, "<COMPONENT_NAME>" ])},
#     domain-www = {backend_service = join("-", [ local.project_id, "<COMPONENT_NAME>" ])}
#   }
# }