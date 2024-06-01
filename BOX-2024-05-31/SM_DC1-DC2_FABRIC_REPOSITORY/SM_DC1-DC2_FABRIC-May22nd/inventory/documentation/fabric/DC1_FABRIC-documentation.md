# DC1_FABRIC

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
| DC1_FABRIC | l3leaf | DC1-CL1 | 10.210.80.15/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL2 | 10.210.80.16/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL3 | 10.210.80.17/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL4 | 10.210.80.18/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL5 | 10.210.80.19/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL6 | 10.210.80.20/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL7 | 10.210.80.21/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL8 | 10.210.80.22/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL9 | 10.210.80.23/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL10 | 10.210.80.24/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL11 | 10.210.80.25/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL12 | 10.210.80.26/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL13 | 10.210.80.27/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL14 | 10.210.80.28/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL15 | 10.210.80.29/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL16 | 10.210.80.30/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL17 | 10.210.80.31/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL18 | 10.210.80.32/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL19 | 10.210.80.33/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | DC1-CL20 | 10.210.80.34/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | ISMDC1BL01A | 10.210.80.13/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | l3leaf | ISMDC1BL02A | 10.210.80.14/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | spine | ISMDC1SP01A | 10.210.80.10/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | spine | ISMDC1SP02A | 10.210.80.11/21 | 7280R3 | Provisioned | - |
| DC1_FABRIC | spine | ISMDC1SP03A | 10.210.80.12/21 | 7280R3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | DC1-CL1 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet3/1 |
| l3leaf | DC1-CL1 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet3/1 |
| l3leaf | DC1-CL1 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet3/1 |
| l3leaf | DC1-CL1 | Ethernet55/1 | mlag_peer | DC1-CL2 | Ethernet55/1 |
| l3leaf | DC1-CL1 | Ethernet56/1 | mlag_peer | DC1-CL2 | Ethernet56/1 |
| l3leaf | DC1-CL2 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet4/1 |
| l3leaf | DC1-CL2 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet4/1 |
| l3leaf | DC1-CL2 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet4/1 |
| l3leaf | DC1-CL3 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet5/1 |
| l3leaf | DC1-CL3 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet5/1 |
| l3leaf | DC1-CL3 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet5/1 |
| l3leaf | DC1-CL3 | Ethernet55/1 | mlag_peer | DC1-CL4 | Ethernet55/1 |
| l3leaf | DC1-CL3 | Ethernet56/1 | mlag_peer | DC1-CL4 | Ethernet56/1 |
| l3leaf | DC1-CL4 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet6/1 |
| l3leaf | DC1-CL4 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet6/1 |
| l3leaf | DC1-CL4 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet6/1 |
| l3leaf | DC1-CL5 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet7/1 |
| l3leaf | DC1-CL5 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet7/1 |
| l3leaf | DC1-CL5 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet7/1 |
| l3leaf | DC1-CL5 | Ethernet55/1 | mlag_peer | DC1-CL6 | Ethernet55/1 |
| l3leaf | DC1-CL5 | Ethernet56/1 | mlag_peer | DC1-CL6 | Ethernet56/1 |
| l3leaf | DC1-CL6 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet8/1 |
| l3leaf | DC1-CL6 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet8/1 |
| l3leaf | DC1-CL6 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet8/1 |
| l3leaf | DC1-CL7 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet9/1 |
| l3leaf | DC1-CL7 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet9/1 |
| l3leaf | DC1-CL7 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet9/1 |
| l3leaf | DC1-CL7 | Ethernet55/1 | mlag_peer | DC1-CL8 | Ethernet55/1 |
| l3leaf | DC1-CL7 | Ethernet56/1 | mlag_peer | DC1-CL8 | Ethernet56/1 |
| l3leaf | DC1-CL8 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet10/1 |
| l3leaf | DC1-CL8 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet10/1 |
| l3leaf | DC1-CL8 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet10/1 |
| l3leaf | DC1-CL9 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet11/1 |
| l3leaf | DC1-CL9 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet11/1 |
| l3leaf | DC1-CL9 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet11/1 |
| l3leaf | DC1-CL9 | Ethernet55/1 | mlag_peer | DC1-CL10 | Ethernet55/1 |
| l3leaf | DC1-CL9 | Ethernet56/1 | mlag_peer | DC1-CL10 | Ethernet56/1 |
| l3leaf | DC1-CL10 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet12/1 |
| l3leaf | DC1-CL10 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet12/1 |
| l3leaf | DC1-CL10 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet12/1 |
| l3leaf | DC1-CL11 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet13/1 |
| l3leaf | DC1-CL11 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet13/1 |
| l3leaf | DC1-CL11 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet13/1 |
| l3leaf | DC1-CL11 | Ethernet55/1 | mlag_peer | DC1-CL12 | Ethernet55/1 |
| l3leaf | DC1-CL11 | Ethernet56/1 | mlag_peer | DC1-CL12 | Ethernet56/1 |
| l3leaf | DC1-CL12 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet14/1 |
| l3leaf | DC1-CL12 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet14/1 |
| l3leaf | DC1-CL12 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet14/1 |
| l3leaf | DC1-CL13 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet15/1 |
| l3leaf | DC1-CL13 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet15/1 |
| l3leaf | DC1-CL13 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet15/1 |
| l3leaf | DC1-CL13 | Ethernet55/1 | mlag_peer | DC1-CL14 | Ethernet55/1 |
| l3leaf | DC1-CL13 | Ethernet56/1 | mlag_peer | DC1-CL14 | Ethernet56/1 |
| l3leaf | DC1-CL14 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet16/1 |
| l3leaf | DC1-CL14 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet16/1 |
| l3leaf | DC1-CL14 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet16/1 |
| l3leaf | DC1-CL15 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet17/1 |
| l3leaf | DC1-CL15 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet17/1 |
| l3leaf | DC1-CL15 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet17/1 |
| l3leaf | DC1-CL15 | Ethernet55/1 | mlag_peer | DC1-CL16 | Ethernet55/1 |
| l3leaf | DC1-CL15 | Ethernet56/1 | mlag_peer | DC1-CL16 | Ethernet56/1 |
| l3leaf | DC1-CL16 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet18/1 |
| l3leaf | DC1-CL16 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet18/1 |
| l3leaf | DC1-CL16 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet18/1 |
| l3leaf | DC1-CL17 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet19/1 |
| l3leaf | DC1-CL17 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet19/1 |
| l3leaf | DC1-CL17 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet19/1 |
| l3leaf | DC1-CL17 | Ethernet55/1 | mlag_peer | DC1-CL18 | Ethernet55/1 |
| l3leaf | DC1-CL17 | Ethernet56/1 | mlag_peer | DC1-CL18 | Ethernet56/1 |
| l3leaf | DC1-CL18 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet20/1 |
| l3leaf | DC1-CL18 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet20/1 |
| l3leaf | DC1-CL18 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet20/1 |
| l3leaf | DC1-CL19 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet21/1 |
| l3leaf | DC1-CL19 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet21/1 |
| l3leaf | DC1-CL19 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet21/1 |
| l3leaf | DC1-CL19 | Ethernet55/1 | mlag_peer | DC1-CL20 | Ethernet55/1 |
| l3leaf | DC1-CL19 | Ethernet56/1 | mlag_peer | DC1-CL20 | Ethernet56/1 |
| l3leaf | DC1-CL20 | Ethernet49/1 | spine | ISMDC1SP01A | Ethernet22/1 |
| l3leaf | DC1-CL20 | Ethernet50/1 | spine | ISMDC1SP02A | Ethernet22/1 |
| l3leaf | DC1-CL20 | Ethernet51/1 | spine | ISMDC1SP03A | Ethernet22/1 |
| l3leaf | ISMDC1BL01A | Ethernet3/1 | l3leaf | ISMDC1BL02A | Ethernet3/1 |
| l3leaf | ISMDC1BL01A | Ethernet4/1 | l3leaf | ISMDC1BL02A | Ethernet4/1 |
| l3leaf | ISMDC1BL01A | Ethernet25/1 | spine | ISMDC1SP01A | Ethernet1/1 |
| l3leaf | ISMDC1BL01A | Ethernet26/1 | spine | ISMDC1SP02A | Ethernet1/1 |
| l3leaf | ISMDC1BL01A | Ethernet27/1 | spine | ISMDC1SP03A | Ethernet1/1 |
| l3leaf | ISMDC1BL01A | Ethernet31/1 | mlag_peer | ISMDC1BL02A | Ethernet31/1 |
| l3leaf | ISMDC1BL01A | Ethernet32/1 | mlag_peer | ISMDC1BL02A | Ethernet32/1 |
| l3leaf | ISMDC1BL02A | Ethernet25/1 | spine | ISMDC1SP01A | Ethernet2/1 |
| l3leaf | ISMDC1BL02A | Ethernet26/1 | spine | ISMDC1SP02A | Ethernet2/1 |
| l3leaf | ISMDC1BL02A | Ethernet27/1 | spine | ISMDC1SP03A | Ethernet2/1 |

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
| 172.21.0.0/24 | 256 | 25 | 9.77 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1_FABRIC | DC1-CL1 | 172.21.0.4/32 |
| DC1_FABRIC | DC1-CL2 | 172.21.0.5/32 |
| DC1_FABRIC | DC1-CL3 | 172.21.0.6/32 |
| DC1_FABRIC | DC1-CL4 | 172.21.0.7/32 |
| DC1_FABRIC | DC1-CL5 | 172.21.0.8/32 |
| DC1_FABRIC | DC1-CL6 | 172.21.0.9/32 |
| DC1_FABRIC | DC1-CL7 | 172.21.0.10/32 |
| DC1_FABRIC | DC1-CL8 | 172.21.0.11/32 |
| DC1_FABRIC | DC1-CL9 | 172.21.0.12/32 |
| DC1_FABRIC | DC1-CL10 | 172.21.0.13/32 |
| DC1_FABRIC | DC1-CL11 | 172.21.0.14/32 |
| DC1_FABRIC | DC1-CL12 | 172.21.0.15/32 |
| DC1_FABRIC | DC1-CL13 | 172.21.0.16/32 |
| DC1_FABRIC | DC1-CL14 | 172.21.0.17/32 |
| DC1_FABRIC | DC1-CL15 | 172.21.0.18/32 |
| DC1_FABRIC | DC1-CL16 | 172.21.0.19/32 |
| DC1_FABRIC | DC1-CL17 | 172.21.0.20/32 |
| DC1_FABRIC | DC1-CL18 | 172.21.0.21/32 |
| DC1_FABRIC | DC1-CL19 | 172.21.0.22/32 |
| DC1_FABRIC | DC1-CL20 | 172.21.0.23/32 |
| DC1_FABRIC | ISMDC1BL01A | 172.21.0.24/32 |
| DC1_FABRIC | ISMDC1BL02A | 172.21.0.25/32 |
| DC1_FABRIC | ISMDC1SP01A | 172.21.0.1/32 |
| DC1_FABRIC | ISMDC1SP02A | 172.21.0.2/32 |
| DC1_FABRIC | ISMDC1SP03A | 172.21.0.3/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.210.224.0/24 | 256 | 22 | 8.6 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1_FABRIC | DC1-CL1 | 10.210.224.4/32 |
| DC1_FABRIC | DC1-CL2 | 10.210.224.4/32 |
| DC1_FABRIC | DC1-CL3 | 10.210.224.6/32 |
| DC1_FABRIC | DC1-CL4 | 10.210.224.6/32 |
| DC1_FABRIC | DC1-CL5 | 10.210.224.8/32 |
| DC1_FABRIC | DC1-CL6 | 10.210.224.8/32 |
| DC1_FABRIC | DC1-CL7 | 10.210.224.10/32 |
| DC1_FABRIC | DC1-CL8 | 10.210.224.10/32 |
| DC1_FABRIC | DC1-CL9 | 10.210.224.12/32 |
| DC1_FABRIC | DC1-CL10 | 10.210.224.12/32 |
| DC1_FABRIC | DC1-CL11 | 10.210.224.14/32 |
| DC1_FABRIC | DC1-CL12 | 10.210.224.14/32 |
| DC1_FABRIC | DC1-CL13 | 10.210.224.16/32 |
| DC1_FABRIC | DC1-CL14 | 10.210.224.16/32 |
| DC1_FABRIC | DC1-CL15 | 10.210.224.18/32 |
| DC1_FABRIC | DC1-CL16 | 10.210.224.18/32 |
| DC1_FABRIC | DC1-CL17 | 10.210.224.20/32 |
| DC1_FABRIC | DC1-CL18 | 10.210.224.20/32 |
| DC1_FABRIC | DC1-CL19 | 10.210.224.22/32 |
| DC1_FABRIC | DC1-CL20 | 10.210.224.22/32 |
| DC1_FABRIC | ISMDC1BL01A | 10.210.224.24/32 |
| DC1_FABRIC | ISMDC1BL02A | 10.210.224.24/32 |
