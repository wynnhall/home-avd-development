# ISMITMSC01A

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
| Management1 | oob_management | oob | mgmt | 10.210.80.74/21 | 10.210.80.1 |

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
   ip address 10.210.80.74/21
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
| MISC_CORES | Vlan4094 | 192.168.0.1 | Port-Channel551 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id MISC_CORES
   local-interface Vlan4094
   peer-address 192.168.0.1
   peer-link Port-Channel551
   reload-delay mlag 300
   reload-delay non-mlag 330
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
| 4090 | MLAG_iBGP_IT | LEAF_PEER_L3 |
| 4092 | MLAG_iBGP_OT | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 4090
   name MLAG_iBGP_IT
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
| Ethernet55/1 | MLAG_PEER_ISMITMSC02A_Ethernet55/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 551 |
| Ethernet56/1 | MLAG_PEER_ISMITMSC02A_Ethernet56/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 551 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet49/1.100 | ISMCR01A-Eth3/4/1-OTVRF | l3dot1q | - | 100 |
| Ethernet49/1.130 | ISMCR01A-Eth3/4/1-ITVRF | l3dot1q | - | 130 |
| Ethernet50/1.100 | ISMCR02A-Eth3/4/1-OTVRF | l3dot1q | - | 100 |
| Ethernet50/1.130 | ISMCR02A-Eth3/4/1-ITVRF | l3dot1q | - | 130 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet49/1.100 | ISMCR01A-Eth3/4/1-OTVRF | l3dot1q | - | 10.210.241.25/31 | OT | - | False | - | - |
| Ethernet49/1.130 | ISMCR01A-Eth3/4/1-ITVRF | l3dot1q | - | 10.210.241.17/31 | IT | - | False | - | - |
| Ethernet50/1.100 | ISMCR02A-Eth3/4/1-OTVRF | l3dot1q | - | 10.210.241.27/31 | OT | - | False | - | - |
| Ethernet50/1.130 | ISMCR02A-Eth3/4/1-ITVRF | l3dot1q | - | 10.210.241.19/31 | IT | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet49/1
   no shutdown
   no switchport
!
interface Ethernet49/1.100
   description ISMCR01A-Eth3/4/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.241.25/31
!
interface Ethernet49/1.130
   description ISMCR01A-Eth3/4/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 130
   vrf IT
   ip address 10.210.241.17/31
!
interface Ethernet50/1
   no shutdown
   no switchport
!
interface Ethernet50/1.100
   description ISMCR02A-Eth3/4/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 100
   vrf OT
   ip address 10.210.241.27/31
!
interface Ethernet50/1.130
   description ISMCR02A-Eth3/4/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 130
   vrf IT
   ip address 10.210.241.19/31
!
interface Ethernet55/1
   description MLAG_PEER_ISMITMSC02A_Ethernet55/1
   no shutdown
   speed 100g
   channel-group 551 mode active
!
interface Ethernet56/1
   description MLAG_PEER_ISMITMSC02A_Ethernet56/1
   no shutdown
   speed 100g
   channel-group 551 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel551 | MLAG_PEER_ISMITMSC02A_Po551 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel551
   description MLAG_PEER_ISMITMSC02A_Po551
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
| Loopback0 | Router_ID | default | 172.21.1.29/32 |

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
   ip address 172.21.1.29/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan4090 | MLAG_PEER_L3_iBGP: vrf IT | IT | 9214 | False |
| Vlan4092 | MLAG_PEER_L3_iBGP: vrf OT | OT | 9214 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan4090 |  IT  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4092 |  OT  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.2/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.0/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan4090
   description MLAG_PEER_L3_iBGP: vrf IT
   no shutdown
   mtu 9214
   vrf IT
   ip address 192.168.0.4/31
!
interface Vlan4092
   description MLAG_PEER_L3_iBGP: vrf OT
   no shutdown
   mtu 9214
   vrf OT
   ip address 192.168.0.4/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   no shutdown
   mtu 9214
   ip address 192.168.0.2/31
!
interface Vlan4094
   description MLAG_PEER
   no shutdown
   mtu 9214
   no autostate
   ip address 192.168.0.0/31
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
| IT | True |
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf IT
no ip routing vrf mgmt
ip routing vrf OT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| IT | false |
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
| 65120.10 | 172.21.1.29 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| timers bgp 5 15 |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### CAMPUS-CORES-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CAMPUS-CORES-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.1 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.10 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 192.168.0.3 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.18 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.20 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | OT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.25 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | OT | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.241.27 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | OT | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IT | - | connected |
| OT | - | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.10
   router-id 172.21.1.29
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   timers bgp 5 15
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF password 7 <removed>
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF password 7 <removed>
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF send-community
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.10
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ISMITMSC02A
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor 192.168.0.3 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.3 description ISMITMSC02A
   redistribute connected
   !
   address-family ipv4
      neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF activate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf IT
      router-id 172.21.1.29
      update wait-install
      neighbor 10.210.241.18 peer group CAMPUS-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.18 description ISMCR01A-Eth3/4/1-ITVRF
      neighbor 10.210.241.20 peer group CAMPUS-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.20 description ISMCR02A-Eth3/4/1-ITVRF
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.18 activate
         neighbor 10.210.241.20 activate
   !
   vrf OT
      router-id 172.21.1.29
      update wait-install
      neighbor 10.210.241.25 peer group CAMPUS-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.25 description ISMCR01A-Eth3/4/1-OTVRF
      neighbor 10.210.241.27 peer group CAMPUS-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.27 description ISMCR02A-Eth3/4/1-OTVRF
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.25 activate
         neighbor 10.210.241.27 activate
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

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| IT | enabled |
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance IT
!
vrf instance mgmt
!
vrf instance OT
```
