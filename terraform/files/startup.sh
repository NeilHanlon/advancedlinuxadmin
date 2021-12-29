dnf -y install git-core git wget python36 chrony openssh-server python3-devel sudo
systemctl stop firewalld
systemctl mask firewalld
sed -i 's/enforcing/permissive/' /etc/sysconfig/selinux
sed -i 's/enforcing/permissive/' /etc/selinux/config
#git clone --branch feature/rocky8 --single-branch https://github.com/NeilHanlon/openstack-ansible.git /opt/openstack-ansible
touch /etc/cloud/cloud-init.disabled
#dnf -y install https://repos.fedorapeople.org/repos/openstack/openstack-xena/rdo-release-xena-1.el8.noarch.rpm
cat << EOF | tee -a /etc/ssh/sshd_config

Match User root
  AllowAgentForwarding no

EOF

systemctl restart sshd
#cp /opt/ansible-runtime/lib/python3.6/site-packages/ansible/plugins/connection/ssh.py /etc/ansible/roles/plugins/connection/ssh.py
