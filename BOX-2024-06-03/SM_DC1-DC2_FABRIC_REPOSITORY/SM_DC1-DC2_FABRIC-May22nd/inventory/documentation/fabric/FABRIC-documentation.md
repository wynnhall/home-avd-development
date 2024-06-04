# FABRIC

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
| DC1 | l3leaf | DC1-BL1 | 192.168.0.108/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-BL2 | 192.168.0.109/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-CL1 | 192.168.0.102/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-CL2 | 192.168.0.103/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-CL3 | 192.168.0.104/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-CL4 | 192.168.0.105/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-SL1 | 192.168.0.106/24 | vEOS | Provisioned | - |
| DC1 | l3leaf | DC1-SL2 | 192.168.0.107/24 | vEOS | Provisioned | - |
| DC1 | spine | DC1-SP1 | 192.168.0.100/24 | vEOS | Provisioned | - |
| DC1 | spine | DC1-SP2 | 192.168.0.101/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-BL1 | 192.168.0.116/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-BL2 | 192.168.0.117/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-CL1 | 192.168.0.112/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-CL2 | 192.168.0.113/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-SL1 | 192.168.0.114/24 | vEOS | Provisioned | - |
| DC2 | l3leaf | DC2-SL2 | 192.168.0.115/24 | vEOS | Provisioned | - |
| DC2 | spine | DC2-SP1 | 192.168.0.110/24 | vEOS | Provisioned | - |
| DC2 | spine | DC2-SP2 | 192.168.0.111/24 | vEOS | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | DC1-BL1 | Ethernet1 | spine | DC1-SP1 | Ethernet7 |
| l3leaf | DC1-BL1 | Ethernet2 | spine | DC1-SP2 | Ethernet7 |
| l3leaf | DC1-BL1 | Ethernet3 | mlag_peer | DC1-BL2 | Ethernet3 |
| l3leaf | DC1-BL1 | Ethernet4 | l3leaf | DC2-BL1 | Ethernet4 |
| l3leaf | DC1-BL2 | Ethernet1 | spine | DC1-SP1 | Ethernet8 |
| l3leaf | DC1-BL2 | Ethernet2 | spine | DC1-SP2 | Ethernet8 |
| l3leaf | DC1-BL2 | Ethernet4 | l3leaf | DC2-BL2 | Ethernet4 |
| l3leaf | DC1-CL1 | Ethernet1 | spine | DC1-SP1 | Ethernet1 |
| l3leaf | DC1-CL1 | Ethernet2 | spine | DC1-SP2 | Ethernet1 |
| l3leaf | DC1-CL1 | Ethernet3 | mlag_peer | DC1-CL2 | Ethernet3 |
| l3leaf | DC1-CL2 | Ethernet1 | spine | DC1-SP1 | Ethernet2 |
| l3leaf | DC1-CL2 | Ethernet2 | spine | DC1-SP2 | Ethernet2 |
| l3leaf | DC1-CL3 | Ethernet1 | spine | DC1-SP1 | Ethernet3 |
| l3leaf | DC1-CL3 | Ethernet2 | spine | DC1-SP2 | Ethernet3 |
| l3leaf | DC1-CL3 | Ethernet3 | mlag_peer | DC1-CL4 | Ethernet3 |
| l3leaf | DC1-CL4 | Ethernet1 | spine | DC1-SP1 | Ethernet4 |
| l3leaf | DC1-CL4 | Ethernet2 | spine | DC1-SP2 | Ethernet4 |
| l3leaf | DC1-SL1 | Ethernet1 | spine | DC1-SP1 | Ethernet5 |
| l3leaf | DC1-SL1 | Ethernet2 | spine | DC1-SP2 | Ethernet5 |
| l3leaf | DC1-SL1 | Ethernet3 | mlag_peer | DC1-SL2 | Ethernet3 |
| l3leaf | DC1-SL2 | Ethernet1 | spine | DC1-SP1 | Ethernet6 |
| l3leaf | DC1-SL2 | Ethernet2 | spine | DC1-SP2 | Ethernet6 |
| l3leaf | DC2-BL1 | Ethernet1 | spine | DC2-SP1 | Ethernet5 |
| l3leaf | DC2-BL1 | Ethernet2 | spine | DC2-SP2 | Ethernet5 |
| l3leaf | DC2-BL1 | Ethernet3 | mlag_peer | DC2-BL2 | Ethernet3 |
| l3leaf | DC2-BL2 | Ethernet1 | spine | DC2-SP1 | Ethernet6 |
| l3leaf | DC2-BL2 | Ethernet2 | spine | DC2-SP2 | Ethernet6 |
| l3leaf | DC2-CL1 | Ethernet1 | spine | DC2-SP1 | Ethernet1 |
| l3leaf | DC2-CL1 | Ethernet2 | spine | DC2-SP2 | Ethernet1 |
| l3leaf | DC2-CL1 | Ethernet3 | mlag_peer | DC2-CL2 | Ethernet3 |
| l3leaf | DC2-CL2 | Ethernet1 | spine | DC2-SP1 | Ethernet2 |
| l3leaf | DC2-CL2 | Ethernet2 | spine | DC2-SP2 | Ethernet2 |
| l3leaf | DC2-SL1 | Ethernet1 | spine | DC2-SP1 | Ethernet3 |
| l3leaf | DC2-SL1 | Ethernet2 | spine | DC2-SP2 | Ethernet3 |
| l3leaf | DC2-SL1 | Ethernet3 | mlag_peer | DC2-SL2 | Ethernet3 |
| l3leaf | DC2-SL2 | Ethernet1 | spine | DC2-SP1 | Ethernet4 |
| l3leaf | DC2-SL2 | Ethernet2 | spine | DC2-SP2 | Ethernet4 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 192.168.1.0/24 | 256 | 32 | 12.5 % |
| 192.168.2.0/24 | 256 | 24 | 9.38 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC1-BL1 | Ethernet1 | 192.168.1.25/31 | DC1-SP1 | Ethernet7 | 192.168.1.24/31 |
| DC1-BL1 | Ethernet2 | 192.168.1.27/31 | DC1-SP2 | Ethernet7 | 192.168.1.26/31 |
| DC1-BL1 | Ethernet4 | 192.168.3.0/31 | DC2-BL1 | Ethernet4 | 192.168.3.1/31 |
| DC1-BL2 | Ethernet1 | 192.168.1.29/31 | DC1-SP1 | Ethernet8 | 192.168.1.28/31 |
| DC1-BL2 | Ethernet2 | 192.168.1.31/31 | DC1-SP2 | Ethernet8 | 192.168.1.30/31 |
| DC1-BL2 | Ethernet4 | 192.168.3.2/31 | DC2-BL2 | Ethernet4 | 192.168.3.3/31 |
| DC1-CL1 | Ethernet1 | 192.168.1.1/31 | DC1-SP1 | Ethernet1 | 192.168.1.0/31 |
| DC1-CL1 | Ethernet2 | 192.168.1.3/31 | DC1-SP2 | Ethernet1 | 192.168.1.2/31 |
| DC1-CL2 | Ethernet1 | 192.168.1.5/31 | DC1-SP1 | Ethernet2 | 192.168.1.4/31 |
| DC1-CL2 | Ethernet2 | 192.168.1.7/31 | DC1-SP2 | Ethernet2 | 192.168.1.6/31 |
| DC1-CL3 | Ethernet1 | 192.168.1.9/31 | DC1-SP1 | Ethernet3 | 192.168.1.8/31 |
| DC1-CL3 | Ethernet2 | 192.168.1.11/31 | DC1-SP2 | Ethernet3 | 192.168.1.10/31 |
| DC1-CL4 | Ethernet1 | 192.168.1.13/31 | DC1-SP1 | Ethernet4 | 192.168.1.12/31 |
| DC1-CL4 | Ethernet2 | 192.168.1.15/31 | DC1-SP2 | Ethernet4 | 192.168.1.14/31 |
| DC1-SL1 | Ethernet1 | 192.168.1.17/31 | DC1-SP1 | Ethernet5 | 192.168.1.16/31 |
| DC1-SL1 | Ethernet2 | 192.168.1.19/31 | DC1-SP2 | Ethernet5 | 192.168.1.18/31 |
| DC1-SL2 | Ethernet1 | 192.168.1.21/31 | DC1-SP1 | Ethernet6 | 192.168.1.20/31 |
| DC1-SL2 | Ethernet2 | 192.168.1.23/31 | DC1-SP2 | Ethernet6 | 192.168.1.22/31 |
| DC2-BL1 | Ethernet1 | 192.168.2.17/31 | DC2-SP1 | Ethernet5 | 192.168.2.16/31 |
| DC2-BL1 | Ethernet2 | 192.168.2.19/31 | DC2-SP2 | Ethernet5 | 192.168.2.18/31 |
| DC2-BL2 | Ethernet1 | 192.168.2.21/31 | DC2-SP1 | Ethernet6 | 192.168.2.20/31 |
| DC2-BL2 | Ethernet2 | 192.168.2.23/31 | DC2-SP2 | Ethernet6 | 192.168.2.22/31 |
| DC2-CL1 | Ethernet1 | 192.168.2.1/31 | DC2-SP1 | Ethernet1 | 192.168.2.0/31 |
| DC2-CL1 | Ethernet2 | 192.168.2.3/31 | DC2-SP2 | Ethernet1 | 192.168.2.2/31 |
| DC2-CL2 | Ethernet1 | 192.168.2.5/31 | DC2-SP1 | Ethernet2 | 192.168.2.4/31 |
| DC2-CL2 | Ethernet2 | 192.168.2.7/31 | DC2-SP2 | Ethernet2 | 192.168.2.6/31 |
| DC2-SL1 | Ethernet1 | 192.168.2.9/31 | DC2-SP1 | Ethernet3 | 192.168.2.8/31 |
| DC2-SL1 | Ethernet2 | 192.168.2.11/31 | DC2-SP2 | Ethernet3 | 192.168.2.10/31 |
| DC2-SL2 | Ethernet1 | 192.168.2.13/31 | DC2-SP1 | Ethernet4 | 192.168.2.12/31 |
| DC2-SL2 | Ethernet2 | 192.168.2.15/31 | DC2-SP2 | Ethernet4 | 192.168.2.14/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.100.0/24 | 256 | 10 | 3.91 % |
| 192.168.100.248/29 | 8 | 2 | 25.0 % |
| 192.168.101.0/24 | 256 | 8 | 3.13 % |
| 192.168.101.248/29 | 8 | 2 | 25.0 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1 | DC1-BL1 | 192.168.100.7/32 |
| DC1 | DC1-BL2 | 192.168.100.8/32 |
| DC1 | DC1-CL1 | 192.168.100.1/32 |
| DC1 | DC1-CL2 | 192.168.100.2/32 |
| DC1 | DC1-CL3 | 192.168.100.3/32 |
| DC1 | DC1-CL4 | 192.168.100.4/32 |
| DC1 | DC1-SL1 | 192.168.100.5/32 |
| DC1 | DC1-SL2 | 192.168.100.6/32 |
| DC1 | DC1-SP1 | 192.168.100.249/32 |
| DC1 | DC1-SP2 | 192.168.100.250/32 |
| DC2 | DC2-BL1 | 192.168.101.5/32 |
| DC2 | DC2-BL2 | 192.168.101.6/32 |
| DC2 | DC2-CL1 | 192.168.101.1/32 |
| DC2 | DC2-CL2 | 192.168.101.2/32 |
| DC2 | DC2-SL1 | 192.168.101.3/32 |
| DC2 | DC2-SL2 | 192.168.101.4/32 |
| DC2 | DC2-SP1 | 192.168.101.249/32 |
| DC2 | DC2-SP2 | 192.168.101.250/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.200.0/24 | 256 | 8 | 3.13 % |
| 192.168.201.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1 | DC1-BL1 | 192.168.200.7/32 |
| DC1 | DC1-BL2 | 192.168.200.7/32 |
| DC1 | DC1-CL1 | 192.168.200.1/32 |
| DC1 | DC1-CL2 | 192.168.200.1/32 |
| DC1 | DC1-CL3 | 192.168.200.3/32 |
| DC1 | DC1-CL4 | 192.168.200.3/32 |
| DC1 | DC1-SL1 | 192.168.200.5/32 |
| DC1 | DC1-SL2 | 192.168.200.5/32 |
| DC2 | DC2-BL1 | 192.168.201.5/32 |
| DC2 | DC2-BL2 | 192.168.201.5/32 |
| DC2 | DC2-CL1 | 192.168.201.1/32 |
| DC2 | DC2-CL2 | 192.168.201.1/32 |
| DC2 | DC2-SL1 | 192.168.201.3/32 |
| DC2 | DC2-SL2 | 192.168.201.3/32 |
