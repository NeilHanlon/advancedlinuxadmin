# Ansible

Ansible playbooks, roles, modules, etc will come here. This wiki will reflect the layout, structure, and potential standards that should be followed when making playbooks and roles.

Each playbook should have comments or a name descriptor that explains what the playbook does or how it is used. If not available, README-... files can be used in place, especially in the case of adhoc playbooks that take input. Documentation for each playbook/role does not have to be on this wiki. Comments or README's should be sufficient.

## Management Node Structure

```
.
├── ansible.cfg
├── collections
├── files -> playbooks/files
├── handlers -> playbooks/handlers
├── inventories
│   ├── production
│   |   ├── group_vars
│   |   ├── host_vars
│   |   hosts
│   ├── staging
│   ├── devellopment
├── pkistore
├── playbooks
│   ├── files
│   ├── handlers
│   ├── tasks
│   ├── templates
│   ├── vars
├── roles/local
│   └── <role-name>
│   └── requirements.yml
├── tasks -> playbooks/tasks
├── templates -> playbooks/templates
└── vars -> playbooks/vars
```

## Structure

What each folder represents

```
files      -> As the name implies, non-templated files go here. Files that are
              dropped somewhere on the file system should be laid out in a way
              that represents the file system (eg. ./etc/sysconfig/)
group_vars -> Group Variables go here if they are not fulfilled in an inventory.
              Recommended that group_vars be used over inventory vars.
host_vars  -> Host variables go here
inventory  -> All static inventories go here
roles      -> Custom roles can go here
tasks      -> Common tasks come here
templates  -> Templates go here
vars       -> Global variables that are called with vars_files go here. This
```

## Current Playbook Naming

```
init-* -> Starting infrastructure playbooks that run solo or import other
          playbooks that start with import-
adhoc  -> These playbooks are one-off playbooks that can be used on the CLI or
          in AWX. These are typically for basic tasks.
import -> Playbooks that should be imported from the top level playbooks
role-* -> These playbooks call roles specifically for infrastructure tasks.
          Playbooks that do not call a role should be named init or adhoc based
          on their usage.
```

### Pre-commits / linting

When pushing to your own forked version of this repository, pre-commit must run to verify your changes. They must be passing to be pushed up. This is an absolute requirement, even for roles.

When the linter passes, the push will complete and you will be able to open a PR.

## General YAML Formatting

It is recommended that each yaml file starts with `---` and ends with `...`. This can help with linting and also stating an obvious end to the file.

### Plugin and Formatting Assistance

The YAML format is extremely easy and can be generally followed without much to think about, the same goes with ansible's syntax. Ideally, your editor can assist with these things. If you are a vim user, the following plugins can be useful:

```
stephpy/vim-yaml
pearofducks/ansible-vim
vim-syntastic/syntastic
```

These can be installed using [vim-plug](https://github.com/junegunn/vim-plug).
