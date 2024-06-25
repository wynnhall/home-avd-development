# IT_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| IT_FABRIC | l2leaf | hs1cupit01a | 10.211.240.24/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hs1cupit02a | 10.211.240.25/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hs1llkk01a | 10.211.240.22/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hs1llkk02a | 10.211.240.23/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hsm2vit01a | 10.215.242.20/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hsm2vit02a | 10.215.242.21/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hsm3vit01a | 10.215.242.23/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hsm3vit02a | 10.215.242.24/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | hsmpgit01a | 10.215.242.22/23 | 722XP | Provisioned | - |
| IT_FABRIC | l3leaf | IS00AIT01A | 10.215.241.10/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is00bit01a | 10.215.241.11/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is00cit01a | 10.215.241.12/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is01ait01a | 10.215.241.13/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is01bit01a | 10.215.241.14/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is01cit01a | 10.215.241.15/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is02ait01a | 10.215.241.16/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is02bit01a | 10.215.241.17/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is03ait01a | 10.215.241.18/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is03bit01a | 10.215.241.19/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11ait01a | 10.211.240.13/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11beit01a | 10.211.240.21/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11cit01a | 10.211.240.12/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11cwit01a | 10.211.240.17/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11deit01a | 10.211.240.20/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11ewit01a | 10.211.240.16/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11git01a | 10.211.240.11/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11gwit01a | 10.211.240.15/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11heit01a | 10.211.240.19/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11jit01a | 10.211.240.10/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11jwit01a | 10.211.240.14/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | is11keit01a | 10.211.240.18/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism0wit01a | 10.215.242.10/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism1vit01a | 10.215.242.19/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism1wit01a | 10.215.242.11/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism1yit01a | 10.215.242.18/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism2wit01a | 10.215.242.12/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism3wit01a | 10.215.242.17/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism3xnit01a | 10.215.242.13/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism3xnit02a | 10.215.242.14/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism3xsit01a | 10.215.242.15/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ism3xsit02a | 10.215.242.16/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ismitagg01aa | 10.210.80.65/21 | 7050X3 | Provisioned | - |
| IT_FABRIC | l3leaf | ismitagg01ba | 10.210.80.66/21 | 7050X3 | Provisioned | - |
| IT_FABRIC | l3leaf | isms1itbl01a | 10.210.80.63/21 | 7280R3 | Provisioned | - |
| IT_FABRIC | l3leaf | ISMS1ITBL02A | 10.210.80.64/21 | 7280R3 | Provisioned | - |
| IT_FABRIC | spine | isms1itsp01a | 10.210.80.60/21 | 7300X3 | Provisioned | - |
| IT_FABRIC | spine | isms1itsp02a | 10.210.80.61/21 | 7300X3 | Provisioned | - |
| IT_FABRIC | spine | isms1itsp03a | 10.210.80.62/21 | 7300X3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l2leaf | hs1cupit01a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet8 |
| l2leaf | hs1cupit01a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet8 |
| l2leaf | hs1cupit02a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet9 |
| l2leaf | hs1cupit02a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet9 |
| l2leaf | hs1llkk01a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet6 |
| l2leaf | hs1llkk01a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet6 |
| l2leaf | hs1llkk02a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet7 |
| l2leaf | hs1llkk02a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet7 |
| l2leaf | hsm2vit01a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet1 |
| l2leaf | hsm2vit01a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet1 |
| l2leaf | hsm2vit02a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet2 |
| l2leaf | hsm2vit02a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet2 |
| l2leaf | hsm3vit01a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet4 |
| l2leaf | hsm3vit01a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet4 |
| l2leaf | hsm3vit02a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet5 |
| l2leaf | hsm3vit02a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet5 |
| l2leaf | hsmpgit01a | Ethernet49 | l3leaf | ismitagg01aa | Ethernet3 |
| l2leaf | hsmpgit01a | Ethernet50 | l3leaf | ismitagg01ba | Ethernet3 |
| l3leaf | IS00AIT01A | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet3/5/1 |
| l3leaf | IS00AIT01A | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet3/5/1 |
| l3leaf | IS00AIT01A | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet3/5/1 |
| l3leaf | is00bit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet4/5/1 |
| l3leaf | is00bit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet4/5/1 |
| l3leaf | is00bit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet4/5/1 |
| l3leaf | is00cit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet5/5/1 |
| l3leaf | is00cit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet5/5/1 |
| l3leaf | is00cit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet5/5/1 |
| l3leaf | is01ait01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet6/5/1 |
| l3leaf | is01ait01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet6/5/1 |
| l3leaf | is01ait01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet6/5/1 |
| l3leaf | is01bit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/5/1 |
| l3leaf | is01bit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/5/1 |
| l3leaf | is01bit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/5/1 |
| l3leaf | is01cit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/5/1 |
| l3leaf | is01cit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/5/1 |
| l3leaf | is01cit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/5/1 |
| l3leaf | is02ait01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet3/6/1 |
| l3leaf | is02ait01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet3/6/1 |
| l3leaf | is02ait01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet3/6/1 |
| l3leaf | is02bit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet4/6/1 |
| l3leaf | is02bit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet4/6/1 |
| l3leaf | is02bit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet4/6/1 |
| l3leaf | is03ait01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet5/6/1 |
| l3leaf | is03ait01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet5/6/1 |
| l3leaf | is03ait01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet5/6/1 |
| l3leaf | is03bit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet6/6/1 |
| l3leaf | is03bit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet6/6/1 |
| l3leaf | is03bit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet6/6/1 |
| l3leaf | is11ait01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet4/2/1 |
| l3leaf | is11ait01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet4/2/1 |
| l3leaf | is11ait01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet4/2/1 |
| l3leaf | is11beit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet6/3/1 |
| l3leaf | is11beit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet6/3/1 |
| l3leaf | is11beit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet6/3/1 |
| l3leaf | is11cit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet3/2/1 |
| l3leaf | is11cit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet3/2/1 |
| l3leaf | is11cit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet3/2/1 |
| l3leaf | is11cwit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/2/1 |
| l3leaf | is11cwit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/2/1 |
| l3leaf | is11cwit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/2/1 |
| l3leaf | is11deit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet5/3/1 |
| l3leaf | is11deit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet5/3/1 |
| l3leaf | is11deit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet5/3/1 |
| l3leaf | is11ewit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/2/1 |
| l3leaf | is11ewit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/2/1 |
| l3leaf | is11ewit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/2/1 |
| l3leaf | is11git01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/1/1 |
| l3leaf | is11git01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/1/1 |
| l3leaf | is11git01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/1/1 |
| l3leaf | is11gwit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet6/2/1 |
| l3leaf | is11gwit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet6/2/1 |
| l3leaf | is11gwit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet6/2/1 |
| l3leaf | is11heit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet4/3/1 |
| l3leaf | is11heit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet4/3/1 |
| l3leaf | is11heit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet4/3/1 |
| l3leaf | is11jit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/1/1 |
| l3leaf | is11jit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/1/1 |
| l3leaf | is11jit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/1/1 |
| l3leaf | is11jwit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet5/2/1 |
| l3leaf | is11jwit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet5/2/1 |
| l3leaf | is11jwit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet5/2/1 |
| l3leaf | is11keit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet3/3/1 |
| l3leaf | is11keit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet3/3/1 |
| l3leaf | is11keit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet3/3/1 |
| l3leaf | ism0wit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/3/1 |
| l3leaf | ism0wit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/3/1 |
| l3leaf | ism0wit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/3/1 |
| l3leaf | ism1vit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/6/1 |
| l3leaf | ism1vit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/6/1 |
| l3leaf | ism1vit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/6/1 |
| l3leaf | ism1wit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/3/1 |
| l3leaf | ism1wit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/3/1 |
| l3leaf | ism1wit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/3/1 |
| l3leaf | ism1yit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/6/1 |
| l3leaf | ism1yit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/6/1 |
| l3leaf | ism1yit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/6/1 |
| l3leaf | ism2wit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet3/4/1 |
| l3leaf | ism2wit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet3/4/1 |
| l3leaf | ism2wit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet3/4/1 |
| l3leaf | ism3wit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet8/4/1 |
| l3leaf | ism3wit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet8/4/1 |
| l3leaf | ism3wit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet8/4/1 |
| l3leaf | ism3xnit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet4/4/1 |
| l3leaf | ism3xnit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet4/4/1 |
| l3leaf | ism3xnit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet4/4/1 |
| l3leaf | ism3xnit02a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet5/4/1 |
| l3leaf | ism3xnit02a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet5/4/1 |
| l3leaf | ism3xnit02a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet5/4/1 |
| l3leaf | ism3xsit01a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet6/4/1 |
| l3leaf | ism3xsit01a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet6/4/1 |
| l3leaf | ism3xsit01a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet6/4/1 |
| l3leaf | ism3xsit02a | Ethernet1/1/1 | spine | isms1itsp01a | Ethernet7/4/1 |
| l3leaf | ism3xsit02a | Ethernet1/2/1 | spine | isms1itsp02a | Ethernet7/4/1 |
| l3leaf | ism3xsit02a | Ethernet2/1/1 | spine | isms1itsp03a | Ethernet7/4/1 |
| l3leaf | ismitagg01aa | Ethernet49/1 | spine | isms1itsp01a | Ethernet5/1/1 |
| l3leaf | ismitagg01aa | Ethernet50/1 | spine | isms1itsp02a | Ethernet5/1/1 |
| l3leaf | ismitagg01aa | Ethernet51/1 | spine | isms1itsp03a | Ethernet5/1/1 |
| l3leaf | ismitagg01aa | Ethernet55/1 | mlag_peer | ismitagg01ba | Ethernet55/1 |
| l3leaf | ismitagg01aa | Ethernet56/1 | mlag_peer | ismitagg01ba | Ethernet56/1 |
| l3leaf | ismitagg01ba | Ethernet49/1 | spine | isms1itsp01a | Ethernet6/1/1 |
| l3leaf | ismitagg01ba | Ethernet50/1 | spine | isms1itsp02a | Ethernet6/1/1 |
| l3leaf | ismitagg01ba | Ethernet51/1 | spine | isms1itsp03a | Ethernet6/1/1 |
| l3leaf | isms1itbl01a | Ethernet25/1 | spine | isms1itsp01a | Ethernet3/1/1 |
| l3leaf | isms1itbl01a | Ethernet26/1 | spine | isms1itsp02a | Ethernet3/1/1 |
| l3leaf | isms1itbl01a | Ethernet27/1 | spine | isms1itsp03a | Ethernet3/1/1 |
| l3leaf | isms1itbl01a | Ethernet31/1 | mlag_peer | ISMS1ITBL02A | Ethernet31/1 |
| l3leaf | isms1itbl01a | Ethernet32/1 | mlag_peer | ISMS1ITBL02A | Ethernet32/1 |
| l3leaf | ISMS1ITBL02A | Ethernet25/1 | spine | isms1itsp01a | Ethernet4/1/1 |
| l3leaf | ISMS1ITBL02A | Ethernet26/1 | spine | isms1itsp02a | Ethernet4/1/1 |
| l3leaf | ISMS1ITBL02A | Ethernet27/1 | spine | isms1itsp03a | Ethernet4/1/1 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 172.21.2.0/24 | 256 | 39 | 15.24 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| IT_FABRIC | IS00AIT01A | 172.21.2.28/32 |
| IT_FABRIC | is00bit01a | 172.21.2.29/32 |
| IT_FABRIC | is00cit01a | 172.21.2.30/32 |
| IT_FABRIC | is01ait01a | 172.21.2.31/32 |
| IT_FABRIC | is01bit01a | 172.21.2.32/32 |
| IT_FABRIC | is01cit01a | 172.21.2.33/32 |
| IT_FABRIC | is02ait01a | 172.21.2.34/32 |
| IT_FABRIC | is02bit01a | 172.21.2.35/32 |
| IT_FABRIC | is03ait01a | 172.21.2.36/32 |
| IT_FABRIC | is03bit01a | 172.21.2.37/32 |
| IT_FABRIC | is11ait01a | 172.21.2.11/32 |
| IT_FABRIC | is11beit01a | 172.21.2.19/32 |
| IT_FABRIC | is11cit01a | 172.21.2.10/32 |
| IT_FABRIC | is11cwit01a | 172.21.2.15/32 |
| IT_FABRIC | is11deit01a | 172.21.2.18/32 |
| IT_FABRIC | is11ewit01a | 172.21.2.14/32 |
| IT_FABRIC | is11git01a | 172.21.2.9/32 |
| IT_FABRIC | is11gwit01a | 172.21.2.13/32 |
| IT_FABRIC | is11heit01a | 172.21.2.17/32 |
| IT_FABRIC | is11jit01a | 172.21.2.8/32 |
| IT_FABRIC | is11jwit01a | 172.21.2.12/32 |
| IT_FABRIC | is11keit01a | 172.21.2.16/32 |
| IT_FABRIC | ism0wit01a | 172.21.2.20/32 |
| IT_FABRIC | ism1vit01a | 172.21.2.39/32 |
| IT_FABRIC | ism1wit01a | 172.21.2.21/32 |
| IT_FABRIC | ism1yit01a | 172.21.2.38/32 |
| IT_FABRIC | ism2wit01a | 172.21.2.22/32 |
| IT_FABRIC | ism3wit01a | 172.21.2.27/32 |
| IT_FABRIC | ism3xnit01a | 172.21.2.23/32 |
| IT_FABRIC | ism3xnit02a | 172.21.2.24/32 |
| IT_FABRIC | ism3xsit01a | 172.21.2.25/32 |
| IT_FABRIC | ism3xsit02a | 172.21.2.26/32 |
| IT_FABRIC | ismitagg01aa | 172.21.2.6/32 |
| IT_FABRIC | ismitagg01ba | 172.21.2.7/32 |
| IT_FABRIC | isms1itbl01a | 172.21.2.4/32 |
| IT_FABRIC | ISMS1ITBL02A | 172.21.2.5/32 |
| IT_FABRIC | isms1itsp01a | 172.21.2.1/32 |
| IT_FABRIC | isms1itsp02a | 172.21.2.2/32 |
| IT_FABRIC | isms1itsp03a | 172.21.2.3/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.210.240.0/24 | 256 | 36 | 14.07 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| IT_FABRIC | IS00AIT01A | 10.210.240.28/32 |
| IT_FABRIC | is00bit01a | 10.210.240.29/32 |
| IT_FABRIC | is00cit01a | 10.210.240.30/32 |
| IT_FABRIC | is01ait01a | 10.210.240.31/32 |
| IT_FABRIC | is01bit01a | 10.210.240.32/32 |
| IT_FABRIC | is01cit01a | 10.210.240.33/32 |
| IT_FABRIC | is02ait01a | 10.210.240.34/32 |
| IT_FABRIC | is02bit01a | 10.210.240.35/32 |
| IT_FABRIC | is03ait01a | 10.210.240.36/32 |
| IT_FABRIC | is03bit01a | 10.210.240.37/32 |
| IT_FABRIC | is11ait01a | 10.210.240.11/32 |
| IT_FABRIC | is11beit01a | 10.210.240.19/32 |
| IT_FABRIC | is11cit01a | 10.210.240.10/32 |
| IT_FABRIC | is11cwit01a | 10.210.240.15/32 |
| IT_FABRIC | is11deit01a | 10.210.240.18/32 |
| IT_FABRIC | is11ewit01a | 10.210.240.14/32 |
| IT_FABRIC | is11git01a | 10.210.240.9/32 |
| IT_FABRIC | is11gwit01a | 10.210.240.13/32 |
| IT_FABRIC | is11heit01a | 10.210.240.17/32 |
| IT_FABRIC | is11jit01a | 10.210.240.8/32 |
| IT_FABRIC | is11jwit01a | 10.210.240.12/32 |
| IT_FABRIC | is11keit01a | 10.210.240.16/32 |
| IT_FABRIC | ism0wit01a | 10.210.240.20/32 |
| IT_FABRIC | ism1vit01a | 10.210.240.39/32 |
| IT_FABRIC | ism1wit01a | 10.210.240.21/32 |
| IT_FABRIC | ism1yit01a | 10.210.240.38/32 |
| IT_FABRIC | ism2wit01a | 10.210.240.22/32 |
| IT_FABRIC | ism3wit01a | 10.210.240.27/32 |
| IT_FABRIC | ism3xnit01a | 10.210.240.23/32 |
| IT_FABRIC | ism3xnit02a | 10.210.240.24/32 |
| IT_FABRIC | ism3xsit01a | 10.210.240.25/32 |
| IT_FABRIC | ism3xsit02a | 10.210.240.26/32 |
| IT_FABRIC | ismitagg01aa | 10.210.240.6/32 |
| IT_FABRIC | ismitagg01ba | 10.210.240.6/32 |
| IT_FABRIC | isms1itbl01a | 10.210.240.4/32 |
| IT_FABRIC | ISMS1ITBL02A | 10.210.240.4/32 |
