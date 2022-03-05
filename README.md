<!--
SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# rollyourown Project Template

This is the template repository structure for a [rollyourown.xyz](https://rollyourown.xyz) project.

---

The general architecture of a rollyourown.xyz project is documented [here](https://rollyourown.xyz/collaborate/project_and_module_development/general_architecture/)

The structure of a rollyourown.xyz project (which this template provides) is documented [here](https://rollyourown.xyz/collaborate/project_and_module_development/project_structure/)

## How to Use this Template

Clone this repository as a starting point for a new project and make the following changes:

- Add additional parameters needed for the project in the [`configuration/configuration_TEMPLATE.yml`](./configuration/configuration_TEMPLATE.yml) configuration file, and change the [`project_id`](https://rollyourown.xyz/collaborate/project_and_module_development/project_structure/#the-project_id) for the new project
- Add additional Ansible playbooks, roles and tasks for project-specific host setup in the [`host-setup`](./host-setup/) directory
- Add [Packer](https://www.packer.io/) templates and [Ansible](https://www.ansible.com/) playbooks for each project component in the [`image-build`](./image-build/) directory
- Add [Terraform](https://www.terraform.io/) and [cloud-init](https://cloud-init.io/) files in the [`project-deployment`](./project-deployment/) directory
- Modify the scripts in the [`scripts-project`](./image-build/) directory, if necessary
- Modify the`MODULES` variable in the [`deploy.sh`](./deploy.sh), [`upgrade.sh`](./upgrade.sh), [`backup.sh`](./backup.sh) and [`restore.sh`](./restore.sh) scripts to include the modules used by the project
- Update the [`README`](./README.md) for the new project

This template README can be used for the new project by deleting this part, changing the title and introductory text above, and completing the sections below.

---

This is a [rollyourown.xyz project](https://rollyourown.xyz/rollyourown/projects/) to deploy <PROJECT_PURPOSE> using Ansible, Packer and Terraform.

## Project Summary

This project uses [Ansible](https://www.ansible.com/), [Packer](https://www.packer.io/) and [Terraform](https://www.terraform.io/) to deploy...

_A short summary of the purpose of the project / module._

## How to Use

A detailed description of how to use a rollyourown.xyz project to deploy and maintain an open source solution can be found [on the rollyourown.xyz website](https://rollyourown.xyz/rollyourown/how_to_use/).

In summary, to deploy a project:

1. Acquire [a domain](https://rollyourown.xyz/rollyourown/how_to_use/deploy/#a-domain) to use for your project, or re-use a domain you already own

2. Prepare a [control node](https://rollyourown.xyz/rollyourown/how_to_use/control_node/) with the basic software to run the [rollyourown.xyz](https://rollyourown.xyz) automation scripts, or use an existing control node you have previously set up

3. Prepare a [host server](https://rollyourown.xyz/rollyourown/how_to_use/host_server/) for deploying the project to, or use an existing host server you have previously set up

4. Enter the working directory (e.g. `~/ryo-projects`) on the control node and clone the project repository from [Codeberg](https://codeberg.org/) or [GitHub](https://github.com/)

        cd ~/ryo-projects
        git clone https://codeberg.org/rollyourown-xyz/<PROJECT_NAME>.git

    or

        cd ~/ryo-projects
        git clone https://github.com/rollyourown-xyz/<PROJECT_NAME>.git

5. Copy the project's configuration file and add settings

        cd ~/ryo-projects/<PROJECT_NAME>
        cp configuration/configuration_TEMPLATE.yml configuration/configuration_<HOST_NAME>.yml
        nano configuration/configuration_<HOST_NAME>.yml

6. Run the deployment script from the project directory

        cd ~/ryo-projects/<PROJECT_NAME>
        ./deploy.sh -n <HOST_NAME> -v <VERSION>

## How to Collaborate

We would be delighted if you would like to contribute to [rollyourown.xyz](https://rollyourown.xyz) and there are a number of ways you can collaborate on this project:

- [Raising security-related issues](https://rollyourown.xyz/collaborate/security_vulnerabilities/)
- [Contributing bug reports, feature requests and ideas](https://rollyourown.xyz/collaborate/bug_reports_feature_requests_ideas/)
- [Improving the project](https://rollyourown.xyz/collaborate/existing_projects_and_modules/) - e.g. to provide fixes or enhancements

You may also like to contribute to the wider [rollyourown.xyz](https://rollyourown.xyz/) project by, for example:

- [Contributing a new project or module](https://rollyourown.xyz/collaborate/new_projects_and_modules/)
- [Contributing to the rollyourown.xyz website content](https://rollyourown.xyz/collaborate/website_content/) or [design](https://rollyourown.xyz/collaborate/website_design/)
- [Maintaining a rollyourown.xyz repository](https://rollyourown.xyz/collaborate/working_with_git/what_is_git/#project-maintainer)

Issues for this project can be submitted on [Codeberg](https://codeberg.org/) (_preferred_) or [GitHub](https://github.com/):

- Issues on Codeberg: [here](https://codeberg.org/rollyourown-xyz/<PROJECT_NAME>/issues)
- Issues on GitHub: [here](https://github.com/rollyourown-xyz/<PROJECT_NAME>/issues)

## Security Vulnerabilities

If you have found a security vulnerability in any [rollyourown.xyz](https://rollyourown.xyz/) service or any of the [rollyourown.xyz](https://rollyourown.xyz/) projects, modules or other repositories, please read our [security disclosure policy](https://rollyourown.xyz/collaborate/security_vulnerabilities/) and report this via our [security vulnerability report form](https://forms.rollyourown.xyz/security-vulnerability).

## Repository Links

For public contributions, we maintain mirror repositories of this project on [Codeberg](https://codeberg.org) and [GitHub](https://github.com):

- [https://codeberg.org/rollyourown-xyz/<PROJECT_NAME>](https://codeberg.org/rollyourown-xyz/<PROJECT_NAME>)
- [https://github.com/rollyourown-xyz/<PROJECT_NAME>](https://github.com/rollyourown-xyz/<PROJECT_NAME>)

Our preferred collaboration space is Codeberg:

<a href="https://codeberg.org/rollyourown-xyz/<PROJECT_NAME>"><img alt="Get it on Codeberg" src="https://get-it-on.codeberg.org/get-it-on-blue-on-white.png" height="60"></a>

The primary repository for this project is hosted on our own Git repository server at:

- [https://git.rollyourown.xyz/ryo-projects/<PROJECT_NAME>](https://git.rollyourown.xyz/ryo-projects/<PROJECT_NAME>)

**Repositories on our own Git server are accessible only to members of our organisation**.
