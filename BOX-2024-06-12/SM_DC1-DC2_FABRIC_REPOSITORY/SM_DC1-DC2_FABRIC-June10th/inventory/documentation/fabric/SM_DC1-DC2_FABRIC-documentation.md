# SM_DC1-DC2_FABRIC

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
| SM_DC1_FABRIC | spine | ismdc1sp01a | 10.210.80.10/21 | 7280R3 | Provisioned | - |
| SM_DC1_FABRIC | spine | ismdc1sp02a | 10.210.80.11/21 | 7280R3 | Provisioned | - |
| SM_DC1_FABRIC | spine | ismdc1sp03a | 10.210.80.12/21 | 7280R3 | Provisioned | - |
| SM_DC2_FABRIC | spine | ismdc2sp01a | 10.210.80.35/21 | 7280R3 | Provisioned | - |
| SM_DC2_FABRIC | spine | ismdc2sp02a | 10.210.80.36/21 | 7280R3 | Provisioned | - |
| SM_DC2_FABRIC | spine | ismdc2sp03a | 10.210.80.37/21 | 7280R3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |

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
| 172.21.0.0/24 | 256 | 3 | 1.18 % |
| 172.21.1.0/24 | 256 | 3 | 1.18 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SM_DC1_FABRIC | ismdc1sp01a | 172.21.0.1/32 |
| SM_DC1_FABRIC | ismdc1sp02a | 172.21.0.2/32 |
| SM_DC1_FABRIC | ismdc1sp03a | 172.21.0.3/32 |
| SM_DC2_FABRIC | ismdc2sp01a | 172.21.1.1/32 |
| SM_DC2_FABRIC | ismdc2sp02a | 172.21.1.2/32 |
| SM_DC2_FABRIC | ismdc2sp03a | 172.21.1.3/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
