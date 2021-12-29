dnf -y upgrade &

HOSTNAME="$(hostname)"

if [[ $(hostname) =~ infra ]]; then
    dnf -y install git-core git wget python36 chrony openssh-server python3-devel sudo
    git clone --branch feature/rocky8 --single-branch https://github.com/NeilHanlon/openstack-ansible.git /opt/openstack-ansible
fi

# Always stop and mask firewalld
systemctl stop firewalld
systemctl mask firewalld

# Always set to permissive.
sed -i 's/enforcing/permissive/' /etc/sysconfig/selinux
sed -i 's/enforcing/permissive/' /etc/selinux/config

# Disable agent forwarding, in case user forwards agent, so as not to confuse ansible
cat << EOF | tee -a /etc/ssh/sshd_config
Match User root
  AllowAgentForwarding no

EOF

systemctl restart sshd

touch /etc/cloud/cloud-init.disabled || exit 1
true
