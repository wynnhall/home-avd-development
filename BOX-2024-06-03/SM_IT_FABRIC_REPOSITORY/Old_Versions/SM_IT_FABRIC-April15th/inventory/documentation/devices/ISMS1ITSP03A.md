# ISMS1ITSP03A

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [Management API HTTP](#management-api-http)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
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
| Management0 | oob_management | oob | mgmt | 10.210.80.62/21 | 10.210.80.62 |

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
   ip address 10.210.80.62/21
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

## Spanning Tree

### Spanning Tree Summary

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
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

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |

*Inherited from Port-Channel Interface

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet3/1/1 | [L]_P2P_LINK_TO_ISMS1ITBL01A_Ethernet27/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/2/1 | [L]_P2P_LINK_TO_IS11CIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/3/1 | [L]_P2P_LINK_TO_IS11KEIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/4/1 | [L]_P2P_LINK_TO_ISM2WIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/5/1 | [L]_P2P_LINK_TO_IS00AIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/6/1 | [L]_P2P_LINK_TO_IS02AIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/1/1 | [L]_P2P_LINK_TO_ISMS1ITBL02A_Ethernet27/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/2/1 | [L]_P2P_LINK_TO_IS11AIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/3/1 | [L]_P2P_LINK_TO_IS11HEIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/4/1 | [L]_P2P_LINK_TO_ISM3XNIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/5/1 | [L]_P2P_LINK_TO_IS00BIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/6/1 | [L]_P2P_LINK_TO_IS02BIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/1/1 | [L]_P2P_LINK_TO_ISMITAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/2/1 | [L]_P2P_LINK_TO_IS11JWIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/3/1 | [L]_P2P_LINK_TO_IS11DEIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/4/1 | [L]_P2P_LINK_TO_ISM3XNIT02A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/5/1 | [L]_P2P_LINK_TO_IS00CIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/6/1 | [L]_P2P_LINK_TO_IS03AIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/1/1 | [L]_P2P_LINK_TO_ISMITAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/2/1 | [L]_P2P_LINK_TO_IS11GWIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/3/1 | [L]_P2P_LINK_TO_IS11BEIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/4/1 | [L]_P2P_LINK_TO_ISM3XSIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/5/1 | [L]_P2P_LINK_TO_IS01AIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/6/1 | [L]_P2P_LINK_TO_IS03BIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/1/1 | [L]_P2P_LINK_TO_IS11JIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/2/1 | [L]_P2P_LINK_TO_IS11EWIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/3/1 | [L]_P2P_LINK_TO_ISM0WIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/4/1 | [L]_P2P_LINK_TO_ISM3XSIT02A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/5/1 | [L]_P2P_LINK_TO_IS01BIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/6/1 | [L]_P2P_LINK_TO_ISM1YIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/1/1 | [L]_P2P_LINK_TO_IS11GIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/2/1 | [L]_P2P_LINK_TO_IS11CWIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/3/1 | [L]_P2P_LINK_TO_ISM1WIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/4/1 | [L]_P2P_LINK_TO_ISM3WIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/5/1 | [L]_P2P_LINK_TO_IS01CIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/6/1 | [L]_P2P_LINK_TO_ISM1VIT01A_Ethernet2/1/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3/1/1
   description [L]_P2P_LINK_TO_ISMS1ITBL01A_Ethernet27/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/2/1
   description [L]_P2P_LINK_TO_IS11CIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/3/1
   description [L]_P2P_LINK_TO_IS11KEIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/4/1
   description [L]_P2P_LINK_TO_ISM2WIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/5/1
   description [L]_P2P_LINK_TO_IS00AIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/6/1
   description [L]_P2P_LINK_TO_IS02AIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/1/1
   description [L]_P2P_LINK_TO_ISMS1ITBL02A_Ethernet27/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/2/1
   description [L]_P2P_LINK_TO_IS11AIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/3/1
   description [L]_P2P_LINK_TO_IS11HEIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/4/1
   description [L]_P2P_LINK_TO_ISM3XNIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/5/1
   description [L]_P2P_LINK_TO_IS00BIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/6/1
   description [L]_P2P_LINK_TO_IS02BIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/1/1
   description [L]_P2P_LINK_TO_ISMITAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/2/1
   description [L]_P2P_LINK_TO_IS11JWIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/3/1
   description [L]_P2P_LINK_TO_IS11DEIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/4/1
   description [L]_P2P_LINK_TO_ISM3XNIT02A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/5/1
   description [L]_P2P_LINK_TO_IS00CIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/6/1
   description [L]_P2P_LINK_TO_IS03AIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/1/1
   description [L]_P2P_LINK_TO_ISMITAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/2/1
   description [L]_P2P_LINK_TO_IS11GWIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/3/1
   description [L]_P2P_LINK_TO_IS11BEIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/4/1
   description [L]_P2P_LINK_TO_ISM3XSIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/5/1
   description [L]_P2P_LINK_TO_IS01AIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/6/1
   description [L]_P2P_LINK_TO_IS03BIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/1/1
   description [L]_P2P_LINK_TO_IS11JIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/2/1
   description [L]_P2P_LINK_TO_IS11EWIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/3/1
   description [L]_P2P_LINK_TO_ISM0WIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/4/1
   description [L]_P2P_LINK_TO_ISM3XSIT02A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/5/1
   description [L]_P2P_LINK_TO_IS01BIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/6/1
   description [L]_P2P_LINK_TO_ISM1YIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/1/1
   description [L]_P2P_LINK_TO_IS11GIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/2/1
   description [L]_P2P_LINK_TO_IS11CWIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/3/1
   description [L]_P2P_LINK_TO_ISM1WIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/4/1
   description [L]_P2P_LINK_TO_ISM3WIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/5/1
   description [L]_P2P_LINK_TO_IS01CIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/6/1
   description [L]_P2P_LINK_TO_ISM1VIT01A_Ethernet2/1/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.2.3/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 172.21.2.3/32
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True (ipv6 interfaces) |
| mgmt | False |

#### IP Routing Device Configuration

```eos
!
ip routing ipv6 interfaces
no ip routing vrf mgmt
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
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
| mgmt | 0.0.0.0/0 | 10.210.80.62 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.210.80.62
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.31100 | 172.21.2.3 |

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

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Next-hop unchanged | True |
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

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.2.4 | 65120.31200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.5 | 65120.31200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.6 | 65120.31201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.7 | 65120.31201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.8 | 65120.31301 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.9 | 65120.31302 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.10 | 65120.31303 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.11 | 65120.31304 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.12 | 65120.31305 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.13 | 65120.31306 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.14 | 65120.31307 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.15 | 65120.31308 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.16 | 65120.31309 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.17 | 65120.31310 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.18 | 65120.31311 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.19 | 65120.31312 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.20 | 65120.31313 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.21 | 65120.31314 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.22 | 65120.31315 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.23 | 65120.31316 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.24 | 65120.31317 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.25 | 65120.31318 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.26 | 65120.31319 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.27 | 65120.31320 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.28 | 65120.31321 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.29 | 65120.31322 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.30 | 65120.31323 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.31 | 65120.31324 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.32 | 65120.31325 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.33 | 65120.31326 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.34 | 65120.31327 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.35 | 65120.31328 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.36 | 65120.31329 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.37 | 65120.31330 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.38 | 65120.31331 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.39 | 65120.31332 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet3/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31200 | - |
| Ethernet3/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31303 | - |
| Ethernet3/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31309 | - |
| Ethernet3/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31315 | - |
| Ethernet3/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31321 | - |
| Ethernet3/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31327 | - |
| Ethernet4/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31200 | - |
| Ethernet4/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31304 | - |
| Ethernet4/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31310 | - |
| Ethernet4/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31316 | - |
| Ethernet4/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31322 | - |
| Ethernet4/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31328 | - |
| Ethernet5/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31201 | - |
| Ethernet5/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31305 | - |
| Ethernet5/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31311 | - |
| Ethernet5/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31317 | - |
| Ethernet5/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31323 | - |
| Ethernet5/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31329 | - |
| Ethernet6/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31201 | - |
| Ethernet6/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31306 | - |
| Ethernet6/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31312 | - |
| Ethernet6/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31318 | - |
| Ethernet6/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31324 | - |
| Ethernet6/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31330 | - |
| Ethernet7/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31301 | - |
| Ethernet7/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31307 | - |
| Ethernet7/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31313 | - |
| Ethernet7/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31319 | - |
| Ethernet7/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31325 | - |
| Ethernet7/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31331 | - |
| Ethernet8/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31302 | - |
| Ethernet8/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31308 | - |
| Ethernet8/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.31314 | - |
| Ethernet8/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.31320 | - |
| Ethernet8/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.31326 | - |
| Ethernet8/6/1 | default | IPv4-UNDERLAY-PEERS | 65120.31332 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.31100
   router-id 172.21.2.3
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   distance bgp 20 200 200
   timers bgp 5 15
   graceful-restart restart-time 300
   graceful-restart
   neighbor default send-community
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
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
   neighbor interface Ethernet3/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31200
   neighbor interface Ethernet3/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31303
   neighbor interface Ethernet3/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31309
   neighbor interface Ethernet3/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31315
   neighbor interface Ethernet3/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31321
   neighbor interface Ethernet3/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31327
   neighbor interface Ethernet4/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31200
   neighbor interface Ethernet4/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31304
   neighbor interface Ethernet4/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31310
   neighbor interface Ethernet4/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31316
   neighbor interface Ethernet4/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31322
   neighbor interface Ethernet4/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31328
   neighbor interface Ethernet5/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31201
   neighbor interface Ethernet5/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31305
   neighbor interface Ethernet5/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31311
   neighbor interface Ethernet5/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31317
   neighbor interface Ethernet5/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31323
   neighbor interface Ethernet5/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31329
   neighbor interface Ethernet6/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31201
   neighbor interface Ethernet6/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31306
   neighbor interface Ethernet6/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31312
   neighbor interface Ethernet6/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31318
   neighbor interface Ethernet6/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31324
   neighbor interface Ethernet6/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31330
   neighbor interface Ethernet7/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31301
   neighbor interface Ethernet7/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31307
   neighbor interface Ethernet7/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31313
   neighbor interface Ethernet7/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31319
   neighbor interface Ethernet7/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31325
   neighbor interface Ethernet7/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31331
   neighbor interface Ethernet8/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31302
   neighbor interface Ethernet8/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31308
   neighbor interface Ethernet8/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31314
   neighbor interface Ethernet8/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31320
   neighbor interface Ethernet8/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31326
   neighbor interface Ethernet8/6/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31332
   neighbor 172.21.2.4 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.4 remote-as 65120.31200
   neighbor 172.21.2.4 description ISMS1ITBL01A
   neighbor 172.21.2.5 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.5 remote-as 65120.31200
   neighbor 172.21.2.5 description ISMS1ITBL02A
   neighbor 172.21.2.6 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.6 remote-as 65120.31201
   neighbor 172.21.2.6 description ISMITAGG01A
   neighbor 172.21.2.7 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.7 remote-as 65120.31201
   neighbor 172.21.2.7 description ISMITAGG02A
   neighbor 172.21.2.8 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.8 remote-as 65120.31301
   neighbor 172.21.2.8 description IS11JIT01A
   neighbor 172.21.2.9 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.9 remote-as 65120.31302
   neighbor 172.21.2.9 description IS11GIT01A
   neighbor 172.21.2.10 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.10 remote-as 65120.31303
   neighbor 172.21.2.10 description IS11CIT01A
   neighbor 172.21.2.11 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.11 remote-as 65120.31304
   neighbor 172.21.2.11 description IS11AIT01A
   neighbor 172.21.2.12 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.12 remote-as 65120.31305
   neighbor 172.21.2.12 description IS11JWIT01A
   neighbor 172.21.2.13 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.13 remote-as 65120.31306
   neighbor 172.21.2.13 description IS11GWIT01A
   neighbor 172.21.2.14 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.14 remote-as 65120.31307
   neighbor 172.21.2.14 description IS11EWIT01A
   neighbor 172.21.2.15 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.15 remote-as 65120.31308
   neighbor 172.21.2.15 description IS11CWIT01A
   neighbor 172.21.2.16 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.16 remote-as 65120.31309
   neighbor 172.21.2.16 description IS11KEIT01A
   neighbor 172.21.2.17 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.17 remote-as 65120.31310
   neighbor 172.21.2.17 description IS11HEIT01A
   neighbor 172.21.2.18 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.18 remote-as 65120.31311
   neighbor 172.21.2.18 description IS11DEIT01A
   neighbor 172.21.2.19 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.19 remote-as 65120.31312
   neighbor 172.21.2.19 description IS11BEIT01A
   neighbor 172.21.2.20 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.20 remote-as 65120.31313
   neighbor 172.21.2.20 description ISM0WIT01A
   neighbor 172.21.2.21 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.21 remote-as 65120.31314
   neighbor 172.21.2.21 description ISM1WIT01A
   neighbor 172.21.2.22 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.22 remote-as 65120.31315
   neighbor 172.21.2.22 description ISM2WIT01A
   neighbor 172.21.2.23 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.23 remote-as 65120.31316
   neighbor 172.21.2.23 description ISM3XNIT01A
   neighbor 172.21.2.24 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.24 remote-as 65120.31317
   neighbor 172.21.2.24 description ISM3XNIT02A
   neighbor 172.21.2.25 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.25 remote-as 65120.31318
   neighbor 172.21.2.25 description ISM3XSIT01A
   neighbor 172.21.2.26 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.26 remote-as 65120.31319
   neighbor 172.21.2.26 description ISM3XSIT02A
   neighbor 172.21.2.27 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.27 remote-as 65120.31320
   neighbor 172.21.2.27 description ISM3WIT01A
   neighbor 172.21.2.28 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.28 remote-as 65120.31321
   neighbor 172.21.2.28 description IS00AIT01A
   neighbor 172.21.2.29 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.29 remote-as 65120.31322
   neighbor 172.21.2.29 description IS00BIT01A
   neighbor 172.21.2.30 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.30 remote-as 65120.31323
   neighbor 172.21.2.30 description IS00CIT01A
   neighbor 172.21.2.31 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.31 remote-as 65120.31324
   neighbor 172.21.2.31 description IS01AIT01A
   neighbor 172.21.2.32 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.32 remote-as 65120.31325
   neighbor 172.21.2.32 description IS01BIT01A
   neighbor 172.21.2.33 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.33 remote-as 65120.31326
   neighbor 172.21.2.33 description IS01CIT01A
   neighbor 172.21.2.34 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.34 remote-as 65120.31327
   neighbor 172.21.2.34 description IS02AIT01A
   neighbor 172.21.2.35 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.35 remote-as 65120.31328
   neighbor 172.21.2.35 description IS02BIT01A
   neighbor 172.21.2.36 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.36 remote-as 65120.31329
   neighbor 172.21.2.36 description IS03AIT01A
   neighbor 172.21.2.37 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.37 remote-as 65120.31330
   neighbor 172.21.2.37 description IS03BIT01A
   neighbor 172.21.2.38 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.38 remote-as 65120.31331
   neighbor 172.21.2.38 description ISM1YIT01A
   neighbor 172.21.2.39 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.2.39 remote-as 65120.31332
   neighbor 172.21.2.39 description ISM1VIT01A
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS next-hop address-family ipv6 originate
      neighbor IPv4-UNDERLAY-PEERS activate
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

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.2.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.2.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| mgmt | disabled |

### VRF Instances Device Configuration

```eos
!
vrf instance mgmt
```
