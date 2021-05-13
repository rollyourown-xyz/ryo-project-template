#!/bin/bash

# Add additional help for software package versions defined below
helpMessage()
{
   echo "build-images.sh: Use packer to build images for deployment"
   echo ""
   echo "Help: build-images.sh"
   echo "Usage: ./build-images.sh -v version -w webhook_version -g grav_version"
   echo "Flags:"
   echo -e "-v version \t\t(Mandatory) Version stamp to apply to images, e.g. 20210101-1"
   echo -e "-w webhook_version \t(Optional) Webhook version to use for the haproxy-dmz image, e.g. 2.8.0 (default)"
   echo -e "-h \t\t\tPrint this help message"
   echo ""
   exit 1
}

errorMessage()
{
   echo "Invalid option or mandatory input variable is missing"
   echo "Use \"./build-images.sh -h\" for help"
   exit 1
}

# Default software package versions
# Add software package versions here, for example webhook, needed for loadbalancer / TLS proxy module
webhook_version=2.8.0

# Add additional options for software package versions defined above
while getopts v:h flag
do
    case "${flag}" in
        v) version=${OPTARG};;
        w) webhook_version=${OPTARG};;
        h) helpMessage ;;
        ?) errorMessage ;;
    esac
done

if [ -z "$version" ] || [ -z "$webhook_version" ]
then
   errorMessage
fi

# Add additional software package versions defined above
echo "Building images with version $version, Webhook version $webhook_version"
echo ""

# Common to almost all projects - service registry and key-value store module
# Remove if not needed for this project
echo "Building Consul image"
echo "Executing command: packer build -var \"version=$version\" modules/ryo-service-registry-kv-store/image-build/consul.pkr.hcl"
echo ""
packer build -var "version=$version" modules/ryo-service-registry-kv-store/image-build/consul.pkr.hcl

# Common to almost all projects - loadbalancer / TLS proxy with certificate management module
# Remove if not needed for this project
echo "Building HAProxy image"
echo "Executing command: packer build -var \"version=$version\" -var \"webhook_version=$webhook_version\" image-build/haproxy-dmz.pkr.hcl"
echo ""
packer build -var "version=$version" -var "webhook_version=$webhook_version" image-build/haproxy-dmz.pkr.hcl
echo ""
echo "Building Certbot image"
echo "Executing command: packer build -var \"version=$version\" certbot.pkr.hcl"
echo ""
packer build -var "version=$version" image-build/certbot.pkr.hcl
echo ""

# Project-specific image builds here..., for example
#echo "Building webserver image"
#echo "Executing command: packer build -var \"version=$version\" -var \"grav_version=$grav_version\" webserver.pkr.hcl"
#echo ""
#packer build -var "version=$version" -var "grav_version=$grav_version" image-build/webserver.pkr.hcl
#echo ""

echo "Completed"
