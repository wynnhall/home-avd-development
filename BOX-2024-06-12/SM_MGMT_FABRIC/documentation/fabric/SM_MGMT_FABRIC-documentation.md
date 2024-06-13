# SM_MGMT_FABRIC

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
  - [Servers](#servers)
  - [Port Profiles](#port-profiles)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| SM_MGMT_FABRIC | leaf | hs00amgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs00bmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs00cmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs01amgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs01bmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs01cmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs02amgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs02bmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs03amgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs03bmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11amgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11amgt02a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11bemgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11cmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11cmgt21a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11cwmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11demgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11ewmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11gmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11gmgt02a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11gwmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11hemgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11jmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11jmgt02a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11jwmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hs11kemgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm0wmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm1wmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm2wmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm3wmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm3xnmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsm3xsmgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt02a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt03a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt04a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt05a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt06a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt07a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt08a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgt09a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgtagg01a | - | 7050X3 | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc1mgtagg02a | - | 7050X3 | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt02a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt03a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt04a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt05a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt06a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt07a | - | 722XP | Provisioned | HBG234100XP |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt08a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgt09a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmdc2mgtagg01a | - | 7050X3 | Provisioned | FGN234406NV |
| SM_MGMT_FABRIC | leaf | hsmdc2mgtagg02a | - | 7050X3 | Provisioned | FGN23440361 |
| SM_MGMT_FABRIC | leaf | hsmmdf1mgt01a | - | 722XP | Not Available | - |
| SM_MGMT_FABRIC | leaf | hsmmdf2mgt01a | - | 722XP | Provisioned | HBG234100VN |
| SM_MGMT_FABRIC | l3spine | ismmgtsp01a | - | 7300X3 | Not Available | - |
| SM_MGMT_FABRIC | l3spine | ismmgtsp02a | - | 7300X3 | Provisioned | HNN21255702 |

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
| leaf | hsmdc1mgtagg01a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet3/49/1 |
| leaf | hsmdc1mgtagg01a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet3/49/1 |
| leaf | hsmdc1mgtagg01a | Ethernet103/1 | mlag_peer | hsmdc1mgtagg02a | Ethernet103/1 |
| leaf | hsmdc1mgtagg01a | Ethernet104/1 | mlag_peer | hsmdc1mgtagg02a | Ethernet104/1 |
| leaf | hsmdc1mgtagg02a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet4/49/1 |
| leaf | hsmdc1mgtagg02a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet4/49/1 |
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
| leaf | hsmdc2mgtagg01a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet5/49/1 |
| leaf | hsmdc2mgtagg01a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet5/49/1 |
| leaf | hsmdc2mgtagg01a | Ethernet103/1 | mlag_peer | hsmdc2mgtagg02a | Ethernet103/1 |
| leaf | hsmdc2mgtagg01a | Ethernet104/1 | mlag_peer | hsmdc2mgtagg02a | Ethernet104/1 |
| leaf | hsmdc2mgtagg02a | Ethernet97/1 | l3spine | ismmgtsp01a | Ethernet6/49/1 |
| leaf | hsmdc2mgtagg02a | Ethernet98/1 | l3spine | ismmgtsp02a | Ethernet6/49/1 |
| leaf | hsmmdf1mgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet5/7 |
| leaf | hsmmdf1mgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet5/7 |
| leaf | hsmmdf2mgt01a | Ethernet49 | l3spine | ismmgtsp01a | Ethernet6/7 |
| leaf | hsmmdf2mgt01a | Ethernet50 | l3spine | ismmgtsp02a | Ethernet6/7 |
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
| SM_MGMT_FABRIC | ismmgtsp01a | 172.21.0.249/32 |
| SM_MGMT_FABRIC | ismmgtsp02a | 172.21.0.250/32 |

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
| ISMMGTPAN01 | Eth1/15 | ismmgtsp01a | Ethernet3/25 | [L]_ISMMGTPAN01_Eth1/15 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN01 | Eth1/16 | ismmgtsp02a | Ethernet3/25 | [L]_ISMMGTPAN01_Eth1/16 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN02 | Eth1/15 | ismmgtsp01a | Ethernet4/25 | [L]_ISMMGTPAN02_Eth1/15 | False | switched | access | 549 | PP-FIREWALL |
| ISMMGTPAN02 | Eth1/16 | ismmgtsp02a | Ethernet4/25 | [L]_ISMMGTPAN02_Eth1/16 | False | switched | access | 549 | PP-FIREWALL |

### Servers

| Name | Port | Fabric Device | Fabric Port | Description | Shutdown | Type | Mode | VLANs | Profile |
| ---- | ---- | ------------- | ------------| ----------- | -------- | ---- | ---- | ----- | ------- |
| HSMDC2F401AA | MGMT1 | hsmdc2mgt07a | Ethernet47 | [L]_HSMDC2F401AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2F401BA | MGMT1 | hsmdc2mgt07a | Ethernet48 | [L]_HSMDC2F401BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2F601AA | MGMT1 | hsmdc2mgt09a | Ethernet47 | [L]_HSMDC2F601AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2F601BA | MGMT1 | hsmdc2mgt09a | Ethernet48 | [L]_HSMDC2F601BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G601AA | MGMT1 | hsmdc2mgt02a | Ethernet47 | [L]_HSMDC2G601AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G601BA | MGMT1 | hsmdc2mgt02a | Ethernet48 | [L]_HSMDC2G601BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G701AA | MGMT1 | hsmdc2mgt03a | Ethernet47 | [L]_HSMDC2G701AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G701BA | MGMT1 | hsmdc2mgt03a | Ethernet48 | [L]_HSMDC2G701BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G801AA | MGMT1 | hsmdc2mgt04a | Ethernet47 | [L]_HSMDC2G801AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G801BA | MGMT1 | hsmdc2mgt04a | Ethernet48 | [L]_HSMDC2G801BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G901AA | MGMT1 | hsmdc2mgt05a | Ethernet47 | [L]_HSMDC2G901AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G901BA | MGMT1 | hsmdc2mgt05a | Ethernet48 | [L]_HSMDC2G901BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G1001AA | MGMT1 | hsmdc2mgt06a | Ethernet47 | [L]_HSMDC2G1001AA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| HSMDC2G1001BA | MGMT1 | hsmdc2mgt06a | Ethernet48 | [L]_HSMDC2G1001BA_MGMT1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| OS00AOGTS01 | NET1 | ismmgtsp01a | Ethernet5/30 | [L]_OS00AOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS00AOGTS01 | NET2 | ismmgtsp02a | Ethernet5/30 | [L]_OS00AOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS00BOGTS01 | NET1 | ismmgtsp01a | Ethernet6/30 | [L]_OS00BOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS00BOGTS01 | NET2 | ismmgtsp02a | Ethernet6/30 | [L]_OS00BOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS00COGTS01 | NET1 | ismmgtsp01a | Ethernet7/30 | [L]_OS00COGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS00COGTS01 | NET2 | ismmgtsp02a | Ethernet7/30 | [L]_OS00COGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS01BOGTS01 | NET1 | ismmgtsp01a | Ethernet3/31 | [L]_OS01BOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS01BOGTS01 | NET2 | ismmgtsp02a | Ethernet3/31 | [L]_OS01BOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS02BOGTS01 | NET1 | ismmgtsp01a | Ethernet5/31 | [L]_OS02BOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS02BOGTS01 | NET2 | ismmgtsp02a | Ethernet5/31 | [L]_OS02BOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS02OGTS01 | NET1 | ismmgtsp01a | Ethernet4/31 | [L]_OS02OGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS02OGTS01 | NET2 | ismmgtsp02a | Ethernet4/31 | [L]_OS02OGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS03AOGTS01 | NET1 | ismmgtsp01a | Ethernet6/31 | [L]_OS03AOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS03AOGTS01 | NET2 | ismmgtsp02a | Ethernet6/31 | [L]_OS03AOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS03BOGTS01 | NET1 | ismmgtsp01a | Ethernet7/31 | [L]_OS03BOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS03BOGTS01 | NET2 | ismmgtsp02a | Ethernet7/31 | [L]_OS03BOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11AOGTS01 | NET1 | ismmgtsp01a | Ethernet4/27 | [L]_OS11AOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11AOGTS01 | NET2 | ismmgtsp02a | Ethernet4/27 | [L]_OS11AOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11AOGTS02 | NET1 | ismmgtsp01a | Ethernet5/27 | [L]_OS11AOGTS02_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11AOGTS02 | NET2 | ismmgtsp02a | Ethernet5/27 | [L]_OS11AOGTS02_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11BEOGTS01 | NET1 | ismmgtsp01a | Ethernet3/29 | [L]_OS11BEOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11BEOGTS01 | NET2 | ismmgtsp02a | Ethernet3/29 | [L]_OS11BEOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11COGTS01 | NET1 | ismmgtsp01a | Ethernet7/26 | [L]_OS11COGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11COGTS01 | NET2 | ismmgtsp02a | Ethernet7/26 | [L]_OS11COGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11COGTS02 | NET1 | ismmgtsp01a | Ethernet3/27 | [L]_OS11COGTS02_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11COGTS02 | NET2 | ismmgtsp02a | Ethernet3/27 | [L]_OS11COGTS02_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11CWOGTS01 | NET1 | ismmgtsp01a | Ethernet4/28 | [L]_OS11CWOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11CWOGTS01 | NET2 | ismmgtsp02a | Ethernet4/28 | [L]_OS11CWOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11DEOGTS01 | NET1 | ismmgtsp01a | Ethernet7/28 | [L]_OS11DEOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11DEOGTS01 | NET2 | ismmgtsp02a | Ethernet7/28 | [L]_OS11DEOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11EWOGTS01 | NET1 | ismmgtsp01a | Ethernet3/28 | [L]_OS11EWOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11EWOGTS01 | NET2 | ismmgtsp02a | Ethernet3/28 | [L]_OS11EWOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GOGTS01 | NET1 | ismmgtsp01a | Ethernet5/26 | [L]_OS11GOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GOGTS01 | NET2 | ismmgtsp02a | Ethernet5/26 | [L]_OS11GOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GOGTS02 | NET1 | ismmgtsp01a | Ethernet6/26 | [L]_OS11GOGTS02_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GOGTS02 | NET2 | ismmgtsp02a | Ethernet6/26 | [L]_OS11GOGTS02_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GWOGTS01 | NET1 | ismmgtsp01a | Ethernet7/27 | [L]_OS11GWOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11GWOGTS01 | NET2 | ismmgtsp02a | Ethernet7/27 | [L]_OS11GWOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11HEOGTS01 | NET1 | ismmgtsp01a | Ethernet6/28 | [L]_OS11HEOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11HEOGTS01 | NET2 | ismmgtsp02a | Ethernet6/28 | [L]_OS11HEOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JOGTS01 | NET1 | ismmgtsp01a | Ethernet3/26 | [L]_OS11JOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JOGTS01 | NET2 | ismmgtsp02a | Ethernet3/26 | [L]_OS11JOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JOGTS02 | NET1 | ismmgtsp01a | Ethernet4/26 | [L]_OS11JOGTS02_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JOGTS02 | NET2 | ismmgtsp02a | Ethernet4/26 | [L]_OS11JOGTS02_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JWOGTS01 | NET1 | ismmgtsp01a | Ethernet6/27 | [L]_OS11JWOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11JWOGTS01 | NET2 | ismmgtsp02a | Ethernet6/27 | [L]_OS11JWOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OS11KEOGTS01 | NET1 | ismmgtsp01a | Ethernet5/28 | [L]_OS11KEOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OS11KEOGTS01 | NET2 | ismmgtsp02a | Ethernet5/28 | [L]_OS11KEOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM0WOGTS01 | NET1 | ismmgtsp01a | Ethernet4/29 | [L]_OSM0WOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM0WOGTS01 | NET2 | ismmgtsp02a | Ethernet4/29 | [L]_OSM0WOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM1WOGTS01 | NET1 | ismmgtsp01a | Ethernet5/29 | [L]_OSM1WOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM1WOGTS01 | NET2 | ismmgtsp02a | Ethernet5/29 | [L]_OSM1WOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM2WOGTS01 | NET1 | ismmgtsp01a | Ethernet6/29 | [L]_OSM2WOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM2WOGTS01 | NET2 | ismmgtsp02a | Ethernet6/29 | [L]_OSM2WOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3WOGTS01 | NET1 | ismmgtsp01a | Ethernet4/30 | [L]_OSM3WOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3WOGTS01 | NET2 | ismmgtsp02a | Ethernet4/30 | [L]_OSM3WOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3XNOGTS01 | NET1 | ismmgtsp01a | Ethernet7/29 | [L]_OSM3XNOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3XNOGTS01 | NET2 | ismmgtsp02a | Ethernet7/29 | [L]_OSM3XNOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3XSOGTS01 | NET1 | ismmgtsp01a | Ethernet3/30 | [L]_OSM3XSOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSM3XSOGTS01 | NET2 | ismmgtsp02a | Ethernet3/30 | [L]_OSM3XSOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDC1OGTS01 | NET1 | ismmgtsp01a | Ethernet7/32 | [L]_OSMDC1OGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDC1OGTS01 | NET2 | ismmgtsp02a | Ethernet7/32 | [L]_OSMDC1OGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDC2OGTS01 | NET1 | ismmgtsp01a | Ethernet3/33 | [L]_OSMDC2OGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDC2OGTS01 | NET2 | ismmgtsp02a | Ethernet3/33 | [L]_OSMDC2OGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDF1OGTS02 | NET1 | ismmgtsp01a | Ethernet5/32 | [L]_OSMDF1OGTS02_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMDF1OGTS02 | NET2 | ismmgtsp02a | Ethernet5/32 | [L]_OSMDF1OGTS02_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMIBSD02 | MGMT | hsmdc2mgt07a | Ethernet3 | [L]_OSMIBSD02_MGMT | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| OSMMDF1OGTS01 | NET1 | ismmgtsp01a | Ethernet4/32 | [L]_OSMMDF1OGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMMDF1OGTS01 | NET2 | ismmgtsp02a | Ethernet4/32 | [L]_OSMMDF1OGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMMDF2OGTS01 | NET1 | ismmgtsp01a | Ethernet6/32 | [L]_OSMMDF2OGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMMDF2OGTS01 | NET2 | ismmgtsp02a | Ethernet6/32 | [L]_OSMMDF2OGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| OSMPGOGTS01 | NET1 | ismmgtsp01a | Ethernet3/32 | [L]_OSMPGOGTS01_NET1 | False | switched | access | 308 | PP-OG_vl308 |
| OSMPGOGTS01 | NET2 | ismmgtsp02a | Ethernet3/32 | [L]_OSMPGOGTS01_NET2 | False | switched | access | 308 | PP-OG_vl308 |
| S2LRACA011 | NMGT | hsmdc2mgt03a | Ethernet1 | [L]_S2LRACA011_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2LRACA021 | NMGT | hsmdc2mgt04a | Ethernet1 | [L]_S2LRACA021_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2LRACA031 | NMGT | hsmdc2mgt05a | Ethernet1 | [L]_S2LRACA031_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2LRACB041 | NMGT | hsmdc2mgt06a | Ethernet1 | [L]_S2LRACB041_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2NBU02 | NMGT | hsmdc2mgt03a | Ethernet11 | [L]_S2NBU02_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2NBU03 | NMGT | hsmdc2mgt04a | Ethernet11 | [L]_S2NBU03_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2NBU03 | NMGT | hsmdc2mgt05a | Ethernet11 | [L]_S2NBU03_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2NBU03 | NMGT | hsmdc2mgt06a | Ethernet11 | [L]_S2NBU03_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH001 | NMGT | hsmdc2mgt02a | Ethernet1 | [L]_S2VH001_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH002 | NMGT | hsmdc2mgt02a | Ethernet2 | [L]_S2VH002_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH003 | NMGT | hsmdc2mgt02a | Ethernet3 | [L]_S2VH003_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH004 | NMGT | hsmdc2mgt02a | Ethernet4 | [L]_S2VH004_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH005 | NMGT | hsmdc2mgt02a | Ethernet5 | [L]_S2VH005_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH006 | NMGT | hsmdc2mgt02a | Ethernet6 | [L]_S2VH006_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH007 | NMGT | hsmdc2mgt02a | Ethernet7 | [L]_S2VH007_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH008 | NMGT | hsmdc2mgt02a | Ethernet8 | [L]_S2VH008_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH009 | NMGT | hsmdc2mgt02a | Ethernet9 | [L]_S2VH009_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH010 | NMGT | hsmdc2mgt02a | Ethernet10 | [L]_S2VH010_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH012 | NMGT | hsmdc2mgt03a | Ethernet2 | [L]_S2VH012_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH013 | NMGT | hsmdc2mgt03a | Ethernet3 | [L]_S2VH013_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH014 | NMGT | hsmdc2mgt03a | Ethernet4 | [L]_S2VH014_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH015 | NMGT | hsmdc2mgt03a | Ethernet5 | [L]_S2VH015_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH016 | NMGT | hsmdc2mgt03a | Ethernet6 | [L]_S2VH016_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH017 | NMGT | hsmdc2mgt03a | Ethernet7 | [L]_S2VH017_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH018 | NMGT | hsmdc2mgt03a | Ethernet8 | [L]_S2VH018_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH019 | NMGT | hsmdc2mgt03a | Ethernet9 | [L]_S2VH019_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH020 | NMGT | hsmdc2mgt03a | Ethernet10 | [L]_S2VH020_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH022 | NMGT | hsmdc2mgt04a | Ethernet2 | [L]_S2VH022_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH023 | NMGT | hsmdc2mgt04a | Ethernet3 | [L]_S2VH023_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH024 | NMGT | hsmdc2mgt04a | Ethernet4 | [L]_S2VH024_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH025 | NMGT | hsmdc2mgt04a | Ethernet5 | [L]_S2VH025_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH026 | NMGT | hsmdc2mgt04a | Ethernet6 | [L]_S2VH026_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH027 | NMGT | hsmdc2mgt04a | Ethernet7 | [L]_S2VH027_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH028 | NMGT | hsmdc2mgt04a | Ethernet8 | [L]_S2VH028_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH029 | NMGT | hsmdc2mgt04a | Ethernet9 | [L]_S2VH029_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH030 | NMGT | hsmdc2mgt04a | Ethernet10 | [L]_S2VH030_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH032 | NMGT | hsmdc2mgt05a | Ethernet2 | [L]_S2VH032_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH033 | NMGT | hsmdc2mgt05a | Ethernet3 | [L]_S2VH033_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH034 | NMGT | hsmdc2mgt05a | Ethernet4 | [L]_S2VH034_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH035 | NMGT | hsmdc2mgt05a | Ethernet5 | [L]_S2VH035_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH036 | NMGT | hsmdc2mgt05a | Ethernet6 | [L]_S2VH036_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH037 | NMGT | hsmdc2mgt05a | Ethernet7 | [L]_S2VH037_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH038 | NMGT | hsmdc2mgt05a | Ethernet8 | [L]_S2VH038_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH039 | NMGT | hsmdc2mgt05a | Ethernet9 | [L]_S2VH039_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH040 | NMGT | hsmdc2mgt05a | Ethernet10 | [L]_S2VH040_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH042 | NMGT | hsmdc2mgt06a | Ethernet2 | [L]_S2VH042_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH043 | NMGT | hsmdc2mgt06a | Ethernet3 | [L]_S2VH043_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH044 | NMGT | hsmdc2mgt06a | Ethernet4 | [L]_S2VH044_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH045 | NMGT | hsmdc2mgt06a | Ethernet5 | [L]_S2VH045_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH046 | NMGT | hsmdc2mgt06a | Ethernet6 | [L]_S2VH046_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH047 | NMGT | hsmdc2mgt06a | Ethernet7 | [L]_S2VH047_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH048 | NMGT | hsmdc2mgt06a | Ethernet8 | [L]_S2VH048_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH049 | NMGT | hsmdc2mgt06a | Ethernet9 | [L]_S2VH049_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VH050 | NMGT | hsmdc2mgt06a | Ethernet10 | [L]_S2VH050_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHMGMT01 | NMGT | hsmdc2mgt09a | Ethernet1 | [L]_S2VHMGMT01_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHMGMT02 | NMGT | hsmdc2mgt09a | Ethernet2 | [L]_S2VHMGMT02_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHMGMT03 | NMGT | hsmdc2mgt09a | Ethernet3 | [L]_S2VHMGMT03_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHMGMT04 | NMGT | hsmdc2mgt09a | Ethernet4 | [L]_S2VHMGMT04_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHNMS01 | NMGT | hsmdc2mgt07a | Ethernet1 | [L]_S2VHNMS01_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHNMS01 | P1 | hsmdc2mgt07a | Ethernet6 | [L]_S2VHNMS01_P1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| S2VHNMS01 | P2 | hsmdc2mgt07a | Ethernet8 | [L]_S2VHNMS01_P2 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| S2VHNMS02 | NMGT | hsmdc2mgt07a | Ethernet2 | [L]_S2VHNMS02_NMGT | False | switched | access | 316 | PP-ILO_vl316 |
| S2VHNMS02 | P1 | hsmdc2mgt07a | Ethernet7 | [L]_S2VHNMS02_P1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| S2VHNMS02 | P2 | hsmdc2mgt07a | Ethernet9 | [L]_S2VHNMS02_P2 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| SMVHCVPTEMP | P1 | hsmdc2mgt07a | Ethernet4 | [L]_SMVHCVPTEMP_P1 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| SMVHCVPTEMP | P2 | hsmdc2mgt07a | Ethernet5 | [L]_SMVHCVPTEMP_P2 | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |
| TEMP_SENSOR_2 | LAN | hsmdc2mgt07a | Ethernet40 | [L]_TEMP_SENSOR_2_LAN | False | switched | access | 300 | PP-DC1/DC2/MDF_vl300 |

### Port Profiles

| Profile Name | Parent Profile |
| ------------ | -------------- |
| PP-DEFAULTS | - |
| PP-DC1/DC2/MDF_vl300 | PP-DEFAULTS |
| PP-OOB-MGMT_vl308 | PP-DEFAULTS |
| PP-OG_vl308 | - |
| PP-ILO_vl316 | PP-DEFAULTS |
| PP-DMF_vl443 | PP-DEFAULTS |
| PP-SM1_vl461 | PP-DEFAULTS |
| PP-ADMIN_vl462 | PP-DEFAULTS |
| PP-SUPPORT_vl463 | PP-DEFAULTS |
| PP-FIREWALL | - |
