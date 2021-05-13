#!/bin/sh

echo "Running host setup playbooks"
echo ""

# Generic host setup
echo "Executing generic host setup playbooks"
ansible-playbook -i configuration/inventory modules/ryo-host-setup-generic/host-setup/master.yml

# Common to almost all projects - Module-specific host setup for ryo-service-registry-kv-store
echo "Executing module-specific host setup playbooks for ryo-service-registry-kv-store"
ansible-playbook -i configuration/inventory modules/ryo-service-registry-kv-store/host-setup-module/master.yml

# Common to almost all projects - Module-specific host setup for ryo-loadbalancer-tls-proxy
echo "Executing module-specific host setup playbooks for ryo-loadbalancer-tls-proxy"
ansible-playbook -i configuration/inventory modules/ryo-loadbalancer-tls-proxy/host-setup-module/master.yml

## Other module-specific host setup here...



# Project-specific host setup
echo "Executing project-specific host setup playbooks"
ansible-playbook -i configuration/inventory host-setup-project/master.yml
