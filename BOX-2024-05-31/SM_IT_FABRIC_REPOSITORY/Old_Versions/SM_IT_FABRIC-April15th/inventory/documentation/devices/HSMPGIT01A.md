# HSMPGIT01A

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
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | mgmt | 10.215.242.22/23 | 10.215.242.22 |

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
   ip address 10.215.242.22/23
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

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 16384 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
spanning-tree mst 0 priority 16384
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
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet49 | [L]_ISMITAGG01A_Ethernet3 | *trunk | *221,224-225,227,237,243,245,247,250,305,307,309,337,951 | *- | *- | 49 |
| Ethernet50 | [L]_ISMITAGG02A_Ethernet3 | *trunk | *221,224-225,227,237,243,245,247,250,305,307,309,337,951 | *- | *- | 49 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet49
   description [L]_ISMITAGG01A_Ethernet3
   no shutdown
   channel-group 49 mode active
!
interface Ethernet50
   description [L]_ISMITAGG02A_Ethernet3
   no shutdown
   channel-group 49 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel49 | [L]_IT_AGG_LEAFS_Po3 | switched | trunk | 221,224-225,227,237,243,245,247,250,305,307,309,337,951 | - | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel49
   description [L]_IT_AGG_LEAFS_Po3
   no shutdown
   switchport
   switchport trunk allowed vlan 221,224-225,227,237,243,245,247,250,305,307,309,337,951
   switchport mode trunk
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
| default | False |
| mgmt | False |

#### IP Routing Device Configuration

```eos
no ip routing vrf mgmt
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| mgmt | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| mgmt | 0.0.0.0/0 | 10.215.242.22 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.215.242.22
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
