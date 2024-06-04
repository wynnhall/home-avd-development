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
| IT_FABRIC | l2leaf | HS1CUPIT01A | 10.211.240.24/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HS1CUPIT02A | 10.211.240.25/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HS1LLKK01A | 10.211.240.22/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HS1LLKK02A | 10.211.240.23/22 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HSM2VIT01A | 10.215.242.20/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HSM2VIT02A | 10.215.242.21/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HSM3VIT01A | 10.215.242.23/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HSM3VIT02A | 10.215.242.24/23 | 722XP | Provisioned | - |
| IT_FABRIC | l2leaf | HSMPGIT01A | 10.215.242.22/23 | 722XP | Provisioned | - |
| IT_FABRIC | l3leaf | IS00AIT01A | 10.215.241.10/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS00BIT01A | 10.215.241.11/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS00CIT01A | 10.215.241.12/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS01AIT01A | 10.215.241.13/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS01BIT01A | 10.215.241.14/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS01CIT01A | 10.215.241.15/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS02AIT01A | 10.215.241.16/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS02BIT01A | 10.215.241.17/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS03AIT01A | 10.215.241.18/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS03BIT01A | 10.215.241.19/24 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11AIT01A | 10.211.240.13/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11BEIT01A | 10.211.240.21/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11CIT01A | 10.211.240.12/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11CWIT01A | 10.211.240.17/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11DEIT01A | 10.211.240.20/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11EWIT01A | 10.211.240.16/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11GIT01A | 10.211.240.11/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11GWIT01A | 10.211.240.15/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11HEIT01A | 10.211.240.19/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11JIT01A | 10.211.240.10/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11JWIT01A | 10.211.240.14/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | IS11KEIT01A | 10.211.240.18/22 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM0WIT01A | 10.215.242.10/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM1VIT01A | 10.215.242.19/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM1WIT01A | 10.215.242.11/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM1YIT01A | 10.215.242.18/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM2WIT01A | 10.215.242.12/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM3WIT01A | 10.215.242.17/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM3XNIT01A | 10.215.242.13/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM3XNIT02A | 10.215.242.14/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM3XSIT01A | 10.215.242.15/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISM3XSIT02A | 10.215.242.16/23 | - | Provisioned | - |
| IT_FABRIC | l3leaf | ISMITAGG01A | 10.210.80.65/21 | 7050X3 | Provisioned | - |
| IT_FABRIC | l3leaf | ISMITAGG02A | 10.210.80.66/21 | 7050X3 | Provisioned | - |
| IT_FABRIC | l3leaf | ISMS1ITBL01A | 10.210.80.63/21 | 7280R3 | Provisioned | - |
| IT_FABRIC | l3leaf | ISMS1ITBL02A | 10.210.80.64/21 | 7280R3 | Provisioned | - |
| IT_FABRIC | spine | ISMS1ITSP01A | 10.210.80.60/21 | 7300X3 | Provisioned | - |
| IT_FABRIC | spine | ISMS1ITSP02A | 10.210.80.61/21 | 7300X3 | Provisioned | - |
| IT_FABRIC | spine | ISMS1ITSP03A | 10.210.80.62/21 | 7300X3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l2leaf | HS1CUPIT01A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet8 |
| l2leaf | HS1CUPIT01A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet8 |
| l2leaf | HS1CUPIT02A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet9 |
| l2leaf | HS1CUPIT02A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet9 |
| l2leaf | HS1LLKK01A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet6 |
| l2leaf | HS1LLKK01A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet6 |
| l2leaf | HS1LLKK02A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet7 |
| l2leaf | HS1LLKK02A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet7 |
| l2leaf | HSM2VIT01A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet1 |
| l2leaf | HSM2VIT01A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet1 |
| l2leaf | HSM2VIT02A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet2 |
| l2leaf | HSM2VIT02A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet2 |
| l2leaf | HSM3VIT01A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet4 |
| l2leaf | HSM3VIT01A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet4 |
| l2leaf | HSM3VIT02A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet5 |
| l2leaf | HSM3VIT02A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet5 |
| l2leaf | HSMPGIT01A | Ethernet49 | l3leaf | ISMITAGG01A | Ethernet3 |
| l2leaf | HSMPGIT01A | Ethernet50 | l3leaf | ISMITAGG02A | Ethernet3 |
| l3leaf | IS00AIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet3/5/1 |
| l3leaf | IS00AIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet3/5/1 |
| l3leaf | IS00AIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet3/5/1 |
| l3leaf | IS00BIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet4/5/1 |
| l3leaf | IS00BIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet4/5/1 |
| l3leaf | IS00BIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet4/5/1 |
| l3leaf | IS00CIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet5/5/1 |
| l3leaf | IS00CIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet5/5/1 |
| l3leaf | IS00CIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet5/5/1 |
| l3leaf | IS01AIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet6/5/1 |
| l3leaf | IS01AIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet6/5/1 |
| l3leaf | IS01AIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet6/5/1 |
| l3leaf | IS01BIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/5/1 |
| l3leaf | IS01BIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/5/1 |
| l3leaf | IS01BIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/5/1 |
| l3leaf | IS01CIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/5/1 |
| l3leaf | IS01CIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/5/1 |
| l3leaf | IS01CIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/5/1 |
| l3leaf | IS02AIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet3/6/1 |
| l3leaf | IS02AIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet3/6/1 |
| l3leaf | IS02AIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet3/6/1 |
| l3leaf | IS02BIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet4/6/1 |
| l3leaf | IS02BIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet4/6/1 |
| l3leaf | IS02BIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet4/6/1 |
| l3leaf | IS03AIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet5/6/1 |
| l3leaf | IS03AIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet5/6/1 |
| l3leaf | IS03AIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet5/6/1 |
| l3leaf | IS03BIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet6/6/1 |
| l3leaf | IS03BIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet6/6/1 |
| l3leaf | IS03BIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet6/6/1 |
| l3leaf | IS11AIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet4/2/1 |
| l3leaf | IS11AIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet4/2/1 |
| l3leaf | IS11AIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet4/2/1 |
| l3leaf | IS11BEIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet6/3/1 |
| l3leaf | IS11BEIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet6/3/1 |
| l3leaf | IS11BEIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet6/3/1 |
| l3leaf | IS11CIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet3/2/1 |
| l3leaf | IS11CIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet3/2/1 |
| l3leaf | IS11CIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet3/2/1 |
| l3leaf | IS11CWIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/2/1 |
| l3leaf | IS11CWIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/2/1 |
| l3leaf | IS11CWIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/2/1 |
| l3leaf | IS11DEIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet5/3/1 |
| l3leaf | IS11DEIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet5/3/1 |
| l3leaf | IS11DEIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet5/3/1 |
| l3leaf | IS11EWIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/2/1 |
| l3leaf | IS11EWIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/2/1 |
| l3leaf | IS11EWIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/2/1 |
| l3leaf | IS11GIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/1/1 |
| l3leaf | IS11GIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/1/1 |
| l3leaf | IS11GIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/1/1 |
| l3leaf | IS11GWIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet6/2/1 |
| l3leaf | IS11GWIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet6/2/1 |
| l3leaf | IS11GWIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet6/2/1 |
| l3leaf | IS11HEIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet4/3/1 |
| l3leaf | IS11HEIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet4/3/1 |
| l3leaf | IS11HEIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet4/3/1 |
| l3leaf | IS11JIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/1/1 |
| l3leaf | IS11JIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/1/1 |
| l3leaf | IS11JIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/1/1 |
| l3leaf | IS11JWIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet5/2/1 |
| l3leaf | IS11JWIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet5/2/1 |
| l3leaf | IS11JWIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet5/2/1 |
| l3leaf | IS11KEIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet3/3/1 |
| l3leaf | IS11KEIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet3/3/1 |
| l3leaf | IS11KEIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet3/3/1 |
| l3leaf | ISM0WIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/3/1 |
| l3leaf | ISM0WIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/3/1 |
| l3leaf | ISM0WIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/3/1 |
| l3leaf | ISM1VIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/6/1 |
| l3leaf | ISM1VIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/6/1 |
| l3leaf | ISM1VIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/6/1 |
| l3leaf | ISM1WIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/3/1 |
| l3leaf | ISM1WIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/3/1 |
| l3leaf | ISM1WIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/3/1 |
| l3leaf | ISM1YIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/6/1 |
| l3leaf | ISM1YIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/6/1 |
| l3leaf | ISM1YIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/6/1 |
| l3leaf | ISM2WIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet3/4/1 |
| l3leaf | ISM2WIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet3/4/1 |
| l3leaf | ISM2WIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet3/4/1 |
| l3leaf | ISM3WIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet8/4/1 |
| l3leaf | ISM3WIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet8/4/1 |
| l3leaf | ISM3WIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet8/4/1 |
| l3leaf | ISM3XNIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet4/4/1 |
| l3leaf | ISM3XNIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet4/4/1 |
| l3leaf | ISM3XNIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet4/4/1 |
| l3leaf | ISM3XNIT02A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet5/4/1 |
| l3leaf | ISM3XNIT02A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet5/4/1 |
| l3leaf | ISM3XNIT02A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet5/4/1 |
| l3leaf | ISM3XSIT01A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet6/4/1 |
| l3leaf | ISM3XSIT01A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet6/4/1 |
| l3leaf | ISM3XSIT01A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet6/4/1 |
| l3leaf | ISM3XSIT02A | Ethernet1/1/1 | spine | ISMS1ITSP01A | Ethernet7/4/1 |
| l3leaf | ISM3XSIT02A | Ethernet1/2/1 | spine | ISMS1ITSP02A | Ethernet7/4/1 |
| l3leaf | ISM3XSIT02A | Ethernet2/1/1 | spine | ISMS1ITSP03A | Ethernet7/4/1 |
| l3leaf | ISMITAGG01A | Ethernet49/1 | spine | ISMS1ITSP01A | Ethernet5/1/1 |
| l3leaf | ISMITAGG01A | Ethernet50/1 | spine | ISMS1ITSP02A | Ethernet5/1/1 |
| l3leaf | ISMITAGG01A | Ethernet51/1 | spine | ISMS1ITSP03A | Ethernet5/1/1 |
| l3leaf | ISMITAGG01A | Ethernet55/1 | mlag_peer | ISMITAGG02A | Ethernet55/1 |
| l3leaf | ISMITAGG01A | Ethernet56/1 | mlag_peer | ISMITAGG02A | Ethernet56/1 |
| l3leaf | ISMITAGG02A | Ethernet49/1 | spine | ISMS1ITSP01A | Ethernet6/1/1 |
| l3leaf | ISMITAGG02A | Ethernet50/1 | spine | ISMS1ITSP02A | Ethernet6/1/1 |
| l3leaf | ISMITAGG02A | Ethernet51/1 | spine | ISMS1ITSP03A | Ethernet6/1/1 |
| l3leaf | ISMS1ITBL01A | Ethernet25/1 | spine | ISMS1ITSP01A | Ethernet3/1/1 |
| l3leaf | ISMS1ITBL01A | Ethernet26/1 | spine | ISMS1ITSP02A | Ethernet3/1/1 |
| l3leaf | ISMS1ITBL01A | Ethernet27/1 | spine | ISMS1ITSP03A | Ethernet3/1/1 |
| l3leaf | ISMS1ITBL01A | Ethernet31/1 | mlag_peer | ISMS1ITBL02A | Ethernet31/1 |
| l3leaf | ISMS1ITBL01A | Ethernet32/1 | mlag_peer | ISMS1ITBL02A | Ethernet32/1 |
| l3leaf | ISMS1ITBL02A | Ethernet25/1 | spine | ISMS1ITSP01A | Ethernet4/1/1 |
| l3leaf | ISMS1ITBL02A | Ethernet26/1 | spine | ISMS1ITSP02A | Ethernet4/1/1 |
| l3leaf | ISMS1ITBL02A | Ethernet27/1 | spine | ISMS1ITSP03A | Ethernet4/1/1 |

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
| IT_FABRIC | IS00BIT01A | 172.21.2.29/32 |
| IT_FABRIC | IS00CIT01A | 172.21.2.30/32 |
| IT_FABRIC | IS01AIT01A | 172.21.2.31/32 |
| IT_FABRIC | IS01BIT01A | 172.21.2.32/32 |
| IT_FABRIC | IS01CIT01A | 172.21.2.33/32 |
| IT_FABRIC | IS02AIT01A | 172.21.2.34/32 |
| IT_FABRIC | IS02BIT01A | 172.21.2.35/32 |
| IT_FABRIC | IS03AIT01A | 172.21.2.36/32 |
| IT_FABRIC | IS03BIT01A | 172.21.2.37/32 |
| IT_FABRIC | IS11AIT01A | 172.21.2.11/32 |
| IT_FABRIC | IS11BEIT01A | 172.21.2.19/32 |
| IT_FABRIC | IS11CIT01A | 172.21.2.10/32 |
| IT_FABRIC | IS11CWIT01A | 172.21.2.15/32 |
| IT_FABRIC | IS11DEIT01A | 172.21.2.18/32 |
| IT_FABRIC | IS11EWIT01A | 172.21.2.14/32 |
| IT_FABRIC | IS11GIT01A | 172.21.2.9/32 |
| IT_FABRIC | IS11GWIT01A | 172.21.2.13/32 |
| IT_FABRIC | IS11HEIT01A | 172.21.2.17/32 |
| IT_FABRIC | IS11JIT01A | 172.21.2.8/32 |
| IT_FABRIC | IS11JWIT01A | 172.21.2.12/32 |
| IT_FABRIC | IS11KEIT01A | 172.21.2.16/32 |
| IT_FABRIC | ISM0WIT01A | 172.21.2.20/32 |
| IT_FABRIC | ISM1VIT01A | 172.21.2.39/32 |
| IT_FABRIC | ISM1WIT01A | 172.21.2.21/32 |
| IT_FABRIC | ISM1YIT01A | 172.21.2.38/32 |
| IT_FABRIC | ISM2WIT01A | 172.21.2.22/32 |
| IT_FABRIC | ISM3WIT01A | 172.21.2.27/32 |
| IT_FABRIC | ISM3XNIT01A | 172.21.2.23/32 |
| IT_FABRIC | ISM3XNIT02A | 172.21.2.24/32 |
| IT_FABRIC | ISM3XSIT01A | 172.21.2.25/32 |
| IT_FABRIC | ISM3XSIT02A | 172.21.2.26/32 |
| IT_FABRIC | ISMITAGG01A | 172.21.2.6/32 |
| IT_FABRIC | ISMITAGG02A | 172.21.2.7/32 |
| IT_FABRIC | ISMS1ITBL01A | 172.21.2.4/32 |
| IT_FABRIC | ISMS1ITBL02A | 172.21.2.5/32 |
| IT_FABRIC | ISMS1ITSP01A | 172.21.2.1/32 |
| IT_FABRIC | ISMS1ITSP02A | 172.21.2.2/32 |
| IT_FABRIC | ISMS1ITSP03A | 172.21.2.3/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.210.240.0/24 | 256 | 36 | 14.07 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| IT_FABRIC | IS00AIT01A | 10.210.240.28/32 |
| IT_FABRIC | IS00BIT01A | 10.210.240.29/32 |
| IT_FABRIC | IS00CIT01A | 10.210.240.30/32 |
| IT_FABRIC | IS01AIT01A | 10.210.240.31/32 |
| IT_FABRIC | IS01BIT01A | 10.210.240.32/32 |
| IT_FABRIC | IS01CIT01A | 10.210.240.33/32 |
| IT_FABRIC | IS02AIT01A | 10.210.240.34/32 |
| IT_FABRIC | IS02BIT01A | 10.210.240.35/32 |
| IT_FABRIC | IS03AIT01A | 10.210.240.36/32 |
| IT_FABRIC | IS03BIT01A | 10.210.240.37/32 |
| IT_FABRIC | IS11AIT01A | 10.210.240.11/32 |
| IT_FABRIC | IS11BEIT01A | 10.210.240.19/32 |
| IT_FABRIC | IS11CIT01A | 10.210.240.10/32 |
| IT_FABRIC | IS11CWIT01A | 10.210.240.15/32 |
| IT_FABRIC | IS11DEIT01A | 10.210.240.18/32 |
| IT_FABRIC | IS11EWIT01A | 10.210.240.14/32 |
| IT_FABRIC | IS11GIT01A | 10.210.240.9/32 |
| IT_FABRIC | IS11GWIT01A | 10.210.240.13/32 |
| IT_FABRIC | IS11HEIT01A | 10.210.240.17/32 |
| IT_FABRIC | IS11JIT01A | 10.210.240.8/32 |
| IT_FABRIC | IS11JWIT01A | 10.210.240.12/32 |
| IT_FABRIC | IS11KEIT01A | 10.210.240.16/32 |
| IT_FABRIC | ISM0WIT01A | 10.210.240.20/32 |
| IT_FABRIC | ISM1VIT01A | 10.210.240.39/32 |
| IT_FABRIC | ISM1WIT01A | 10.210.240.21/32 |
| IT_FABRIC | ISM1YIT01A | 10.210.240.38/32 |
| IT_FABRIC | ISM2WIT01A | 10.210.240.22/32 |
| IT_FABRIC | ISM3WIT01A | 10.210.240.27/32 |
| IT_FABRIC | ISM3XNIT01A | 10.210.240.23/32 |
| IT_FABRIC | ISM3XNIT02A | 10.210.240.24/32 |
| IT_FABRIC | ISM3XSIT01A | 10.210.240.25/32 |
| IT_FABRIC | ISM3XSIT02A | 10.210.240.26/32 |
| IT_FABRIC | ISMITAGG01A | 10.210.240.6/32 |
| IT_FABRIC | ISMITAGG02A | 10.210.240.6/32 |
| IT_FABRIC | ISMS1ITBL01A | 10.210.240.4/32 |
| IT_FABRIC | ISMS1ITBL02A | 10.210.240.4/32 |
