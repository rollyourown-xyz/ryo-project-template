# rollyourown Project Template

This is the template repository structure for a [rollyourown.xyz](https://rollyourown.xyz) project.

## How to use this template

Clone this repository as a starting point for a new project and make the following changes:

- Add additional parameters needed for the project in the [`configuration/configuration_TEMPLATE.yml`](./configuration/configuration_TEMPLATE.yml) configuration file, and change the [`project_id`](http://rollyourown.xyz/collaborate/project_and_module_development/project_structure/#the-project_id) for the new project
- Add additional Ansible playbooks, roles and tasks for project-specific host setup in the [`host-setup`](./host-setup/) directory
- Add Packer templates for each project component in the `image-build` directory
- Add Ansible playbooks for each component in the `image-build/playbooks` directory with Ansible roles and tasks for the component in the `image-build/playbooks/roles/` directory
- Add terraform files, cloud-init files and additional modules if necessary in the `project-deployment` directory
- Modify the scripts in the `scripts-project` directory, if necessary
- Modify the`MODULES` variable in the `deploy.sh`, `upgrade.sh`, `backup.sh` and `restore.sh` scripts to include the modules used by the project
- Update the `README` for the new project

---

## **Template content**

The following can be used as the structure for a rollyourown project README.

ABC
