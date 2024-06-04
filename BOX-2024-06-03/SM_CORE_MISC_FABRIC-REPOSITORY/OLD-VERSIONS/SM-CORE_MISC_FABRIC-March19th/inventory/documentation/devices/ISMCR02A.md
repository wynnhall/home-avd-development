# ISMCR02A

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [Management API HTTP](#management-api-http)
- [MLAG](#mlag)
  - [MLAG Summary](#mlag-summary)
  - [MLAG Device Configuration](#mlag-device-configuration)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Route-maps](#route-maps)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management0 | oob_management | oob | mgmt | 10.210.80.73/21 | 10.210.80.1 |

##### IPv6

| Management Interface | Description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management0 | oob_management | oob | mgmt | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management0
   description oob_management
   no shutdown
   vrf mgmt
   ip address 10.210.80.73/21
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| mgmt | - | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf mgmt
      no shutdown
```

## MLAG

### MLAG Summary

| Domain-id | Local-interface | Peer-address | Peer-link |
| --------- | --------------- | ------------ | --------- |
| CAMPUS_CORES | Vlan4094 | 192.168.0.0 | Port-Channel3481 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id CAMPUS_CORES
   local-interface Vlan4094
   peer-address 192.168.0.0
   peer-link Port-Channel3481
   reload-delay mlag 900
   reload-delay non-mlag 1020
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4093-4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree mst 0 priority 4096
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Device Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 10 | WANFW-TRANSIT-OTVRF | - |
| 20 | WANFW-TRANSIT-IT-DCVRF | - |
| 30 | WANFW-TRANSIT-ITVRF | - |
| 40 | IoTFW-TRANSIT-IoTVRF | - |
| 110 | VENDORFW-TRANSIT-OTVRF | - |
| 310 | SCADAFW-TRANSIT-ITVRF | - |
| 4089 | MLAG_iBGP_IoT | LEAF_PEER_L3 |
| 4090 | MLAG_iBGP_IT | LEAF_PEER_L3 |
| 4091 | MLAG_iBGP_IT-DC | LEAF_PEER_L3 |
| 4092 | MLAG_iBGP_OT | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 10
   name WANFW-TRANSIT-OTVRF
!
vlan 20
   name WANFW-TRANSIT-IT-DCVRF
!
vlan 30
   name WANFW-TRANSIT-ITVRF
!
vlan 40
   name IoTFW-TRANSIT-IoTVRF
!
vlan 110
   name VENDORFW-TRANSIT-OTVRF
!
vlan 310
   name SCADAFW-TRANSIT-ITVRF
!
vlan 4089
   name MLAG_iBGP_IoT
   trunk group LEAF_PEER_L3
!
vlan 4090
   name MLAG_iBGP_IT
   trunk group LEAF_PEER_L3
!
vlan 4091
   name MLAG_iBGP_IT-DC
   trunk group LEAF_PEER_L3
!
vlan 4092
   name MLAG_iBGP_OT
   trunk group LEAF_PEER_L3
!
vlan 4093
   name LEAF_PEER_L3
   trunk group LEAF_PEER_L3
!
vlan 4094
   name MLAG_PEER
   trunk group MLAG
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet3/5/1 | ISMTMGPAN40_Ethernet1/41 | *trunk | *100,200,300,400 | *- | *- | 351 |
| Ethernet3/48/1 | MLAG_PEER_ISMCR01A_Ethernet3/48/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 3481 |
| Ethernet4/5/1 | ISMTMGPAN41_Ethernet1/42 | *trunk | *100,200,300,400 | *- | *- | 451 |
| Ethernet4/48/1 | MLAG_PEER_ISMCR01A_Ethernet4/48/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 3481 |
| Ethernet5/1 | ISMPAN98_Ethernet1/15 | *access | *410 | *- | *- | 51 |
| Ethernet5/2 | ISMPAN60_Ethernet1/15 | *access | *310 | *- | *- | 52 |
| Ethernet5/3 | ISMTMGPAN48_Ethernet1/23 | *access | *110 | *- | *- | 53 |
| Ethernet6/1 | ISMPAN99_Ethernet1/16 | *access | *410 | *- | *- | 61 |
| Ethernet6/2 | ISMPAN61_Ethernet1/16 | *access | *310 | *- | *- | 62 |
| Ethernet6/3 | ISMTMGPAN49_Ethernet1/24 | *access | *110 | *- | *- | 63 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet3/1/1.20 | DC1-BL1-Eth2/1-IT-DCVRF | l3dot1q | - | 20 |
| Ethernet3/1/1.100 | DC1-BL1-Eth2/1-OT-VRF | l3dot1q | - | 100 |
| Ethernet3/2/1.20 | DC2-BL1-Eth2/1-IT-DCVRF | l3dot1q | - | 20 |
| Ethernet3/2/1.100 | DC2-BL1-Eth2/1-OT-VRF | l3dot1q | - | 100 |
| Ethernet3/3/1.30 | ISMS1ITBL01A-Eth2/1-ITVRF | l3dot1q | - | 30 |
| Ethernet3/3/1.40 | ISMS1ITBL01A-Eth2/1-IoTVRF | l3dot1q | - | 40 |
| Ethernet3/4/1.110 | ISMITMSC01A-Eth50/1-OTVRF | l3dot1q | - | 110 |
| Ethernet3/4/1.130 | ISMITMSC01A-Eth50/1-ITVRF | l3dot1q | - | 130 |
| Ethernet4/1/1.20 | DC1-BL2-Eth2/1-IT-DCVRF | l3dot1q | - | 20 |
| Ethernet4/1/1.100 | DC1-BL2-Eth2/1-OT-VRF | l3dot1q | - | 100 |
| Ethernet4/2/1.20 | DC2-BL2-Eth2/1-IT-DCVRF | l3dot1q | - | 20 |
| Ethernet4/2/1.100 | DC2-BL2-Eth2/1-OT-VRF | l3dot1q | - | 100 |
| Ethernet4/3/1.30 | ISMS1ITBL02A-Eth2/1-ITVRF | l3dot1q | - | 30 |
| Ethernet4/3/1.40 | ISMS1ITBL02A-Eth2/1-IoTVRF | l3dot1q | - | 40 |
| Ethernet4/4/1.110 | ISMITMSC02A-Eth50/1-OTVRF | l3dot1q | - | 110 |
| Ethernet4/4/1.130 | ISMITMSC02A-Eth50/1-ITVRF | l3dot1q | - | 130 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3/1/1.20 | DC1-BL1-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.226.28/31 | IT-DC | - | False | - | - |
| Ethernet3/1/1.100 | DC1-BL1-Eth2/1-OT-VRF | l3dot1q | - | 10.210.226.2/31 | OT | - | False | - | - |
| Ethernet3/2/1.20 | DC2-BL1-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.234.20/31 | IT-DC | - | False | - | - |
| Ethernet3/2/1.100 | DC2-BL1-Eth2/1-OT-VRF | l3dot1q | - | 10.210.234.2/31 | OT | - | False | - | - |
| Ethernet3/3/1.30 | ISMS1ITBL01A-Eth2/1-ITVRF | l3dot1q | - | 10.210.241.2/31 | IT | - | False | - | - |
| Ethernet3/3/1.40 | ISMS1ITBL01A-Eth2/1-IoTVRF | l3dot1q | - | 10.210.241.10/31 | IoT | - | False | - | - |
| Ethernet3/4/1.110 | ISMITMSC01A-Eth50/1-OTVRF | l3dot1q | - | 10.210.241.28/31 | OT | - | False | - | - |
| Ethernet3/4/1.130 | ISMITMSC01A-Eth50/1-ITVRF | l3dot1q | - | 10.210.241.18/31 | IT | - | False | - | - |
| Ethernet4/1/1.20 | DC1-BL2-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.226.30/31 | IT-DC | - | False | - | - |
| Ethernet4/1/1.100 | DC1-BL2-Eth2/1-OT-VRF | l3dot1q | - | 10.210.226.6/31 | OT | - | False | - | - |
| Ethernet4/2/1.20 | DC2-BL2-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.234.22/31 | IT-DC | - | False | - | - |
| Ethernet4/2/1.100 | DC2-BL2-Eth2/1-OT-VRF | l3dot1q | - | 10.210.234.6/31 | OT | - | False | - | - |
| Ethernet4/3/1.30 | ISMS1ITBL02A-Eth2/1-ITVRF | l3dot1q | - | 10.210.241.6/31 | IT | - | False | - | - |
| Ethernet4/3/1.40 | ISMS1ITBL02A-Eth2/1-IoTVRF | l3dot1q | - | 10.210.241.14/31 | IoT | - | False | - | - |
| Ethernet4/4/1.110 | ISMITMSC02A-Eth50/1-OTVRF | l3dot1q | - | 10.210.241.32/31 | OT | - | False | - | - |
| Ethernet4/4/1.130 | ISMITMSC02A-Eth50/1-ITVRF | l3dot1q | - | 10.210.241.22/31 | IT | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3/1/1
   no shutdown
   no switchport
!
interface Ethernet3/1/1.20
   description DC1-BL1-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 20
   vrf IT-DC
   ip address 10.210.226.28/31
!
interface Ethernet3/1/1.100
   description DC1-BL1-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.226.2/31
!
interface Ethernet3/2/1
   no shutdown
   no switchport
!
interface Ethernet3/2/1.20
   description DC2-BL1-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 20
   vrf IT-DC
   ip address 10.210.234.20/31
!
interface Ethernet3/2/1.100
   description DC2-BL1-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.234.2/31
!
interface Ethernet3/3/1
   no shutdown
   no switchport
!
interface Ethernet3/3/1.30
   description ISMS1ITBL01A-Eth2/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 30
   vrf IT
   ip address 10.210.241.2/31
!
interface Ethernet3/3/1.40
   description ISMS1ITBL01A-Eth2/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 40
   vrf IoT
   ip address 10.210.241.10/31
!
interface Ethernet3/4/1
   no shutdown
   no switchport
!
interface Ethernet3/4/1.110
   description ISMITMSC01A-Eth50/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 110
   vrf OT
   ip address 10.210.241.28/31
!
interface Ethernet3/4/1.130
   description ISMITMSC01A-Eth50/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 130
   vrf IT
   ip address 10.210.241.18/31
!
interface Ethernet3/5/1
   description ISMTMGPAN40_Ethernet1/41
   no shutdown
   speed 100g
   channel-group 351 mode active
!
interface Ethernet3/48/1
   description MLAG_PEER_ISMCR01A_Ethernet3/48/1
   no shutdown
   speed 100g
   channel-group 3481 mode active
!
interface Ethernet4/1/1
   no shutdown
   no switchport
!
interface Ethernet4/1/1.20
   description DC1-BL2-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 20
   vrf IT-DC
   ip address 10.210.226.30/31
!
interface Ethernet4/1/1.100
   description DC1-BL2-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.226.6/31
!
interface Ethernet4/2/1
   no shutdown
   no switchport
!
interface Ethernet4/2/1.20
   description DC2-BL2-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 20
   vrf IT-DC
   ip address 10.210.234.22/31
!
interface Ethernet4/2/1.100
   description DC2-BL2-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.234.6/31
!
interface Ethernet4/3/1
   no shutdown
   no switchport
!
interface Ethernet4/3/1.30
   description ISMS1ITBL02A-Eth2/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 30
   vrf IT
   ip address 10.210.241.6/31
!
interface Ethernet4/3/1.40
   description ISMS1ITBL02A-Eth2/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 40
   vrf IoT
   ip address 10.210.241.14/31
!
interface Ethernet4/4/1
   no shutdown
   no switchport
!
interface Ethernet4/4/1.110
   description ISMITMSC02A-Eth50/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 110
   vrf OT
   ip address 10.210.241.32/31
!
interface Ethernet4/4/1.130
   description ISMITMSC02A-Eth50/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 130
   vrf IT
   ip address 10.210.241.22/31
!
interface Ethernet4/5/1
   description ISMTMGPAN41_Ethernet1/42
   no shutdown
   speed 100g
   channel-group 451 mode active
!
interface Ethernet4/48/1
   description MLAG_PEER_ISMCR01A_Ethernet4/48/1
   no shutdown
   speed 100g
   channel-group 3481 mode active
!
interface Ethernet5/1
   description ISMPAN98_Ethernet1/15
   no shutdown
   speed 10g
   channel-group 51 mode active
!
interface Ethernet5/2
   description ISMPAN60_Ethernet1/15
   no shutdown
   speed 25g
   channel-group 52 mode active
!
interface Ethernet5/3
   description ISMTMGPAN48_Ethernet1/23
   no shutdown
   speed 25g
   channel-group 53 mode active
!
interface Ethernet6/1
   description ISMPAN99_Ethernet1/16
   no shutdown
   speed 10g
   channel-group 61 mode active
!
interface Ethernet6/2
   description ISMPAN61_Ethernet1/16
   no shutdown
   speed 25g
   channel-group 62 mode active
!
interface Ethernet6/3
   description ISMTMGPAN49_Ethernet1/24
   no shutdown
   speed 25g
   channel-group 63 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel51 | ISMPAN98_MLAG PortChannel to IoT Firewalls | switched | access | 410 | - | - | - | - | 51 | - |
| Port-Channel52 | ISMPAN60_MLAG PortChannel to SCADA Firewalls | switched | access | 310 | - | - | - | - | 52 | - |
| Port-Channel53 | ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls | switched | access | 110 | - | - | - | - | 53 | - |
| Port-Channel61 | ISMPAN99_MLAG PortChannel to IoT Firewalls | switched | access | 410 | - | - | - | - | 61 | - |
| Port-Channel62 | ISMPAN61_MLAG PortChannel to SCADA Firewalls | switched | access | 310 | - | - | - | - | 62 | - |
| Port-Channel63 | ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls | switched | access | 110 | - | - | - | - | 63 | - |
| Port-Channel351 | ISMTMGPAN40_MLAG PortChannel to WAN Firewalls | switched | trunk | 100,200,300,400 | - | - | - | - | 351 | - |
| Port-Channel451 | ISMTMGPAN41_MLAG PortChannel to WAN Firewalls | switched | trunk | 100,200,300,400 | - | - | - | - | 451 | - |
| Port-Channel3481 | MLAG_PEER_ISMCR01A_Po3481 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel51
   description ISMPAN98_MLAG PortChannel to IoT Firewalls
   no shutdown
   switchport
   switchport access vlan 410
   mlag 51
   spanning-tree portfast
!
interface Port-Channel52
   description ISMPAN60_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport access vlan 310
   mlag 52
   spanning-tree portfast
!
interface Port-Channel53
   description ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport access vlan 110
   mlag 53
   spanning-tree portfast
!
interface Port-Channel61
   description ISMPAN99_MLAG PortChannel to IoT Firewalls
   no shutdown
   switchport
   switchport access vlan 410
   mlag 61
   spanning-tree portfast
!
interface Port-Channel62
   description ISMPAN61_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport access vlan 310
   mlag 62
   spanning-tree portfast
!
interface Port-Channel63
   description ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport access vlan 110
   mlag 63
   spanning-tree portfast
!
interface Port-Channel351
   description ISMTMGPAN40_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 100,200,300,400
   switchport mode trunk
   mlag 351
   spanning-tree portfast
!
interface Port-Channel451
   description ISMTMGPAN41_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 100,200,300,400
   switchport mode trunk
   mlag 451
   spanning-tree portfast
!
interface Port-Channel3481
   description MLAG_PEER_ISMCR01A_Po3481
   no shutdown
   switchport
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | Router_ID | default | 172.21.0.26/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | Router_ID | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description Router_ID
   no shutdown
   ip address 172.21.0.26/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan10 | WANFW-TRANSIT-OTVRF | OT | - | False |
| Vlan20 | WANFW-TRANSIT-IT-DCVRF | IT-DC | - | False |
| Vlan30 | WANFW-TRANSIT-ITVRF | IT | - | False |
| Vlan40 | IoTFW-TRANSIT-IoTVRF | IoT | - | False |
| Vlan110 | VENDORFW-TRANSIT-OTVRF | OT | - | False |
| Vlan310 | SCADAFW-TRANSIT-ITVRF | IT | - | False |
| Vlan4089 | MLAG_PEER_L3_iBGP: vrf IoT | IoT | 9214 | False |
| Vlan4090 | MLAG_PEER_L3_iBGP: vrf IT | IT | 9214 | False |
| Vlan4091 | MLAG_PEER_L3_iBGP: vrf IT-DC | IT-DC | 9214 | False |
| Vlan4092 | MLAG_PEER_L3_iBGP: vrf OT | OT | 9214 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan10 |  OT  |  10.210.249.67/29  |  -  |  10.210.249.65  |  -  |  -  |  -  |
| Vlan20 |  IT-DC  |  10.210.226.67/29  |  -  |  10.210.226.65  |  -  |  -  |  -  |
| Vlan30 |  IT  |  10.210.241.67/29  |  -  |  10.210.241.65  |  -  |  -  |  -  |
| Vlan40 |  IoT  |  10.210.241.75/29  |  -  |  10.210.241.73  |  -  |  -  |  -  |
| Vlan110 |  OT  |  100.100.110.3/29  |  -  |  100.100.110.1  |  -  |  -  |  -  |
| Vlan310 |  IT  |  100.100.130.3/29  |  -  |  100.100.130.1  |  -  |  -  |  -  |
| Vlan4089 |  IoT  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4090 |  IT  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4091 |  IT-DC  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4092 |  OT  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.3/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan10
   description WANFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 10.210.249.67/29
   ip virtual-router address 10.210.249.65
!
interface Vlan20
   description WANFW-TRANSIT-IT-DCVRF
   no shutdown
   vrf IT-DC
   ip address 10.210.226.67/29
   ip virtual-router address 10.210.226.65
!
interface Vlan30
   description WANFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 10.210.241.67/29
   ip virtual-router address 10.210.241.65
!
interface Vlan40
   description IoTFW-TRANSIT-IoTVRF
   no shutdown
   vrf IoT
   ip address 10.210.241.75/29
   ip virtual-router address 10.210.241.73
!
interface Vlan110
   description VENDORFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 100.100.110.3/29
   ip virtual-router address 100.100.110.1
!
interface Vlan310
   description SCADAFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 100.100.130.3/29
   ip virtual-router address 100.100.130.1
!
interface Vlan4089
   description MLAG_PEER_L3_iBGP: vrf IoT
   no shutdown
   mtu 9214
   vrf IoT
   ip address 192.168.0.5/31
!
interface Vlan4090
   description MLAG_PEER_L3_iBGP: vrf IT
   no shutdown
   mtu 9214
   vrf IT
   ip address 192.168.0.5/31
!
interface Vlan4091
   description MLAG_PEER_L3_iBGP: vrf IT-DC
   no shutdown
   mtu 9214
   vrf IT-DC
   ip address 192.168.0.5/31
!
interface Vlan4092
   description MLAG_PEER_L3_iBGP: vrf OT
   no shutdown
   mtu 9214
   vrf OT
   ip address 192.168.0.5/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   no shutdown
   mtu 9214
   ip address 192.168.0.3/31
!
interface Vlan4094
   description MLAG_PEER
   no shutdown
   mtu 9214
   no autostate
   ip address 192.168.0.1/31
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### Virtual Router MAC Address

#### Virtual Router MAC Address Summary

Virtual Router MAC Address: 00:aa:aa:aa:aa:aa

#### Virtual Router MAC Address Device Configuration

```eos
!
ip virtual-router mac-address 00:aa:aa:aa:aa:aa
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| IoT | True |
| IT | True |
| IT-DC | True |
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf IoT
ip routing vrf IT
ip routing vrf IT-DC
no ip routing vrf mgmt
ip routing vrf OT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| IoT | false |
| IT | false |
| IT-DC | false |
| mgmt | false |
| OT | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| mgmt | 0.0.0.0/0 | 10.210.80.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.210.80.1
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.1 | 172.21.0.26 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| timers bgp 5 15 |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### DC1-BLLF-EBGP-PEERS-IT-DCVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.11200 |
| Maximum routes | 0 (no limit) |

##### DC1-BLLF-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.11200 |
| Maximum routes | 0 (no limit) |

##### DC2-BLLF-EBGP-PEERS-IT-DCVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.12200 |
| Maximum routes | 0 (no limit) |

##### DC2-BLLF-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.12200 |
| Maximum routes | 0 (no limit) |

##### IoTFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.98 |
| Maximum routes | 0 (no limit) |

##### IT-BLLF-EBGP-PEERS-IoTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.31200 |
| Maximum routes | 0 (no limit) |

##### IT-BLLF-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.31200 |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Maximum routes | 0 (no limit) |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.1 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

##### SCADAFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.60 |
| Maximum routes | 0 (no limit) |

##### VENDORFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.48 |
| Maximum routes | 0 (no limit) |

##### WANFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.40 |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 192.168.0.2 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IoT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.10 | Inherited from peer group IT-BLLF-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-IoTVRF | - | - | - | - | - |
| 10.210.241.14 | Inherited from peer group IT-BLLF-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-IoTVRF | - | - | - | - | - |
| 10.210.241.78 | Inherited from peer group WANFW-EBGP-PEERS | IoT | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.2 | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.6 | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.18 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.22 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.70 | Inherited from peer group WANFW-EBGP-PEERS | IT | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 100.100.130.4 | Inherited from peer group SCADAFW-EBGP-PEERS | IT | - | - | Inherited from peer group SCADAFW-EBGP-PEERS | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT-DC | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.226.28 | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.226.30 | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.226.70 | Inherited from peer group WANFW-EBGP-PEERS | IT-DC | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 10.210.234.20 | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.234.22 | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | OT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.226.2 | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.226.6 | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.234.2 | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.234.6 | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.241.28 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.241.32 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.249.67 | Inherited from peer group WANFW-EBGP-PEERS | OT | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 100.100.110.4 | Inherited from peer group VENDORFW-EBGP-PEERS | OT | - | - | Inherited from peer group VENDORFW-EBGP-PEERS | - | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IoT | - | connected |
| IT | - | connected |
| IT-DC | - | connected |
| OT | - | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.1
   router-id 172.21.0.26
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   timers bgp 5 15
   neighbor DC1-BLLF-EBGP-PEERS-IT-DCVRF peer group
   neighbor DC1-BLLF-EBGP-PEERS-IT-DCVRF remote-as 65120.11200
   neighbor DC1-BLLF-EBGP-PEERS-IT-DCVRF password 7 <removed>
   neighbor DC1-BLLF-EBGP-PEERS-IT-DCVRF maximum-routes 0
   neighbor DC1-BLLF-EBGP-PEERS-OTVRF peer group
   neighbor DC1-BLLF-EBGP-PEERS-OTVRF remote-as 65120.11200
   neighbor DC1-BLLF-EBGP-PEERS-OTVRF password 7 <removed>
   neighbor DC1-BLLF-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor DC2-BLLF-EBGP-PEERS-IT-DCVRF peer group
   neighbor DC2-BLLF-EBGP-PEERS-IT-DCVRF remote-as 65120.12200
   neighbor DC2-BLLF-EBGP-PEERS-IT-DCVRF password 7 <removed>
   neighbor DC2-BLLF-EBGP-PEERS-IT-DCVRF maximum-routes 0
   neighbor DC2-BLLF-EBGP-PEERS-OTVRF peer group
   neighbor DC2-BLLF-EBGP-PEERS-OTVRF remote-as 65120.12200
   neighbor DC2-BLLF-EBGP-PEERS-OTVRF password 7 <removed>
   neighbor DC2-BLLF-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor IoTFW-EBGP-PEERS peer group
   neighbor IoTFW-EBGP-PEERS remote-as 65120.98
   neighbor IoTFW-EBGP-PEERS password 7 <removed>
   neighbor IoTFW-EBGP-PEERS maximum-routes 0
   neighbor IT-BLLF-EBGP-PEERS-IoTVRF peer group
   neighbor IT-BLLF-EBGP-PEERS-IoTVRF remote-as 65120.31200
   neighbor IT-BLLF-EBGP-PEERS-IoTVRF password 7 <removed>
   neighbor IT-BLLF-EBGP-PEERS-IoTVRF maximum-routes 0
   neighbor IT-BLLF-EBGP-PEERS-ITVRF peer group
   neighbor IT-BLLF-EBGP-PEERS-ITVRF remote-as 65120.31200
   neighbor IT-BLLF-EBGP-PEERS-ITVRF password 7 <removed>
   neighbor IT-BLLF-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-ITVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-ITVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-ITVRF password 7 <removed>
   neighbor MISC-CORES-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-OTVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-OTVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-OTVRF password 7 <removed>
   neighbor MISC-CORES-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.1
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ISMCR01A
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor SCADAFW-EBGP-PEERS peer group
   neighbor SCADAFW-EBGP-PEERS remote-as 65120.60
   neighbor SCADAFW-EBGP-PEERS password 7 <removed>
   neighbor SCADAFW-EBGP-PEERS maximum-routes 0
   neighbor VENDORFW-EBGP-PEERS peer group
   neighbor VENDORFW-EBGP-PEERS remote-as 65120.48
   neighbor VENDORFW-EBGP-PEERS password 7 <removed>
   neighbor VENDORFW-EBGP-PEERS maximum-routes 0
   neighbor WANFW-EBGP-PEERS peer group
   neighbor WANFW-EBGP-PEERS remote-as 65120.40
   neighbor WANFW-EBGP-PEERS password 7 <removed>
   neighbor WANFW-EBGP-PEERS send-community
   neighbor WANFW-EBGP-PEERS maximum-routes 0
   neighbor 192.168.0.2 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.2 description ISMCR01A
   redistribute connected
   !
   address-family ipv4
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
      neighbor WANFW-EBGP-PEERS activate
   !
   vrf IoT
      router-id 172.21.0.26
      update wait-install
      neighbor 10.210.241.10 peer group IT-BLLF-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.10 description ISMS1ITBL01A-Eth2/1-IoTVRF
      neighbor 10.210.241.14 peer group IT-BLLF-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.14 description ISMS1ITBL02A-Eth2/1-IoTVRF
      neighbor 10.210.241.78 peer group WANFW-EBGP-PEERS
      neighbor 10.210.241.78 description WANFW-VIP-IoTVRF
      neighbor 10.210.241.78 route-map RM-IoT-10.210.241.78-SET-NEXT-HOP-OUT out
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.10 activate
         neighbor 10.210.241.14 activate
         neighbor 10.210.241.78 activate
   !
   vrf IT
      router-id 172.21.0.26
      update wait-install
      neighbor 10.210.241.2 peer group IT-BLLF-EBGP-PEERS-ITVRF
      neighbor 10.210.241.2 description ISMS1ITBL01A-Eth2/1-ITVRF
      neighbor 10.210.241.6 peer group IT-BLLF-EBGP-PEERS-ITVRF
      neighbor 10.210.241.6 description ISMS1ITBL02A-Eth2/1-ITVRF
      neighbor 10.210.241.18 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.18 description ISMITMSC01A-Eth50/1-ITVRF
      neighbor 10.210.241.22 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.22 description ISMITMSC02A-Eth50/1-ITVRF
      neighbor 10.210.241.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.241.70 description WANFW-IP-ITVRF
      neighbor 10.210.241.70 route-map RM-IT-10.210.241.70-SET-NEXT-HOP-OUT out
      neighbor 100.100.130.4 peer group SCADAFW-EBGP-PEERS
      neighbor 100.100.130.4 description SCADAFW-IP-ITVRF
      neighbor 100.100.130.4 route-map RM-IT-100.100.130.4-SET-NEXT-HOP-OUT out
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.2 activate
         neighbor 10.210.241.6 activate
         neighbor 10.210.241.18 activate
         neighbor 10.210.241.22 activate
         neighbor 10.210.241.70 activate
         neighbor 100.100.130.4 activate
   !
   vrf IT-DC
      router-id 172.21.0.26
      update wait-install
      neighbor 10.210.226.28 peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.28 description DC1-BL1-Eth2/1-IT-DCVRF
      neighbor 10.210.226.30 peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.30 description DC1-BL2-Eth2/1-IT-DCVRF
      neighbor 10.210.226.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.226.70 description WANFW-IP-IT-DCVRF
      neighbor 10.210.226.70 route-map RM-IT-DC-10.210.226.70-SET-NEXT-HOP-OUT out
      neighbor 10.210.234.20 peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.20 description DC2-BL1-Eth2/1-IT-DCVRF
      neighbor 10.210.234.22 peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.22 description DC2-BL2-Eth2/1-IT-DCVRF
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.226.28 activate
         neighbor 10.210.226.30 activate
         neighbor 10.210.226.70 activate
         neighbor 10.210.234.20 activate
         neighbor 10.210.234.22 activate
   !
   vrf OT
      router-id 172.21.0.26
      update wait-install
      neighbor 10.210.226.2 peer group DC1-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.226.2 description DC1-BL1-OTVRF
      neighbor 10.210.226.6 peer group DC1-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.226.6 description DC1-BL2-OTVRF
      neighbor 10.210.234.2 peer group DC2-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.234.2 description DC2-BL1-OTVRF
      neighbor 10.210.234.6 peer group DC2-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.234.6 description DC2-BL2-OTVRF
      neighbor 10.210.241.28 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.28 description ISMITMSC01A-Eth50/1-OTVRF
      neighbor 10.210.241.32 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.32 description ISMITMSC02A-Eth50/1-OTVRF
      neighbor 10.210.249.67 peer group WANFW-EBGP-PEERS
      neighbor 10.210.249.67 description WANFW-IP-OTVRF
      neighbor 10.210.249.67 route-map RM-OT-10.210.249.67-SET-NEXT-HOP-OUT out
      neighbor 100.100.110.4 peer group VENDORFW-EBGP-PEERS
      neighbor 100.100.110.4 description VENDORFW-IP-OTVRF
      neighbor 100.100.110.4 route-map RM-OT-100.100.110.4-SET-NEXT-HOP-OUT out
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.226.2 activate
         neighbor 10.210.226.6 activate
         neighbor 10.210.234.2 activate
         neighbor 10.210.234.6 activate
         neighbor 10.210.241.28 activate
         neighbor 10.210.241.32 activate
         neighbor 10.210.249.67 activate
         neighbor 100.100.110.4 activate
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## Filters

### Route-maps

#### Route-maps Summary

##### RM-IoT-10.210.241.78-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.73 | - | - |

##### RM-IT-10.210.241.70-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.65 | - | - |

##### RM-IT-100.100.130.4-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 100.100.130.1 | - | - |

##### RM-IT-DC-10.210.226.70-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.226.65 | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

##### RM-OT-10.210.249.67-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.249.65 | - | - |

##### RM-OT-100.100.110.4-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 100.100.110.1 | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-IoT-10.210.241.78-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.73
!
route-map RM-IT-10.210.241.70-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.65
!
route-map RM-IT-100.100.130.4-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 100.100.130.1
!
route-map RM-IT-DC-10.210.226.70-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.226.65
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
!
route-map RM-OT-10.210.249.67-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.249.65
!
route-map RM-OT-100.100.110.4-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 100.100.110.1
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| IoT | enabled |
| IT | enabled |
| IT-DC | enabled |
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance IoT
!
vrf instance IT
!
vrf instance IT-DC
!
vrf instance mgmt
!
vrf instance OT
```
