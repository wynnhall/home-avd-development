# ISMS1ITBL01A

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
  - [VXLAN Interface](#vxlan-interface)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
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
| Management1 | oob_management | oob | mgmt | 10.210.80.63/21 | 10.210.80.63 |

##### IPv6

| Management Interface | Description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | mgmt | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   no shutdown
   vrf mgmt
   ip address 10.210.80.63/21
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
| MLAG | Vlan4094 | 192.168.0.1 | Port-Channel4094 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id MLAG
   local-interface Vlan4094
   peer-address 192.168.0.1
   peer-link Port-Channel4094
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
| 221 | 10.211.0.0/23_SM1-UtilityYards | - |
| 224 | 10.211.3.0/23_SM1-AV | - |
| 225 | 10.211.4.0/23_SM1-Security | - |
| 227 | 10.211.6.0/23_SM1-BMS | - |
| 237 | 10.211.16.0/20_SM1-Wired-LAN | - |
| 243 | 10.215.18.0/24_S0-AV | - |
| 245 | 10.215.20.0/24_S0-Security | - |
| 247 | 10.215.22.0/24_S0-BMS | - |
| 250 | 10.215.0.0/20_S0-Wired-LAN | - |
| 305 | 10.215.80.0/24_SM-AV | - |
| 307 | 10.215.82.0/24_SM-Security | - |
| 309 | 10.215.84.0/24_SM-BMS | - |
| 337 | 10.215.64.0/20_SM-Wired-LAN | - |
| 951 | 10.70.32.0/24_SM-GuestNet(Wired) | - |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 221
   name 10.211.0.0/23_SM1-UtilityYards
!
vlan 224
   name 10.211.3.0/23_SM1-AV
!
vlan 225
   name 10.211.4.0/23_SM1-Security
!
vlan 227
   name 10.211.6.0/23_SM1-BMS
!
vlan 237
   name 10.211.16.0/20_SM1-Wired-LAN
!
vlan 243
   name 10.215.18.0/24_S0-AV
!
vlan 245
   name 10.215.20.0/24_S0-Security
!
vlan 247
   name 10.215.22.0/24_S0-BMS
!
vlan 250
   name 10.215.0.0/20_S0-Wired-LAN
!
vlan 305
   name 10.215.80.0/24_SM-AV
!
vlan 307
   name 10.215.82.0/24_SM-Security
!
vlan 309
   name 10.215.84.0/24_SM-BMS
!
vlan 337
   name 10.215.64.0/20_SM-Wired-LAN
!
vlan 951
   name 10.70.32.0/24_SM-GuestNet(Wired)
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
| Ethernet31/1 | [L]_MLAG_PEER_ISMS1ITBL02A_Ethernet31/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet32/1 | [L]_MLAG_PEER_ISMS1ITBL02A_Ethernet32/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet1/1.525 | [L]_ISMCR01A-Eth3/3/1-IT-VRF | l3dot1q | - | 525 |
| Ethernet1/1.633 | [L]_ISMCR01A-Eth3/3/1-IoTVRF | l3dot1q | - | 633 |
| Ethernet2/1.525 | [L]_ISMCR02A-Eth3/3/1-IT-VRF | l3dot1q | - | 525 |
| Ethernet2/1.633 | [L]_ISMCR02A-Eth3/3/1-IoTVRF | l3dot1q | - | 633 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1/1.525 | [L]_ISMCR01A-Eth3/3/1-IT-VRF | l3dot1q | - | 10.210.241.1/31 | IT | - | False | - | - |
| Ethernet1/1.633 | [L]_ISMCR01A-Eth3/3/1-IoTVRF | l3dot1q | - | 10.210.241.9/31 | IoT | - | False | - | - |
| Ethernet2/1.525 | [L]_ISMCR02A-Eth3/3/1-IT-VRF | l3dot1q | - | 10.210.241.5/31 | IT | - | False | - | - |
| Ethernet2/1.633 | [L]_ISMCR02A-Eth3/3/1-IoTVRF | l3dot1q | - | 10.210.241.13/31 | IoT | - | False | - | - |

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet25/1 | [L]_P2P_LINK_TO_ISMS1ITSP01A_Ethernet3/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet26/1 | [L]_P2P_LINK_TO_ISMS1ITSP02A_Ethernet3/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet27/1 | [L]_P2P_LINK_TO_ISMS1ITSP03A_Ethernet3/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/1
   no shutdown
   no switchport
!
interface Ethernet1/1.525
   description [L]_ISMCR01A-Eth3/3/1-IT-VRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.1/31
!
interface Ethernet1/1.633
   description [L]_ISMCR01A-Eth3/3/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.9/31
!
interface Ethernet2/1
   no shutdown
   no switchport
!
interface Ethernet2/1.525
   description [L]_ISMCR02A-Eth3/3/1-IT-VRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.5/31
!
interface Ethernet2/1.633
   description [L]_ISMCR02A-Eth3/3/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.13/31
!
interface Ethernet25/1
   description [L]_P2P_LINK_TO_ISMS1ITSP01A_Ethernet3/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet26/1
   description [L]_P2P_LINK_TO_ISMS1ITSP02A_Ethernet3/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet27/1
   description [L]_P2P_LINK_TO_ISMS1ITSP03A_Ethernet3/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet31/1
   description [L]_MLAG_PEER_ISMS1ITBL02A_Ethernet31/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet32/1
   description [L]_MLAG_PEER_ISMS1ITBL02A_Ethernet32/1
   no shutdown
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel4094 | [L]_MLAG_PEER_ISMS1ITBL02A_Po311 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ISMS1ITBL02A_Po311
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
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.2.4/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.210.240.4/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 172.21.2.4/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.210.240.4/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan221 | 10.211.0.0/23_SM1-UtilityYards | IT | - | False |
| Vlan224 | 10.211.3.0/23_SM1-AV | IoT | - | False |
| Vlan225 | 10.211.4.0/23_SM1-Security | IoT | - | False |
| Vlan227 | 10.211.6.0/23_SM1-BMS | IoT | - | False |
| Vlan237 | 10.211.16.0/20_SM1-Wired-LAN | IT | - | False |
| Vlan243 | 10.215.18.0/24_S0-AV | IoT | - | False |
| Vlan245 | 10.215.20.0/24_S0-Security | IoT | - | False |
| Vlan247 | 10.215.22.0/24_S0-BMS | IoT | - | False |
| Vlan250 | 10.215.0.0/20_S0-Wired-LAN | IT | - | False |
| Vlan305 | 10.215.80.0/24_SM-AV | IoT | - | False |
| Vlan307 | 10.215.82.0/24_SM-Security | IoT | - | False |
| Vlan309 | 10.215.84.0/24_SM-BMS | IoT | - | False |
| Vlan337 | 10.215.64.0/20_SM-Wired-LAN | IT | - | False |
| Vlan951 | 10.70.32.0/24_SM-GuestNet(Wired) | IT | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan221 |  IT  |  -  |  10.211.0.1/23  |  -  |  -  |  -  |  -  |
| Vlan224 |  IoT  |  -  |  10.211.3.1/23  |  -  |  -  |  -  |  -  |
| Vlan225 |  IoT  |  -  |  10.211.4.1/23  |  -  |  -  |  -  |  -  |
| Vlan227 |  IoT  |  -  |  10.211.6.1/23  |  -  |  -  |  -  |  -  |
| Vlan237 |  IT  |  -  |  10.211.16.1/20  |  -  |  -  |  -  |  -  |
| Vlan243 |  IoT  |  -  |  10.215.18.1/24  |  -  |  -  |  -  |  -  |
| Vlan245 |  IoT  |  -  |  10.215.20.1/24  |  -  |  -  |  -  |  -  |
| Vlan247 |  IoT  |  -  |  10.215.22.1/24  |  -  |  -  |  -  |  -  |
| Vlan250 |  IT  |  -  |  10.215.0.1/20  |  -  |  -  |  -  |  -  |
| Vlan305 |  IoT  |  -  |  10.215.80.1/24  |  -  |  -  |  -  |  -  |
| Vlan307 |  IoT  |  -  |  10.215.82.1/24  |  -  |  -  |  -  |  -  |
| Vlan309 |  IoT  |  -  |  10.215.84.1/24  |  -  |  -  |  -  |  -  |
| Vlan337 |  IT  |  -  |  10.215.64.1/20  |  -  |  -  |  -  |  -  |
| Vlan951 |  IT  |  -  |  10.70.32.1/24  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  -  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.0/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan221
   description 10.211.0.0/23_SM1-UtilityYards
   no shutdown
   vrf IT
   ip address virtual 10.211.0.1/23
!
interface Vlan224
   description 10.211.3.0/23_SM1-AV
   no shutdown
   vrf IoT
   ip address virtual 10.211.3.1/23
!
interface Vlan225
   description 10.211.4.0/23_SM1-Security
   no shutdown
   vrf IoT
   ip address virtual 10.211.4.1/23
!
interface Vlan227
   description 10.211.6.0/23_SM1-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.211.6.1/23
!
interface Vlan237
   description 10.211.16.0/20_SM1-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.211.16.1/20
!
interface Vlan243
   description 10.215.18.0/24_S0-AV
   no shutdown
   vrf IoT
   ip address virtual 10.215.18.1/24
!
interface Vlan245
   description 10.215.20.0/24_S0-Security
   no shutdown
   vrf IoT
   ip address virtual 10.215.20.1/24
!
interface Vlan247
   description 10.215.22.0/24_S0-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.215.22.1/24
!
interface Vlan250
   description 10.215.0.0/20_S0-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.215.0.1/20
!
interface Vlan305
   description 10.215.80.0/24_SM-AV
   no shutdown
   vrf IoT
   ip address virtual 10.215.80.1/24
!
interface Vlan307
   description 10.215.82.0/24_SM-Security
   no shutdown
   vrf IoT
   ip address virtual 10.215.82.1/24
!
interface Vlan309
   description 10.215.84.0/24_SM-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.215.84.1/24
!
interface Vlan337
   description 10.215.64.0/20_SM-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.215.64.1/20
!
interface Vlan951
   description 10.70.32.0/24_SM-GuestNet(Wired)
   no shutdown
   vrf IT
   ip address virtual 10.70.32.1/24
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   no shutdown
   mtu 9214
   ipv6 enable
!
interface Vlan4094
   description MLAG_PEER
   no shutdown
   mtu 9214
   no autostate
   ip address 192.168.0.0/31
```

### VXLAN Interface

#### VXLAN Interface Summary

| Setting | Value |
| ------- | ----- |
| Source Interface | Loopback1 |
| UDP port | 4789 |
| EVPN MLAG Shared Router MAC | mlag-system-id |

##### VLAN to VNI, Flood List and Multicast Group Mappings

| VLAN | VNI | Flood List | Multicast Group |
| ---- | --- | ---------- | --------------- |
| 221 | 10221 | - | - |
| 224 | 10224 | - | - |
| 225 | 10225 | - | - |
| 227 | 10227 | - | - |
| 237 | 10237 | - | - |
| 243 | 10243 | - | - |
| 245 | 10245 | - | - |
| 247 | 10247 | - | - |
| 250 | 10250 | - | - |
| 305 | 10305 | - | - |
| 307 | 10307 | - | - |
| 309 | 10309 | - | - |
| 337 | 10337 | - | - |
| 951 | 10951 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| IoT | 5004 | - |
| IT | 5003 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description ISMS1ITBL01A_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 221 vni 10221
   vxlan vlan 224 vni 10224
   vxlan vlan 225 vni 10225
   vxlan vlan 227 vni 10227
   vxlan vlan 237 vni 10237
   vxlan vlan 243 vni 10243
   vxlan vlan 245 vni 10245
   vxlan vlan 247 vni 10247
   vxlan vlan 250 vni 10250
   vxlan vlan 305 vni 10305
   vxlan vlan 307 vni 10307
   vxlan vlan 309 vni 10309
   vxlan vlan 337 vni 10337
   vxlan vlan 951 vni 10951
   vxlan vrf IoT vni 5004
   vxlan vrf IT vni 5003
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
| default | True (ipv6 interfaces) |
| IoT | True |
| IT | True |
| mgmt | False |

#### IP Routing Device Configuration

```eos
!
ip routing ipv6 interfaces
ip routing vrf IoT
ip routing vrf IT
no ip routing vrf mgmt
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| IoT | false |
| IT | false |
| mgmt | false |

#### IPv6 Routing Device Configuration

```eos
!
ipv6 unicast-routing
```

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| mgmt | 0.0.0.0/0 | 10.210.80.63 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.210.80.63
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.31200 | 172.21.2.4 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| distance bgp 20 200 200 |
| timers bgp 5 15 |
| graceful-restart restart-time 300 |
| graceful-restart |
| neighbor default send-community |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 128 ecmp 128 |

#### Router BGP Peer Groups

##### CORES-EBGP-PEERS-IoTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CORES-EBGP-PEERS-IT-VRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 3 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Send community | all |
| Maximum routes | 12000 |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.31200 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.2.1 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.2 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.3 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 10.210.241.8 | Inherited from peer group CORES-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group CORES-EBGP-PEERS-IoTVRF | - | - | - | - | - |
| 10.210.241.12 | Inherited from peer group CORES-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group CORES-EBGP-PEERS-IoTVRF | - | - | - | - | - |
| 10.210.241.0 | Inherited from peer group CORES-EBGP-PEERS-IT-VRF | IT | - | - | Inherited from peer group CORES-EBGP-PEERS-IT-VRF | - | - | - | - | - |
| 10.210.241.4 | Inherited from peer group CORES-EBGP-PEERS-IT-VRF | IT | - | - | Inherited from peer group CORES-EBGP-PEERS-IT-VRF | - | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet25/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |
| Ethernet26/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |
| Ethernet27/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |
| Vlan4093 | default | MLAG-IPv4-UNDERLAY-PEER | 65120.31200 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 221 | 172.21.2.4:10221 | 10221:10221 | - | - | learned |
| 224 | 172.21.2.4:10224 | 10224:10224 | - | - | learned |
| 225 | 172.21.2.4:10225 | 10225:10225 | - | - | learned |
| 227 | 172.21.2.4:10227 | 10227:10227 | - | - | learned |
| 237 | 172.21.2.4:10237 | 10237:10237 | - | - | learned |
| 243 | 172.21.2.4:10243 | 10243:10243 | - | - | learned |
| 245 | 172.21.2.4:10245 | 10245:10245 | - | - | learned |
| 247 | 172.21.2.4:10247 | 10247:10247 | - | - | learned |
| 250 | 172.21.2.4:10250 | 10250:10250 | - | - | learned |
| 305 | 172.21.2.4:10305 | 10305:10305 | - | - | learned |
| 307 | 172.21.2.4:10307 | 10307:10307 | - | - | learned |
| 309 | 172.21.2.4:10309 | 10309:10309 | - | - | learned |
| 337 | 172.21.2.4:10337 | 10337:10337 | - | - | learned |
| 951 | 172.21.2.4:10951 | 10951:10951 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IoT | 172.21.2.4:5004 | connected |
| IT | 172.21.2.4:5003 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.31200
   router-id 172.21.2.4
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   distance bgp 20 200 200
   timers bgp 5 15
   graceful-restart restart-time 300
   graceful-restart
   neighbor default send-community
   neighbor CORES-EBGP-PEERS-IoTVRF peer group
   neighbor CORES-EBGP-PEERS-IoTVRF remote-as 65120.1
   neighbor CORES-EBGP-PEERS-IoTVRF password 7 <removed>
   neighbor CORES-EBGP-PEERS-IoTVRF maximum-routes 0
   neighbor CORES-EBGP-PEERS-IT-VRF peer group
   neighbor CORES-EBGP-PEERS-IT-VRF remote-as 65120.1
   neighbor CORES-EBGP-PEERS-IT-VRF password 7 <removed>
   neighbor CORES-EBGP-PEERS-IT-VRF maximum-routes 0
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS password 7 <removed>
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS password 7 <removed>
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.31200
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ISMS1ITBL02A
   neighbor MLAG-IPv4-UNDERLAY-PEER password 7 <removed>
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor interface Ethernet25/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
   neighbor interface Ethernet26/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
   neighbor interface Ethernet27/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
   neighbor interface Vlan4093 peer-group MLAG-IPv4-UNDERLAY-PEER remote-as 65120.31200
   neighbor 172.21.2.1 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.1 remote-as 65120.31100
   neighbor 172.21.2.1 description ISMS1ITSP01A
   neighbor 172.21.2.2 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.2 remote-as 65120.31100
   neighbor 172.21.2.2 description ISMS1ITSP02A
   neighbor 172.21.2.3 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.3 remote-as 65120.31100
   neighbor 172.21.2.3 description ISMS1ITSP03A
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 221
      rd 172.21.2.4:10221
      route-target both 10221:10221
      redistribute learned
   !
   vlan 224
      rd 172.21.2.4:10224
      route-target both 10224:10224
      redistribute learned
   !
   vlan 225
      rd 172.21.2.4:10225
      route-target both 10225:10225
      redistribute learned
   !
   vlan 227
      rd 172.21.2.4:10227
      route-target both 10227:10227
      redistribute learned
   !
   vlan 237
      rd 172.21.2.4:10237
      route-target both 10237:10237
      redistribute learned
   !
   vlan 243
      rd 172.21.2.4:10243
      route-target both 10243:10243
      redistribute learned
   !
   vlan 245
      rd 172.21.2.4:10245
      route-target both 10245:10245
      redistribute learned
   !
   vlan 247
      rd 172.21.2.4:10247
      route-target both 10247:10247
      redistribute learned
   !
   vlan 250
      rd 172.21.2.4:10250
      route-target both 10250:10250
      redistribute learned
   !
   vlan 305
      rd 172.21.2.4:10305
      route-target both 10305:10305
      redistribute learned
   !
   vlan 307
      rd 172.21.2.4:10307
      route-target both 10307:10307
      redistribute learned
   !
   vlan 309
      rd 172.21.2.4:10309
      route-target both 10309:10309
      redistribute learned
   !
   vlan 337
      rd 172.21.2.4:10337
      route-target both 10337:10337
      redistribute learned
   !
   vlan 951
      rd 172.21.2.4:10951
      route-target both 10951:10951
      redistribute learned
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS next-hop address-family ipv6 originate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER next-hop address-family ipv6 originate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf IoT
      rd 172.21.2.4:5004
      route-target import evpn 5004:5004
      route-target export evpn 5004:5004
      router-id 172.21.2.4
      update wait-install
      neighbor 10.210.241.8 peer group CORES-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.8 description ISMCR01A-Eth3/3/1-IoTVRF
      neighbor 10.210.241.12 peer group CORES-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.12 description ISMCR02A-Eth3/3/1-IoTVRF
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.8 activate
         neighbor 10.210.241.12 activate
   !
   vrf IT
      rd 172.21.2.4:5003
      route-target import evpn 5003:5003
      route-target export evpn 5003:5003
      router-id 172.21.2.4
      update wait-install
      neighbor 10.210.241.0 peer group CORES-EBGP-PEERS-IT-VRF
      neighbor 10.210.241.0 description ISMCR01A-Eth3/3/1-IT-VRF
      neighbor 10.210.241.4 peer group CORES-EBGP-PEERS-IT-VRF
      neighbor 10.210.241.4 description ISMCR02A-Eth3/3/1-IT-VRF
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.0 activate
         neighbor 10.210.241.4 activate
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 300 | 300 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Disabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
!
no ip igmp snooping
```

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.2.0/24 eq 32 |
| 20 | permit 10.210.240.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.2.0/24 eq 32
   seq 20 permit 10.210.240.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| IoT | enabled |
| IT | enabled |
| mgmt | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance IoT
!
vrf instance IT
!
vrf instance mgmt
```
