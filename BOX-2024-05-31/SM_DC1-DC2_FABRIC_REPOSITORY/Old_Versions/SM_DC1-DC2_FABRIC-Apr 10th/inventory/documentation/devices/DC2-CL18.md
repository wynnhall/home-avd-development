# DC2-CL18

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [IP Name Servers](#ip-name-servers)
  - [Domain Lookup](#domain-lookup)
  - [Clock Settings](#clock-settings)
  - [NTP](#ntp)
  - [Management SSH](#management-ssh)
  - [Management Console](#management-console)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [Enable Password](#enable-password)
  - [TACACS Servers](#tacacs-servers)
  - [IP TACACS Source Interfaces](#ip-tacacs-source-interfaces)
  - [AAA Server Groups](#aaa-server-groups)
  - [AAA Authentication](#aaa-authentication)
  - [AAA Authorization](#aaa-authorization)
  - [AAA Accounting](#aaa-accounting)
- [Aliases Device Configuration](#aliases-device-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
  - [SFlow](#sflow)
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
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
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
- [ACL](#acl)
  - [Standard Access-lists](#standard-access-lists)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [EOS CLI Device Configuration](#eos-cli-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | mgmt | 10.210.80.57/21 | 10.210.80.1 |

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
   ip address 10.210.80.57/21
```

### DNS Domain

DNS domain: itg.ti.com

#### DNS Domain Device Configuration

```eos
dns domain itg.ti.com
!
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 192.0.2.2 | mgmt | - |
| 192.0.2.3 | mgmt | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf mgmt 192.0.2.2
ip name-server vrf mgmt 192.0.2.3
```

### Domain Lookup

#### DNS Domain Lookup Summary

| Source interface | vrf |
| ---------------- | --- |
| Management1 | mgmt |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf mgmt source-interface Management1
```

### Clock Settings

#### Clock Timezone Settings

Clock Timezone is set to **UTC**.

#### Clock Device Configuration

```eos
!
clock timezone UTC
```

### NTP

#### NTP Summary

##### NTP Local Interface

| Interface | VRF |
| --------- | --- |
| Management1 | mgmt |

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 10.188.255.18 | mgmt | - | - | - | - | - | - | - | - |
| 134.183.87.87 | mgmt | - | - | - | - | - | - | - | - |
| 137.167.66.10 | mgmt | - | - | - | - | - | - | - | - |
| 137.167.210.21 | mgmt | - | - | - | - | - | - | - | - |
| 157.170.147.6 | mgmt | - | - | - | - | - | - | - | - |
| 158.218.8.155 | mgmt | - | - | - | - | - | - | - | - |
| 172.16.44.10 | mgmt | - | - | - | - | - | - | - | - |
| 172.16.169.44 | mgmt | False | - | - | - | - | - | - | - |
| 172.24.254.250 | mgmt | - | - | - | - | - | - | - | - |
| 172.31.225.25 | mgmt | - | - | - | - | - | - | - | - |

#### NTP Device Configuration

```eos
!
ntp local-interface vrf mgmt Management1
ntp server vrf mgmt 10.188.255.18
ntp server vrf mgmt 134.183.87.87
ntp server vrf mgmt 137.167.66.10
ntp server vrf mgmt 137.167.210.21
ntp server vrf mgmt 157.170.147.6
ntp server vrf mgmt 158.218.8.155
ntp server vrf mgmt 172.16.44.10
ntp server vrf mgmt 172.16.169.44
ntp server vrf mgmt 172.24.254.250
ntp server vrf mgmt 172.31.225.25
```

### Management SSH

#### SSH Timeout and Management

| Idle Timeout | SSH Management |
| ------------ | -------------- |
| 15 | Enabled |

#### Max number of SSH sessions limit and per-host limit

| Connection Limit | Max from a single Host |
| ---------------- | ---------------------- |
| - | - |

#### Ciphers and Algorithms

| Ciphers | Key-exchange methods | MAC algorithms | Hostkey server algorithms |
|---------|----------------------|----------------|---------------------------|
| default | default | default | default |

#### VRFs

| VRF | Status |
| --- | ------ |
| mgmt | Enabled |

#### Management SSH Device Configuration

```eos
!
management ssh
   idle-timeout 15
   no shutdown
   !
   vrf mgmt
      no shutdown
```

### Management Console

#### Management Console Timeout

Management Console Timeout is set to **15** minutes.

#### Management Console Device Configuration

```eos
!
management console
   idle-timeout 15
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| mgmt | Ansible-ACL_SM | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   no protocol http
   no shutdown
   !
   vrf mgmt
      no shutdown
      ip access-group Ansible-ACL_SM
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
| newtorkpw | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username newtorkpw privilege 15 role network-admin secret sha512 <removed>
```

### Enable Password

sha512 encrypted enable password is configured

#### Enable Password Device Configuration

```eos
!
enable password sha512 <removed>
!
```

### TACACS Servers

#### TACACS Servers

| VRF | TACACS Servers | Single-Connection | Timeout |
| --- | -------------- | ----------------- | ------- |
| mgmt | 172.31.225.29 | False | - |
| mgmt | 172.31.226.32 | False | - |

Policy unknown-mandatory-attribute ignore is configured

Global timeout: 20 seconds

#### TACACS Servers Device Configuration

```eos
!
tacacs-server host 172.31.225.29 vrf mgmt key 7 <removed>
tacacs-server host 172.31.226.32 vrf mgmt key 7 <removed>
tacacs-server policy unknown-mandatory-attribute ignore
tacacs-server timeout 20
```

### IP TACACS Source Interfaces

#### IP TACACS Source Interfaces

| VRF | Source Interface Name |
| --- | --------------- |
| mgmt | Management1 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf mgmt source-interface Management1
```

### AAA Server Groups

#### AAA Server Groups Summary

| Server Group Name | Type  | VRF | IP address |
| ------------------| ----- | --- | ---------- |
| tacacs_servers | tacacs+ | mgmt | 172.31.226.29 |
| tacacs_servers | tacacs+ | mgmt | 172.32.226.32 |

#### AAA Server Groups Device Configuration

```eos
!
aaa group server tacacs+ tacacs_servers
   server 172.31.226.29 vrf mgmt
   server 172.32.226.32 vrf mgmt
```

### AAA Authentication

#### AAA Authentication Summary

| Type | Sub-type | User Stores |
| ---- | -------- | ---------- |
| Login | default | group tacacs_servers local |
| Login | console | local |

#### AAA Authentication Device Configuration

```eos
aaa authentication login default group tacacs_servers local
aaa authentication login console local
aaa authentication enable default group tacacs_servers local
!
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | group tacacs_servers local |

Authorization for configuration commands is disabled.

#### AAA Authorization Device Configuration

```eos
aaa authorization exec default group tacacs_servers local
!
```

### AAA Accounting

#### AAA Accounting Summary

| Type | Commands | Record type | Group | Logging |
| ---- | -------- | ----------- | ----- | ------- |
| Commands - Default | 1,15 | start-stop | tacacs_servers | False |

#### AAA Accounting Device Configuration

```eos
aaa accounting commands 1,15 default start-stop group tacacs_servers
```

## Aliases Device Configuration

```eos
alias ll dir
alias q exit
alias senz show interface counter error | nz
alias shmc show int | awk '/^[A-Z]/ { intf = $1 } /, address is/ { print intf, $6 }'
alias snz show interface counter | nz
alias spd show port-channel %1 detail all
alias sqnz show interface counter queue | nz
alias srnz show interface counter rate | nz
alias shterminattr show version detail | grep TerminAttr-core

!
```

## Monitoring

### TerminAttr Daemon

#### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 10.210.80.7:9910,10.210.80.8:9910,10.210.80.9:9910 | mgmt | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | True |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.210.80.7:9910,10.210.80.8:9910,10.210.80.9:9910 -cvauth=token,/tmp/token -cvvrf=mgmt -disableaaa -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

### Logging

#### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | disabled |
| Monitor | debugging |
| Buffer | debugging |
| Trap | debugging |
| Synchronous | all |

| Format Type | Setting |
| ----------- | ------- |
| Timestamp | high-resolution |
| Hostname | fqdn |
| Sequence-numbers | false |
| RFC5424 | False |

| VRF | Source Interface |
| --- | ---------------- |
| mgmt | Management1 |

| VRF | Hosts | Ports | Protocol |
| --- | ----- | ----- | -------- |
| mgmt | ents.itg.ti.com | 514 | TCP |

**Syslog facility value:** local7

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000 debugging
logging trap debugging
no logging console
logging monitor debugging
logging synchronous level all
logging vrf mgmt host ents.itg.ti.com 514 protocol tcp
logging format timestamp high-resolution
logging format hostname fqdn
logging facility local7
logging vrf mgmt source-interface Management1
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| - | SHERMAN_FABRIC SM-DC2_FABRIC DC2-CL18 | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 184497f11740fb4334bb790850f88395737becb4 | - | - |
| remote | 536E4D705454 | entstrap.itg.ti.com | - |
| remote | 536576306E65406363652424 | sevonenms.itg.ti.com | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Management1 | mgmt |

#### SNMP VRF Status

| VRF | Status |
| --- | ------ |
| mgmt | Enabled |

#### SNMP Communities

| Community | Access | Access List IPv4 | Access List IPv6 | View |
| --------- | ------ | ---------------- | ---------------- | ---- |
| <removed> | rw | ENTS-SNMP_Access | - | - |
| <removed> | ro | ENTS-SNMP_Access | - | - |
| <removed> | ro | SevOne-SNMP_Access | - | - |
| <removed> | ro | Statseeker-SNMP_Access | - | - |
| <removed> | ro | NetBrain-SNMP_Access | - | - |
| <removed> | ro | Airwave-SNMP_Access | - | - |
| <removed> | ro | NetDisco-SNMP_Access | - | - |

#### SNMP Groups Configuration

| Group | SNMP Version | Authentication | Read | Write | Notify |
| ----- | ------------ | -------------- | ---- | ----- | ------ |
| network-admin | v3 | auth | - | - | - |
| network-operator | v3 | auth | - | - | - |

#### SNMP Users Configuration

| User | Group | Version | Authentication | Privacy | Remote Address | Remote Port | Engine ID |
| ---- | ----- | ------- | -------------- | ------- | -------------- | ----------- | --------- |
| SNMPManager | network-admin | v3 | sha | aes | - | - | 184497f11740fb4334bb790850f88395737becb4 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 184497f11740fb4334bb790850f88395737becb4
snmp-server location SHERMAN_FABRIC SM-DC2_FABRIC DC2-CL18
snmp-server engineID remote entstrap.itg.ti.com 536E4D705454
snmp-server engineID remote sevonenms.itg.ti.com 536576306E65406363652424
snmp-server vrf mgmt local-interface Management1
snmp-server community <removed> rw ENTS-SNMP_Access
snmp-server community <removed> ro ENTS-SNMP_Access
snmp-server community <removed> ro SevOne-SNMP_Access
snmp-server community <removed> ro Statseeker-SNMP_Access
snmp-server community <removed> ro NetBrain-SNMP_Access
snmp-server community <removed> ro Airwave-SNMP_Access
snmp-server community <removed> ro NetDisco-SNMP_Access
snmp-server group network-admin v3 auth
snmp-server group network-operator v3 auth
snmp-server user SNMPManager network-admin v3 localized 184497f11740fb4334bb790850f88395737becb4 auth sha <removed> priv aes <removed>
snmp-server enable traps
snmp-server vrf mgmt
```

### SFlow

#### SFlow Summary

| VRF | SFlow Source | SFlow Destination | Port |
| --- | ------------ | ----------------- | ---- |
| mgmt | - | sflowle03 | 6343 |
| mgmt | Management1 | - | - |
| default | - | 127.0.0.1 | 6343 |

sFlow Sample Rate: 16384

sFlow Polling Interval: 10

sFlow is enabled.

#### SFlow Extensions

| Extension | Enabled |
| --------- | ------- |
| bgp | True |

#### SFlow Device Configuration

```eos
!
sflow sample 16384
sflow polling-interval 10
sflow vrf mgmt destination sflowle03 6343
sflow vrf mgmt source-interface Management1
sflow destination 127.0.0.1
sflow extension bgp
sflow run
```

## MLAG

### MLAG Summary

| Domain-id | Local-interface | Peer-address | Peer-link |
| --------- | --------------- | ------------ | --------- |
| MLAG | Vlan4094 | 192.168.0.0 | Port-Channel4094 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id MLAG
   local-interface Vlan4094
   peer-address 192.168.0.0
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
- Global BPDU Guard for Edge ports is enabled.

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree edge-port bpduguard default
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
| 238 | 10.210.18.0/24_NAS-STRGE-PUB-NET | - |
| 316 | 10.210.96.0/22_SRVER/RIBLOE-MGMT | - |
| 322 | 10.210.102.0/24_NVR/SEC-DC2 | - |
| 323 | 10.210.103.0/28_DC-METROCL-INTCL | - |
| 355 | 10.210.103.32/27_ORCLERAC-PRVNET | - |
| 451 | 10.210.103.128/27_GAD-PNET-iSCSI | - |
| 1011 | 10.210.105.0/24_NSX-EDGE-NET-DC2 | - |
| 1012 | 10.210.0.0/21_VCF-WL-Edge-TEP | - |
| 1013 | 10.210.8.0/21_VCF-WL-Host-TEP | - |
| 1014 | 10.210.16.0/24_VCF-MU-Edge-TEP | - |
| 1015 | 10.210.17.0/24_VCF-MU-Host-TEP | - |
| 1016 | 10.210.100.0/24_VCF-MDOMAIN-VSAN | - |
| 1017 | 10.210.106.0/24_VCF-WD-ESXI-MGMT | - |
| 1018 | 10.210.107.0/24_VC-MD-ESXI-MGMT | - |
| 1019 | 10.210.108.0/23_VCF-WD-VMOTION | - |
| 1020 | 10.210.110.0/24_VCF-MD-VMOTION | - |
| 1021 | 10.210.111.0/24_VMWare-FT | - |
| 1022 | 10.210.128.0/19_NSX-MNGD-VMNET-P | - |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 238
   name 10.210.18.0/24_NAS-STRGE-PUB-NET
!
vlan 316
   name 10.210.96.0/22_SRVER/RIBLOE-MGMT
!
vlan 322
   name 10.210.102.0/24_NVR/SEC-DC2
!
vlan 323
   name 10.210.103.0/28_DC-METROCL-INTCL
!
vlan 355
   name 10.210.103.32/27_ORCLERAC-PRVNET
!
vlan 451
   name 10.210.103.128/27_GAD-PNET-iSCSI
!
vlan 1011
   name 10.210.105.0/24_NSX-EDGE-NET-DC2
!
vlan 1012
   name 10.210.0.0/21_VCF-WL-Edge-TEP
!
vlan 1013
   name 10.210.8.0/21_VCF-WL-Host-TEP
!
vlan 1014
   name 10.210.16.0/24_VCF-MU-Edge-TEP
!
vlan 1015
   name 10.210.17.0/24_VCF-MU-Host-TEP
!
vlan 1016
   name 10.210.100.0/24_VCF-MDOMAIN-VSAN
!
vlan 1017
   name 10.210.106.0/24_VCF-WD-ESXI-MGMT
!
vlan 1018
   name 10.210.107.0/24_VC-MD-ESXI-MGMT
!
vlan 1019
   name 10.210.108.0/23_VCF-WD-VMOTION
!
vlan 1020
   name 10.210.110.0/24_VCF-MD-VMOTION
!
vlan 1021
   name 10.210.111.0/24_VMWare-FT
!
vlan 1022
   name 10.210.128.0/19_NSX-MNGD-VMNET-P
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

### Switchport Default

#### Switchport Defaults Summary

- Default Switchport Mode: routed

#### Switchport Default Device Configuration

```eos
!
switchport default mode routed
```

### Interface Defaults

#### Interface Defaults Summary

- Default Ethernet Interface Shutdown: True

- Default Routed Interface MTU: 9214

#### Interface Defaults Device Configuration

```eos
!
interface defaults
   ethernet
      shutdown
   mtu 9214
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet55/1 | [L]_MLAG_PEER_DC2-CL17_Ethernet55/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet56/1 | [L]_MLAG_PEER_DC2-CL17_Ethernet56/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |

*Inherited from Port-Channel Interface

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet49/1 | [L]_P2P_LINK_TO_ISMDC2SP01A_Ethernet20/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet50/1 | [L]_P2P_LINK_TO_ISMDC2SP02A_Ethernet20/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet51/1 | [L]_P2P_LINK_TO_ISMDC2SP03A_Ethernet20/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet49/1
   description [L]_P2P_LINK_TO_ISMDC2SP01A_Ethernet20/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet50/1
   description [L]_P2P_LINK_TO_ISMDC2SP02A_Ethernet20/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet51/1
   description [L]_P2P_LINK_TO_ISMDC2SP03A_Ethernet20/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet55/1
   description [L]_MLAG_PEER_DC2-CL17_Ethernet55/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet56/1
   description [L]_MLAG_PEER_DC2-CL17_Ethernet56/1
   no shutdown
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel4094 | [L]_MLAG_PEER_DC2-CL17_Po551 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel4094
   description [L]_MLAG_PEER_DC2-CL17_Po551
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
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.1.21/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.210.232.20/32 |

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
   ip address 172.21.1.21/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.210.232.20/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan238 | 10.210.18.0/24_NAS-STRGE-PUB-NET | OT | - | False |
| Vlan316 | 10.210.96.0/22_SRVER/RIBLOE-MGMT | IT-DC | - | False |
| Vlan322 | 10.210.102.0/24_NVR/SEC-DC2 | IT-DC | - | False |
| Vlan323 | 10.210.103.0/28_DC-METROCL-INTCL | OT | - | False |
| Vlan355 | 10.210.103.32/27_ORCLERAC-PRVNET | OT | - | False |
| Vlan451 | 10.210.103.128/27_GAD-PNET-iSCSI | OT | - | False |
| Vlan1011 | 10.210.105.0/24_NSX-EDGE-NET-DC2 | OT | - | False |
| Vlan1012 | 10.210.0.0/21_VCF-WL-Edge-TEP | OT | - | False |
| Vlan1013 | 10.210.8.0/21_VCF-WL-Host-TEP | OT | - | False |
| Vlan1014 | 10.210.16.0/24_VCF-MU-Edge-TEP | OT | - | False |
| Vlan1015 | 10.210.17.0/24_VCF-MU-Host-TEP | OT | - | False |
| Vlan1016 | 10.210.100.0/24_VCF-MDOMAIN-VSAN | OT | - | False |
| Vlan1017 | 10.210.106.0/24_VCF-WD-ESXI-MGMT | OT | - | False |
| Vlan1018 | 10.210.107.0/24_VC-MD-ESXI-MGMT | OT | - | False |
| Vlan1019 | 10.210.108.0/23_VCF-WD-VMOTION | OT | - | False |
| Vlan1020 | 10.210.110.0/24_VCF-MD-VMOTION | OT | - | False |
| Vlan1021 | 10.210.111.0/24_VMWare-FT | OT | - | False |
| Vlan1022 | 10.210.128.0/19_NSX-MNGD-VMNET-P | OT | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan238 |  OT  |  -  |  10.210.18.1/24  |  -  |  -  |  -  |  -  |
| Vlan316 |  IT-DC  |  -  |  10.210.96.1/22  |  -  |  -  |  -  |  -  |
| Vlan322 |  IT-DC  |  -  |  10.210.102.1/24  |  -  |  -  |  -  |  -  |
| Vlan323 |  OT  |  -  |  10.210.103.1/28  |  -  |  -  |  -  |  -  |
| Vlan355 |  OT  |  -  |  10.210.103.33/27  |  -  |  -  |  -  |  -  |
| Vlan451 |  OT  |  -  |  10.210.103.129/27  |  -  |  -  |  -  |  -  |
| Vlan1011 |  OT  |  -  |  10.210.104.1/24  |  -  |  -  |  -  |  -  |
| Vlan1012 |  OT  |  -  |  10.210.0.1/21  |  -  |  -  |  -  |  -  |
| Vlan1013 |  OT  |  -  |  10.210.8.1/21  |  -  |  -  |  -  |  -  |
| Vlan1014 |  OT  |  -  |  10.210.16.1/24  |  -  |  -  |  -  |  -  |
| Vlan1015 |  OT  |  -  |  10.210.17.1/24  |  -  |  -  |  -  |  -  |
| Vlan1016 |  OT  |  -  |  10.210.100.1/24  |  -  |  -  |  -  |  -  |
| Vlan1017 |  OT  |  -  |  10.210.106.1/24  |  -  |  -  |  -  |  -  |
| Vlan1018 |  OT  |  -  |  10.210.107.1/24  |  -  |  -  |  -  |  -  |
| Vlan1019 |  OT  |  -  |  10.210.108.1/23  |  -  |  -  |  -  |  -  |
| Vlan1020 |  OT  |  -  |  10.210.110.1/24  |  -  |  -  |  -  |  -  |
| Vlan1021 |  OT  |  -  |  10.210.111.1/24  |  -  |  -  |  -  |  -  |
| Vlan1022 |  OT  |  -  |  10.210.128.1/19  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  -  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan238
   description 10.210.18.0/24_NAS-STRGE-PUB-NET
   no shutdown
   vrf OT
   ip address virtual 10.210.18.1/24
!
interface Vlan316
   description 10.210.96.0/22_SRVER/RIBLOE-MGMT
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.96.1/22
!
interface Vlan322
   description 10.210.102.0/24_NVR/SEC-DC2
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.102.1/24
!
interface Vlan323
   description 10.210.103.0/28_DC-METROCL-INTCL
   no shutdown
   vrf OT
   ip address virtual 10.210.103.1/28
!
interface Vlan355
   description 10.210.103.32/27_ORCLERAC-PRVNET
   no shutdown
   vrf OT
   ip address virtual 10.210.103.33/27
!
interface Vlan451
   description 10.210.103.128/27_GAD-PNET-iSCSI
   no shutdown
   vrf OT
   ip address virtual 10.210.103.129/27
!
interface Vlan1011
   description 10.210.105.0/24_NSX-EDGE-NET-DC2
   no shutdown
   vrf OT
   ip address virtual 10.210.104.1/24
!
interface Vlan1012
   description 10.210.0.0/21_VCF-WL-Edge-TEP
   no shutdown
   vrf OT
   ip address virtual 10.210.0.1/21
!
interface Vlan1013
   description 10.210.8.0/21_VCF-WL-Host-TEP
   no shutdown
   vrf OT
   ip address virtual 10.210.8.1/21
!
interface Vlan1014
   description 10.210.16.0/24_VCF-MU-Edge-TEP
   no shutdown
   vrf OT
   ip address virtual 10.210.16.1/24
!
interface Vlan1015
   description 10.210.17.0/24_VCF-MU-Host-TEP
   no shutdown
   vrf OT
   ip address virtual 10.210.17.1/24
!
interface Vlan1016
   description 10.210.100.0/24_VCF-MDOMAIN-VSAN
   no shutdown
   vrf OT
   ip address virtual 10.210.100.1/24
!
interface Vlan1017
   description 10.210.106.0/24_VCF-WD-ESXI-MGMT
   no shutdown
   vrf OT
   ip address virtual 10.210.106.1/24
!
interface Vlan1018
   description 10.210.107.0/24_VC-MD-ESXI-MGMT
   no shutdown
   vrf OT
   ip address virtual 10.210.107.1/24
!
interface Vlan1019
   description 10.210.108.0/23_VCF-WD-VMOTION
   no shutdown
   vrf OT
   ip address virtual 10.210.108.1/23
!
interface Vlan1020
   description 10.210.110.0/24_VCF-MD-VMOTION
   no shutdown
   vrf OT
   ip address virtual 10.210.110.1/24
!
interface Vlan1021
   description 10.210.111.0/24_VMWare-FT
   no shutdown
   vrf OT
   ip address virtual 10.210.111.1/24
!
interface Vlan1022
   description 10.210.128.0/19_NSX-MNGD-VMNET-P
   no shutdown
   vrf OT
   ip address virtual 10.210.128.1/19
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
   ip address 192.168.0.1/31
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
| 238 | 10238 | - | - |
| 316 | 10316 | - | - |
| 322 | 10322 | - | - |
| 323 | 10323 | - | - |
| 355 | 10355 | - | - |
| 451 | 10451 | - | - |
| 1011 | 11011 | - | - |
| 1012 | 11012 | - | - |
| 1013 | 11013 | - | - |
| 1014 | 11014 | - | - |
| 1015 | 11015 | - | - |
| 1016 | 11016 | - | - |
| 1017 | 11017 | - | - |
| 1018 | 11018 | - | - |
| 1019 | 11019 | - | - |
| 1020 | 11020 | - | - |
| 1021 | 11021 | - | - |
| 1022 | 11022 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| IT-DC | 5002 | - |
| OT | 5001 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description DC2-CL18_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 238 vni 10238
   vxlan vlan 316 vni 10316
   vxlan vlan 322 vni 10322
   vxlan vlan 323 vni 10323
   vxlan vlan 355 vni 10355
   vxlan vlan 451 vni 10451
   vxlan vlan 1011 vni 11011
   vxlan vlan 1012 vni 11012
   vxlan vlan 1013 vni 11013
   vxlan vlan 1014 vni 11014
   vxlan vlan 1015 vni 11015
   vxlan vlan 1016 vni 11016
   vxlan vlan 1017 vni 11017
   vxlan vlan 1018 vni 11018
   vxlan vlan 1019 vni 11019
   vxlan vlan 1020 vni 11020
   vxlan vlan 1021 vni 11021
   vxlan vlan 1022 vni 11022
   vxlan vrf IT-DC vni 5002
   vxlan vrf OT vni 5001
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
| IT-DC | True |
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing ipv6 interfaces
ip routing vrf IT-DC
no ip routing vrf mgmt
ip routing vrf OT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| IT-DC | false |
| mgmt | false |
| OT | false |

#### IPv6 Routing Device Configuration

```eos
!
ipv6 unicast-routing
```

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
| 65120.12209 | 172.21.1.21 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| distance bgp 20 200 200 |
| timers bgp 5 15 |
| neighbor default send-community |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 128 ecmp 128 |

#### Router BGP Peer Groups

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
| Remote AS | 65120.12209 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.1.1 | 65120.12100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.1.2 | 65120.12100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.1.3 | 65120.12100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet49/1 | default | IPv4-UNDERLAY-PEERS | 65120.12100 | - |
| Ethernet50/1 | default | IPv4-UNDERLAY-PEERS | 65120.12100 | - |
| Ethernet51/1 | default | IPv4-UNDERLAY-PEERS | 65120.12100 | - |
| Vlan4093 | default | MLAG-IPv4-UNDERLAY-PEER | 65120.12209 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 238 | 172.21.1.21:10238 | 10238:10238 | - | - | learned |
| 316 | 172.21.1.21:10316 | 10316:10316 | - | - | learned |
| 322 | 172.21.1.21:10322 | 10322:10322 | - | - | learned |
| 323 | 172.21.1.21:10323 | 10323:10323 | - | - | learned |
| 355 | 172.21.1.21:10355 | 10355:10355 | - | - | learned |
| 451 | 172.21.1.21:10451 | 10451:10451 | - | - | learned |
| 1011 | 172.21.1.21:11011 | 11011:11011 | - | - | learned |
| 1012 | 172.21.1.21:11012 | 11012:11012 | - | - | learned |
| 1013 | 172.21.1.21:11013 | 11013:11013 | - | - | learned |
| 1014 | 172.21.1.21:11014 | 11014:11014 | - | - | learned |
| 1015 | 172.21.1.21:11015 | 11015:11015 | - | - | learned |
| 1016 | 172.21.1.21:11016 | 11016:11016 | - | - | learned |
| 1017 | 172.21.1.21:11017 | 11017:11017 | - | - | learned |
| 1018 | 172.21.1.21:11018 | 11018:11018 | - | - | learned |
| 1019 | 172.21.1.21:11019 | 11019:11019 | - | - | learned |
| 1020 | 172.21.1.21:11020 | 11020:11020 | - | - | learned |
| 1021 | 172.21.1.21:11021 | 11021:11021 | - | - | learned |
| 1022 | 172.21.1.21:11022 | 11022:11022 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IT-DC | 172.21.1.21:5002 | connected |
| OT | 172.21.1.21:5001 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.12209
   router-id 172.21.1.21
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   distance bgp 20 200 200
   timers bgp 5 15
   neighbor default send-community
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
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.12209
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description DC2-CL17
   neighbor MLAG-IPv4-UNDERLAY-PEER password 7 <removed>
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor interface Ethernet49/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.12100
   neighbor interface Ethernet50/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.12100
   neighbor interface Ethernet51/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.12100
   neighbor interface Vlan4093 peer-group MLAG-IPv4-UNDERLAY-PEER remote-as 65120.12209
   neighbor 172.21.1.1 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.1.1 remote-as 65120.12100
   neighbor 172.21.1.1 description ISMDC2SP01A
   neighbor 172.21.1.2 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.1.2 remote-as 65120.12100
   neighbor 172.21.1.2 description ISMDC2SP02A
   neighbor 172.21.1.3 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.1.3 remote-as 65120.12100
   neighbor 172.21.1.3 description ISMDC2SP03A
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 1011
      rd 172.21.1.21:11011
      route-target both 11011:11011
      redistribute learned
   !
   vlan 1012
      rd 172.21.1.21:11012
      route-target both 11012:11012
      redistribute learned
   !
   vlan 1013
      rd 172.21.1.21:11013
      route-target both 11013:11013
      redistribute learned
   !
   vlan 1014
      rd 172.21.1.21:11014
      route-target both 11014:11014
      redistribute learned
   !
   vlan 1015
      rd 172.21.1.21:11015
      route-target both 11015:11015
      redistribute learned
   !
   vlan 1016
      rd 172.21.1.21:11016
      route-target both 11016:11016
      redistribute learned
   !
   vlan 1017
      rd 172.21.1.21:11017
      route-target both 11017:11017
      redistribute learned
   !
   vlan 1018
      rd 172.21.1.21:11018
      route-target both 11018:11018
      redistribute learned
   !
   vlan 1019
      rd 172.21.1.21:11019
      route-target both 11019:11019
      redistribute learned
   !
   vlan 1020
      rd 172.21.1.21:11020
      route-target both 11020:11020
      redistribute learned
   !
   vlan 1021
      rd 172.21.1.21:11021
      route-target both 11021:11021
      redistribute learned
   !
   vlan 1022
      rd 172.21.1.21:11022
      route-target both 11022:11022
      redistribute learned
   !
   vlan 238
      rd 172.21.1.21:10238
      route-target both 10238:10238
      redistribute learned
   !
   vlan 316
      rd 172.21.1.21:10316
      route-target both 10316:10316
      redistribute learned
   !
   vlan 322
      rd 172.21.1.21:10322
      route-target both 10322:10322
      redistribute learned
   !
   vlan 323
      rd 172.21.1.21:10323
      route-target both 10323:10323
      redistribute learned
   !
   vlan 355
      rd 172.21.1.21:10355
      route-target both 10355:10355
      redistribute learned
   !
   vlan 451
      rd 172.21.1.21:10451
      route-target both 10451:10451
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
   vrf IT-DC
      rd 172.21.1.21:5002
      route-target import evpn 5002:5002
      route-target export evpn 5002:5002
      router-id 172.21.1.21
      redistribute connected
   !
   vrf OT
      rd 172.21.1.21:5001
      route-target import evpn 5001:5001
      route-target export evpn 5001:5001
      router-id 172.21.1.21
      redistribute connected
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 3000 | 3000 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 3000 min-rx 3000 multiplier 3
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

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.1.0/24 eq 32 |
| 20 | permit 10.210.232.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.1.0/24 eq 32
   seq 20 permit 10.210.232.0/24 eq 32
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

## ACL

### Standard Access-lists

#### Standard Access-lists Summary

##### Airwave-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.226.33 |
| 20 | deny any log |

##### Ansible-ACL_SM

| Sequence | Action |
| -------- | ------ |
| 10 | remark dlecvp01 |
| 20 | permit host 10.180.68.99 |
| 30 | remark dlecvp02 |
| 40 | permit host 10.180.68.98 |
| 50 | remark dflcvp01 |
| 60 | permit host 10.64.41.27 |
| 70 | remark dsmcvp01 |
| 80 | permit host 10.210.80.7 |
| 90 | remark dsmcvp02 |
| 100 | permit host 10.210.80.8 |
| 110 | remark dsmcvp03 |
| 120 | permit host 10.210.80.9 |
| 130 | remark ents |
| 140 | permit host 172.31.227.10 |
| 150 | remark tilde |
| 160 | permit host 172.31.226.25 |
| 170 | remark dotdot |
| 180 | permit host 172.31.225.12 |

##### ENTS-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.226.25 |
| 20 | permit host 172.31.227.10 |
| 30 | permit host 172.31.225.12 |
| 40 | deny any log |

##### NetBrain-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.226.55 |
| 20 | permit host 172.31.225.43 |
| 30 | permit host 172.31.226.49 |
| 40 | permit host 172.31.226.54 |
| 50 | deny any log |

##### NetDisco-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.226.24 |
| 20 | permit host 172.31.226.53 |
| 30 | deny any log |

##### SevOne-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.225.47 |
| 20 | permit host 172.31.225.53 |
| 30 | permit host 172.31.225.54 |
| 40 | permit host 172.31.225.60 |
| 50 |  permit host 172.31.225.61 |
| 60 |  permit host 172.31.225.62 |
| 70 |  permit host 172.31.225.63 |
| 80 |  permit host 172.31.225.64 |
| 90 |  permit host 172.31.225.65 |
| 100 |  permit host 172.31.225.66 |
| 110 |  permit host 172.31.225.67 |
| 120 |  permit host 172.31.225.68 |
| 130 |  permit host 172.31.225.69 |
| 140 |  permit host 172.31.225.86 |
| 150 |  permit host 172.31.225.87 |
| 160 |  permit host 172.31.225.88 |
| 170 |  permit host 172.31.225.89 |
| 180 |  permit host 172.31.225.90 |
| 190 |  permit host 172.31.225.91 |
| 200 |  permit host 172.31.226.100 |
| 210 |  permit host 172.31.226.101 |
| 220 |  permit host 172.31.226.102 |
| 230 |  permit host 172.31.226.55 |
| 240 |  permit host 172.31.226.58 |
| 250 |  permit host 172.31.226.59 |
| 260 |  permit host 172.31.226.63 |
| 270 |  permit host 172.31.226.68 |
| 280 |  permit host 172.31.226.74 |
| 290 |  permit host 172.31.226.75 |
| 300 |  permit host 172.31.226.76 |
| 310 |  permit host 172.31.226.77 |
| 320 |  permit host 172.31.226.79 |
| 330 |  permit host 172.31.226.87 |
| 340 |  permit host 172.31.226.90 |
| 350 |  permit host 172.31.226.91 |
| 360 |  permit host 172.31.226.97 |
| 370 |  permit host 172.31.226.98 |
| 380 |  permit host 172.31.226.99 |
| 390 | deny any log |

##### Statseeker-SNMP_Access

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 172.31.226.35 |
| 20 | deny any log |

#### Standard Access-lists Device Configuration

```eos
!
ip access-list standard Airwave-SNMP_Access
   10 permit host 172.31.226.33
   20 deny any log
!
ip access-list standard Ansible-ACL_SM
   10 remark dlecvp01
   20 permit host 10.180.68.99
   30 remark dlecvp02
   40 permit host 10.180.68.98
   50 remark dflcvp01
   60 permit host 10.64.41.27
   70 remark dsmcvp01
   80 permit host 10.210.80.7
   90 remark dsmcvp02
   100 permit host 10.210.80.8
   110 remark dsmcvp03
   120 permit host 10.210.80.9
   130 remark ents
   140 permit host 172.31.227.10
   150 remark tilde
   160 permit host 172.31.226.25
   170 remark dotdot
   180 permit host 172.31.225.12
!
ip access-list standard ENTS-SNMP_Access
   10 permit host 172.31.226.25
   20 permit host 172.31.227.10
   30 permit host 172.31.225.12
   40 deny any log
!
ip access-list standard NetBrain-SNMP_Access
   10 permit host 172.31.226.55
   20 permit host 172.31.225.43
   30 permit host 172.31.226.49
   40 permit host 172.31.226.54
   50 deny any log
!
ip access-list standard NetDisco-SNMP_Access
   10 permit host 172.31.226.24
   20 permit host 172.31.226.53
   30 deny any log
!
ip access-list standard SevOne-SNMP_Access
   10 permit host 172.31.225.47
   20 permit host 172.31.225.53
   30 permit host 172.31.225.54
   40 permit host 172.31.225.60
   50  permit host 172.31.225.61
   60  permit host 172.31.225.62
   70  permit host 172.31.225.63
   80  permit host 172.31.225.64
   90  permit host 172.31.225.65
   100  permit host 172.31.225.66
   110  permit host 172.31.225.67
   120  permit host 172.31.225.68
   130  permit host 172.31.225.69
   140  permit host 172.31.225.86
   150  permit host 172.31.225.87
   160  permit host 172.31.225.88
   170  permit host 172.31.225.89
   180  permit host 172.31.225.90
   190  permit host 172.31.225.91
   200  permit host 172.31.226.100
   210  permit host 172.31.226.101
   220  permit host 172.31.226.102
   230  permit host 172.31.226.55
   240  permit host 172.31.226.58
   250  permit host 172.31.226.59
   260  permit host 172.31.226.63
   270  permit host 172.31.226.68
   280  permit host 172.31.226.74
   290  permit host 172.31.226.75
   300  permit host 172.31.226.76
   310  permit host 172.31.226.77
   320  permit host 172.31.226.79
   330  permit host 172.31.226.87
   340  permit host 172.31.226.90
   350  permit host 172.31.226.91
   360  permit host 172.31.226.97
   370  permit host 172.31.226.98
   380  permit host 172.31.226.99
   390 deny any log
!
ip access-list standard Statseeker-SNMP_Access
   10 permit host 172.31.226.35
   20 deny any log
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| IT-DC | enabled |
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance IT-DC
!
vrf instance mgmt
!
vrf instance OT
```

## EOS CLI Device Configuration

```eos
!
logging event congestion-drops interval 600
no logging repeat-messages
logging level all debugging
logging event link-status global
service unsupported-transceiver TexasInstruments ffd6c10c

```
