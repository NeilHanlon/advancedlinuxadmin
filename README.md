# infra

Scripts and code to deploy OpenStack nodes on various providers with OpenStack-Ansible.

Future: Integrate with Netbox to provision and hold IPAM / DCIM


## Ansible

Contains a set of playbooks which will setup hosts with necessary changes and run bootstrap scripts as necessary.

Always supply ``-e 'aio_install=1'`` to scripts when doing an AIO install.

Guide:

* Run init-nodes.yml - `ansible-playbook -i vultr.yml -e 'host=all'`
* Run adhoc-reboot.yml to restart nodes after being upgraded and changing selinux
* Run setup-infra.yml on infra and/or AIO hosts (don't forget -e aio_install=1)
* Run setup-storage.yml on storage hosts, if applicable.
