#!/bin/bash

iface_mgmt=$(ip addr | grep 172.29.220 | awk '{print $NF}')
iface_vxlan=$(ip addr | grep 172.29.224 | awk '{print $NF}')
iface_storage=$(ip addr | grep 172.29.228 | awk '{print $NF}')

if [[ -z "${iface_mgmt}" ]]; then
        echo "can't find mgmt interface"
else
        echo "mgmt interface is: ${iface_mgmt}"
fi

if [[ -z "${iface_vxlan}" ]]; then
        echo "can't find vxlan interface"
else
        echo "vxlan interface is: ${iface_vxlan}"
fi

if [[ -z "${iface_storage}" ]]; then
        echo "can't find storage interface"
else
        echo "storage interface is: ${iface_storage}"
fi


if [[ -z "${iface_mgmt}" && ( -z "${iface_vxlan}" || -z "${iface_storage}" ) ]]; then
        echo "Stopping. Only a mgmt interface found. Need at least one of vxlan or storage"
        exit 1
fi

cat << EOF > ifcfg-br-mgmt
BOOTPROTO=none
DEVICE=br-mgmt
NM_CONTROLLED=no
IPADDR=172.29.220.5
NETMASK=255.255.252.0
ONBOOT=yes
TYPE=Bridge
USERCTL=no
EOF

cat << EOF > ifcfg-${iface_mgmt}
TYPE=Ethernet
DEVICE=${iface_mgmt}
ONBOOT=yes
BRIDGE=br-mgmt
HWADDR=$(ip link show ${iface_mgmt} | awk '/link\/ether/{print $2}')
EOF

cat << EOF > ifcfg-br-mgmt\:10
DEVICE=br-mgmt:10
ONPARENT=on
IPADDR=172.29.220.10
PREFIX=22
EOF

cat << EOF > ifcfg-br-mgmt\:11
DEVICE=br-mgmt:11
ONPARENT=on
IPADDR=172.29.220.11
PREFIX=22
EOF

#cat << EOF > ifcfg-br-storage
#BOOTPROTO=none
#DEVICE=br-storage
#IPADDR=172.29.228.5
#NETMASK=255.255.252.0
#NM_CONTROLLED=no
#ONBOOT=yes
#TYPE=Bridge
#USERCTL=no
#EOF

#cat << EOF > ifcfg-${iface_storage}
#TYPE=Ethernet
#DEVICE=${iface_storage}
#ONBOOT=yes
#BRIDGE=br-storage
#HWADDR=$(ip link show ${iface_storage} | awk '/link\/ether/{print $2}')
#EOF

cat << EOF > ifcfg-br-vxlan
BOOTPROTO=none
DEVICE=br-vxlan
IPADDR=172.29.224.5
NETMASK=255.255.252.0
NM_CONTROLLED=no
ONBOOT=yes
TYPE=Bridge
USERCTL=no
EOF

cat << EOF > ifcfg-${iface_vxlan}
TYPE=Ethernet
DEVICE=${iface_vxlan}
ONBOOT=yes
BRIDGE=br-vxlan
HWADDR=$(ip link show ${iface_vxlan} | awk '/link\/ether/{print $2}')
EOF

