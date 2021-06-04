#!/bin/sh

echo "Getting modules from repositories"
echo ""

## Common to all projects - generic host setup repository
echo "Executing 'git submodule add' for ryo-host repository"
git submodule add https://git.rollyourown.xyz/ryo-projects/ryo-host modules/ryo-host

## Common to almost all projects - service registry / KV store
echo "Executing 'git submodule add' for ryo-service-registry-kv-store"
git submodule add https://git.rollyourown.xyz/ryo-projects/ryo-service-registry-kv-store modules/ryo-service-registry-kv-store

## Common to almost all projects - loadbalancer / TLS proxy repository
echo "Executing 'git submodule add' for ryo-loadbalancer-tls-proxy repository"
git submodule add https://git.rollyourown.xyz/ryo-projects/ryo-loadbalancer-tls-proxy modules/ryo-loadbalancer-tls-proxy

## Project specific submodules
#echo "Executing 'git submodule add' for <PROJECT MODULE> repository"
#git submodule add https://git.rollyourown.xyz/ryo-projects/<PROJECT MODULE> modules/<PROJECT MODULE>

#echo "Executing 'git submodule add' for <PROJECT MODULE> repository"
#git submodule add https://git.rollyourown.xyz/ryo-projects/<PROJECT MODULE> modules/<PROJECT MODULE>
