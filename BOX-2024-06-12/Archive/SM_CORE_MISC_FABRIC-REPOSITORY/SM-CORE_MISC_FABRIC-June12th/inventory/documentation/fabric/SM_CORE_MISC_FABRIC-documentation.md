# SM_CORE_MISC_FABRIC

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
| SM_CORE_MISC_FABRIC | l2leaf | hs00bot01a | 10.210.241.20/21 | 722XP | Provisioned | - |
| SM_CORE_MISC_FABRIC | l2leaf | hs00bot02a | 10.210.241.21/21 | 722XP | Provisioned | - |
| SM_CORE_MISC_FABRIC | l2leaf | hsmdmz100a | 10.210.80.78/21 | 722XP | Provisioned | - |
| SM_CORE_MISC_FABRIC | l2leaf | hsmdmz101a | 10.210.80.79/21 | 722XP | Provisioned | HBG234001LR |
| SM_CORE_MISC_FABRIC | l2leaf | hsmvnd01A | 10.210.80.80/21 | 758 | Provisioned | - |
| SM_CORE_MISC_FABRIC | l2leaf | hsmwan40a | 10.210.80.76/21 | 7280R3 | Provisioned | - |
| SM_CORE_MISC_FABRIC | l2leaf | hsmwan41a | 10.210.80.77/21 | 7280R3 | Provisioned | JPA2340P4WY |
| SM_CORE_MISC_FABRIC | l3leaf | ismcr01a | 10.210.80.72/21 | 7800R3 | Provisioned | - |
| SM_CORE_MISC_FABRIC | l3leaf | ismcr02a | 10.210.80.73/21 | 7800R3 | Provisioned | TMO23140950 |
| SM_CORE_MISC_FABRIC | l3leaf | ismitmsc01a | 10.210.80.74/21 | 7050X3 | Provisioned | - |
| SM_CORE_MISC_FABRIC | l3leaf | ismitmsc02a | 10.210.80.75/21 | 7050X3 | Provisioned | JMX2329A679 |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | ismcr01a | Ethernet3/48/1 | mlag_peer | ismcr02a | Ethernet3/48/1 |
| l3leaf | ismcr01a | Ethernet4/48/1 | mlag_peer | ismcr02a | Ethernet4/48/1 |
| l3leaf | ismitmsc01a | Ethernet55/1 | mlag_peer | ismitmsc02a | Ethernet55/1 |
| l3leaf | ismitmsc01a | Ethernet56/1 | mlag_peer | ismitmsc02a | Ethernet56/1 |

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
| 172.21.0.240/30 | 4 | 2 | 50.0 % |
| 172.21.0.244/30 | 4 | 2 | 50.0 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SM_CORE_MISC_FABRIC | ismcr01a | 172.21.0.245/32 |
| SM_CORE_MISC_FABRIC | ismcr02a | 172.21.0.246/32 |
| SM_CORE_MISC_FABRIC | ismitmsc01a | 172.21.0.241/32 |
| SM_CORE_MISC_FABRIC | ismitmsc02a | 172.21.0.242/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
