# SM-MGMT_FABRIC

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
- [Connected Endpoints](#connected-endpoints)
  - [Connected Endpoint Keys](#connected-endpoint-keys)
  - [Firewalls](#firewalls)
  - [Port Profiles](#port-profiles)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| SM-MGMT_FABRIC | leaf | hs00amgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs00bmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs00cmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs01amgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs01bmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs01cmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs02amgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs02bmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs03amgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs03bmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11amgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11amgt02a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11bemgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11cmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11cmgt21a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11cwmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11demgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11ewmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11gmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11gmgt02a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11gwmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11hemgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11jmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11jmgt02a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11jwmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hs11kemgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm0wmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm1wmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm2wmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm3wmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm3xnmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsm3xsmgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt02a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt03a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt04a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt05a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt06a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt07a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt08a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt09a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgt10a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt02a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt03a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt04a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt05a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt06a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt07a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt08a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt09a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgt10a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmmdf1mgmt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmmdf2mgmt01a | - | 722XP | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgtagg01a | - | 7050X3 | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc1mgtagg02a | - | 7050X3 | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgtagg01a | - | 7050X3 | Not Available | - |
| SM-MGMT_FABRIC | leaf | hsmdc2mgtagg02a | - | 7050X3 | Not Available | - |
| SM-MGMT_FABRIC | l3spine | ismmgtsp01a | - | 7300X3 | Not Available | - |
| SM-MGMT_FABRIC | l3spine | ismmgtsp02a | - | 7300X3 | Not Available | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| leaf | hs00amgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/5 |
| leaf | hs00amgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/5 |
| leaf | hs00bmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/5 |
| leaf | hs00bmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/5 |
| leaf | hs00cmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/5 |
| leaf | hs00cmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/5 |
| leaf | hs01amgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/6 |
| leaf | hs01amgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/6 |
| leaf | hs01bmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/6 |
| leaf | hs01bmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/6 |
| leaf | hs01cmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/6 |
| leaf | hs01cmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/6 |
| leaf | hs02amgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/6 |
| leaf | hs02amgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/6 |
| leaf | hs02bmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/6 |
| leaf | hs02bmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/6 |
| leaf | hs03amgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/7 |
| leaf | hs03amgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/7 |
| leaf | hs03bmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/7 |
| leaf | hs03bmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/7 |
| leaf | hs11amgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/2 |
| leaf | hs11amgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/2 |
| leaf | hs11amgt02a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/2 |
| leaf | hs11amgt02a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/2 |
| leaf | hs11bemgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/4 |
| leaf | hs11bemgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/4 |
| leaf | hs11cmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/1 |
| leaf | hs11cmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/1 |
| leaf | hs11cmgt21a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/2 |
| leaf | hs11cmgt21a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/2 |
| leaf | hs11cwmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/3 |
| leaf | hs11cwmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/3 |
| leaf | hs11demgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/3 |
| leaf | hs11demgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/3 |
| leaf | hs11ewmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/3 |
| leaf | hs11ewmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/3 |
| leaf | hs11gmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/1 |
| leaf | hs11gmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/1 |
| leaf | hs11gmgt02a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/1 |
| leaf | hs11gmgt02a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/1 |
| leaf | hs11gwmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/2 |
| leaf | hs11gwmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/2 |
| leaf | hs11hemgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/3 |
| leaf | hs11hemgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/3 |
| leaf | hs11jmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/1 |
| leaf | hs11jmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/1 |
| leaf | hs11jmgt02a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/1 |
| leaf | hs11jmgt02a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/1 |
| leaf | hs11jwmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/2 |
| leaf | hs11jwmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/2 |
| leaf | hs11kemgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/3 |
| leaf | hs11kemgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/3 |
| leaf | hsm0wmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/4 |
| leaf | hsm0wmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/4 |
| leaf | hsm1wmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/4 |
| leaf | hsm1wmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/4 |
| leaf | hsm2wmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/4 |
| leaf | hsm2wmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/4 |
| leaf | hsm3wmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet4/5 |
| leaf | hsm3wmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet4/5 |
| leaf | hsm3xnmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet7/4 |
| leaf | hsm3xnmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet7/4 |
| leaf | hsm3xsmgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet3/5 |
| leaf | hsm3xsmgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet3/5 |
| leaf | hsmdc1mgt01a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet1 |
| leaf | hsmdc1mgt01a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet1 |
| leaf | hsmdc1mgt02a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet2 |
| leaf | hsmdc1mgt02a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet2 |
| leaf | hsmdc1mgt03a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet3 |
| leaf | hsmdc1mgt03a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet3 |
| leaf | hsmdc1mgt04a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet4 |
| leaf | hsmdc1mgt04a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet4 |
| leaf | hsmdc1mgt05a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet5 |
| leaf | hsmdc1mgt05a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet5 |
| leaf | hsmdc1mgt06a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet6 |
| leaf | hsmdc1mgt06a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet6 |
| leaf | hsmdc1mgt07a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet7 |
| leaf | hsmdc1mgt07a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet7 |
| leaf | hsmdc1mgt08a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet8 |
| leaf | hsmdc1mgt08a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet8 |
| leaf | hsmdc1mgt09a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet9 |
| leaf | hsmdc1mgt09a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet9 |
| leaf | hsmdc1mgt10a | Ethernet49 | leaf | hsmdc1mgtagg01a | Ethernet10 |
| leaf | hsmdc1mgt10a | Ethernet50 | leaf | hsmdc1mgtagg02a | Ethernet10 |
| leaf | hsmdc2mgt01a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet1 |
| leaf | hsmdc2mgt01a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet1 |
| leaf | hsmdc2mgt02a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet2 |
| leaf | hsmdc2mgt02a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet2 |
| leaf | hsmdc2mgt03a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet3 |
| leaf | hsmdc2mgt03a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet3 |
| leaf | hsmdc2mgt04a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet4 |
| leaf | hsmdc2mgt04a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet4 |
| leaf | hsmdc2mgt05a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet5 |
| leaf | hsmdc2mgt05a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet5 |
| leaf | hsmdc2mgt06a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet6 |
| leaf | hsmdc2mgt06a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet6 |
| leaf | hsmdc2mgt07a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet7 |
| leaf | hsmdc2mgt07a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet7 |
| leaf | hsmdc2mgt08a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet8 |
| leaf | hsmdc2mgt08a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet8 |
| leaf | hsmdc2mgt09a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet9 |
| leaf | hsmdc2mgt09a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet9 |
| leaf | hsmdc2mgt10a | Ethernet49 | leaf | hsmdc2mgtagg01a | Ethernet10 |
| leaf | hsmdc2mgt10a | Ethernet50 | leaf | hsmdc2mgtagg02a | Ethernet10 |
| leaf | hsmmdf1mgmt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/7 |
| leaf | hsmmdf1mgmt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/7 |
| leaf | hsmmdf2mgmt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/7 |
| leaf | hsmmdf2mgmt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/7 |
| leaf | hsmdc1mgtagg01a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet3/49/1 |
| leaf | hsmdc1mgtagg01a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet3/49/1 |
| leaf | hsmdc1mgtagg01a | Ethernet103/1 | mlag_peer | hsmdc1mgtagg02a | Ethernet103/1 |
| leaf | hsmdc1mgtagg01a | Ethernet104/1 | mlag_peer | hsmdc1mgtagg02a | Ethernet104/1 |
| leaf | hsmdc1mgtagg02a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet4/49/1 |
| leaf | hsmdc1mgtagg02a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet4/49/1 |
| leaf | hsmdc2mgtagg01a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet5/49/1 |
| leaf | hsmdc2mgtagg01a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet5/49/1 |
| leaf | hsmdc2mgtagg01a | Ethernet103/1 | mlag_peer | hsmdc2mgtagg02a | Ethernet103/1 |
| leaf | hsmdc2mgtagg01a | Ethernet104/1 | mlag_peer | hsmdc2mgtagg02a | Ethernet104/1 |
| leaf | hsmdc2mgtagg02a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet6/49/1 |
| leaf | hsmdc2mgtagg02a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet6/49/1 |
| l3spine | ismmgtsp01a | Ethernet3/52/1 | mlag_peer | ismmgtsp02a | Ethernet3/52/1 |
| l3spine | ismmgtsp01a | Ethernet4/52/1 | mlag_peer | ismmgtsp02a | Ethernet4/52/1 |

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
| 172.21.0.248/30 | 4 | 2 | 50.0 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| SM-MGMT_FABRIC | ismmgtsp01a | 172.21.0.249/32 |
| SM-MGMT_FABRIC | ismmgtsp02a | 172.21.0.250/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |

## Connected Endpoints

### Connected Endpoint Keys

| Key | Type | Description |
| --- | ---- | ----------- |
| firewalls | firewall | - |
| routers | router | - |
| servers | server | - |

### Firewalls

| Name | Port | Fabric Device | Fabric Port | Description | Shutdown | Type | Mode | VLANs | Profile |
| ---- | ---- | ------------- | ------------| ----------- | -------- | ---- | ---- | ----- | ------- |
| ISMMGTPAN01 | Eth1/15 | ismmgtsp01a | Ethernet3/25 | [L]_ISMMGTPAN01 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN01 | Eth1/16 | ismmgtsp02a | Ethernet3/25 | [L]_ISMMGTPAN01 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN02 | Eth1/15 | ismmgtsp01a | Ethernet4/25 | [L]_ISMMGTPAN02 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN02 | Eth1/16 | ismmgtsp02a | Ethernet4/25 | [L]_ISMMGTPAN02 | False | switched | access | 549 | PP-FIREWALL |

### Port Profiles

| Profile Name | Parent Profile |
| ------------ | -------------- |
| PP-DEFAULTS | - |
| PP-DC1/DC2/MDF_vl300 | PP-DEFAULTS |
| PP-OOB-MGMT_vl308 | PP-DEFAULTS |
| PP-DMF_vl443 | PP-DEFAULTS |
| PP-SM1_vl461 | PP-DEFAULTS |
| PP-ADMIN_vl462 | PP-DEFAULTS |
| PP-SUPPORT_vl463 | PP-DEFAULTS |
| PP-FIREWALL | - |
