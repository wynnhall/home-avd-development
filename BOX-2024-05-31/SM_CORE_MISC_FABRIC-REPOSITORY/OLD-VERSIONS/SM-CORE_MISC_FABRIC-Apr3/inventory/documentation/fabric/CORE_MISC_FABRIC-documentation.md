# CORE_MISC_FABRIC

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
| CORE_MISC_FABRIC | l2leaf | HS00BOT01A | 10.210.241.20/21 | 722XP | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HS00BOT02A | 10.210.241.21/21 | 722XP | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HSMDMZ100A | 10.210.80.78/21 | 722XP | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HSMDMZ101A | 10.210.80.79/24 | 722XP | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HSMVND01A | 10.210.80.80/21 | 758 | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HSMWAN40A | 10.210.80.76/21 | 7280R3 | Provisioned | - |
| CORE_MISC_FABRIC | l2leaf | HSMWAN41A | 10.210.80.77/21 | 7280R3 | Provisioned | - |
| CORE_MISC_FABRIC | l3leaf | ISMCR01A | 10.210.80.72/21 | 7800R3 | Provisioned | - |
| CORE_MISC_FABRIC | l3leaf | ISMCR02A | 10.210.80.73/21 | 7800R3 | Provisioned | - |
| CORE_MISC_FABRIC | l3leaf | ISMITMSC01A | 10.210.80.74/21 | 7050X3 | Provisioned | - |
| CORE_MISC_FABRIC | l3leaf | ISMITMSC02A | 10.210.80.75/21 | 7050X3 | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l2leaf | HSMDMZ100A | Ethernet55 | mlag_peer | HSMDMZ101A | Ethernet55 |
| l2leaf | HSMDMZ100A | Ethernet56 | mlag_peer | HSMDMZ101A | Ethernet56 |
| l2leaf | HSMWAN40A | Ethernet55/1 | mlag_peer | HSMWAN41A | Ethernet55/1 |
| l2leaf | HSMWAN40A | Ethernet56/1 | mlag_peer | HSMWAN41A | Ethernet56/1 |
| l3leaf | ISMCR01A | Ethernet3/48/1 | mlag_peer | ISMCR02A | Ethernet3/48/1 |
| l3leaf | ISMCR01A | Ethernet4/48/1 | mlag_peer | ISMCR02A | Ethernet4/48/1 |
| l3leaf | ISMITMSC01A | Ethernet55/1 | mlag_peer | ISMITMSC02A | Ethernet55/1 |
| l3leaf | ISMITMSC01A | Ethernet56/1 | mlag_peer | ISMITMSC02A | Ethernet56/1 |

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
| 172.21.0.27/30 | 4 | 2 | 50.0 % |
| 172.21.1.28/30 | 4 | 2 | 50.0 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| CORE_MISC_FABRIC | ISMCR01A | 172.21.0.25/32 |
| CORE_MISC_FABRIC | ISMCR02A | 172.21.0.26/32 |
| CORE_MISC_FABRIC | ISMITMSC01A | 172.21.1.29/32 |
| CORE_MISC_FABRIC | ISMITMSC02A | 172.21.1.30/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
