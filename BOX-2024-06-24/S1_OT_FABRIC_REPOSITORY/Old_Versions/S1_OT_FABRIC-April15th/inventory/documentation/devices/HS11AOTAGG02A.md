# HS11AOTAGG02A

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
| Management1 | oob_management | oob | mgmt | 10.211.240.39/22 | 10.211.240.39 |

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
   ip address 10.211.240.39/22
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
| 30 | Enabled |

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
   idle-timeout 30
   no shutdown
   !
   vrf mgmt
      no shutdown
```

### Management Console

#### Management Console Timeout

Management Console Timeout is set to **30** minutes.

#### Management Console Device Configuration

```eos
!
management console
   idle-timeout 30
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
| - | S1-OT_FABRIC HS11AOTAGG02A | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 2526ffcd4b09ca6c306c2dae7a18d653b129c91b | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 2526ffcd4b09ca6c306c2dae7a18d653b129c91b |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 2526ffcd4b09ca6c306c2dae7a18d653b129c91b
snmp-server location S1-OT_FABRIC HS11AOTAGG02A
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
snmp-server user SNMPManager network-admin v3 localized 2526ffcd4b09ca6c306c2dae7a18d653b129c91b auth sha <removed> priv aes <removed>
snmp-server enable traps
snmp-server vrf mgmt
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
| 253 | 10.211.32.1/21_SM1-AMHS-Module | - |
| 261 | 10.211.40.0/21_SM1-CMP-Module | - |
| 269 | 10.211.48.0/22_SM1-Implant-Module | - |
| 273 | 10.211.52.0/22_SM1-Photo-Module | - |
| 277 | 10.211.56.0/22_SM1-Furnace-Module | - |
| 281 | 10.211.60.0/22_SM1-EPI-Module | - |
| 285 | 10.211.64.1/22_SM1-Plasma-Module | - |
| 289 | 10.211.68.0/22_SM1-ThinFilm-Module | - |
| 293 | 10.211.72.0/22_SM1-RTP-Module | - |
| 297 | 10.211.76.0/22_SM1-Wet-Module | - |
| 301 | 10.211.80.0/22_SM1-YE/Metrology-Module | - |
| 313 | 10.215.88.0/21_SM-Parametric-Test | - |
| 327 | 10.211.106.0/24_SM1-AMHS-Controller | - |
| 329 | 10.211.108.0/22_SM1-AMHS-WLAN | - |
| 4020 | 10.215.17.0/24_S0-MFG-Engineering-Lab | - |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 253
   name 10.211.32.1/21_SM1-AMHS-Module
!
vlan 261
   name 10.211.40.0/21_SM1-CMP-Module
!
vlan 269
   name 10.211.48.0/22_SM1-Implant-Module
!
vlan 273
   name 10.211.52.0/22_SM1-Photo-Module
!
vlan 277
   name 10.211.56.0/22_SM1-Furnace-Module
!
vlan 281
   name 10.211.60.0/22_SM1-EPI-Module
!
vlan 285
   name 10.211.64.1/22_SM1-Plasma-Module
!
vlan 289
   name 10.211.68.0/22_SM1-ThinFilm-Module
!
vlan 293
   name 10.211.72.0/22_SM1-RTP-Module
!
vlan 297
   name 10.211.76.0/22_SM1-Wet-Module
!
vlan 301
   name 10.211.80.0/22_SM1-YE/Metrology-Module
!
vlan 313
   name 10.215.88.0/21_SM-Parametric-Test
!
vlan 327
   name 10.211.106.0/24_SM1-AMHS-Controller
!
vlan 329
   name 10.211.108.0/22_SM1-AMHS-WLAN
!
vlan 4020
   name 10.215.17.0/24_S0-MFG-Engineering-Lab
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
| Ethernet1 | [L]_HS11AOT01A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 1 |
| Ethernet2 | [L]_HS11AOT02A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 2 |
| Ethernet3 | [L]_HS11AOT03A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 3 |
| Ethernet4 | [L]_HS11AOT04A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 4 |
| Ethernet5 | [L]_HS11AOT05A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 5 |
| Ethernet6 | [L]_HS11AOT06A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 6 |
| Ethernet7 | [L]_HS11AOT07A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 7 |
| Ethernet8 | [L]_HS11AOT08A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 8 |
| Ethernet9 | [L]_HS11AOT09A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 9 |
| Ethernet10 | [L]_HS11AOT10A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 10 |
| Ethernet11 | [L]_HS11AOT11A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 11 |
| Ethernet12 | [L]_HS11AOT12A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 12 |
| Ethernet13 | [L]_HS11AOT13A_Ethernet50 | *trunk | *253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | *- | *- | 13 |
| Ethernet55/1 | [L]_MLAG_PEER_HS11AOTAGG01A_Ethernet55/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet56/1 | [L]_MLAG_PEER_HS11AOTAGG01A_Ethernet56/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |

*Inherited from Port-Channel Interface

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet49/1 | [L]_P2P_LINK_TO_ISMS1OTSP01A_Ethernet9/2/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet50/1 | [L]_P2P_LINK_TO_ISMS1OTSP02A_Ethernet9/2/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet51/1 | [L]_P2P_LINK_TO_ISMS1OTSP03A_Ethernet9/2/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description [L]_HS11AOT01A_Ethernet50
   no shutdown
   channel-group 1 mode active
!
interface Ethernet2
   description [L]_HS11AOT02A_Ethernet50
   no shutdown
   channel-group 2 mode active
!
interface Ethernet3
   description [L]_HS11AOT03A_Ethernet50
   no shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description [L]_HS11AOT04A_Ethernet50
   no shutdown
   channel-group 4 mode active
!
interface Ethernet5
   description [L]_HS11AOT05A_Ethernet50
   no shutdown
   channel-group 5 mode active
!
interface Ethernet6
   description [L]_HS11AOT06A_Ethernet50
   no shutdown
   channel-group 6 mode active
!
interface Ethernet7
   description [L]_HS11AOT07A_Ethernet50
   no shutdown
   channel-group 7 mode active
!
interface Ethernet8
   description [L]_HS11AOT08A_Ethernet50
   no shutdown
   channel-group 8 mode active
!
interface Ethernet9
   description [L]_HS11AOT09A_Ethernet50
   no shutdown
   channel-group 9 mode active
!
interface Ethernet10
   description [L]_HS11AOT10A_Ethernet50
   no shutdown
   channel-group 10 mode active
!
interface Ethernet11
   description [L]_HS11AOT11A_Ethernet50
   no shutdown
   channel-group 11 mode active
!
interface Ethernet12
   description [L]_HS11AOT12A_Ethernet50
   no shutdown
   channel-group 12 mode active
!
interface Ethernet13
   description [L]_HS11AOT13A_Ethernet50
   no shutdown
   channel-group 13 mode active
!
interface Ethernet49/1
   description [L]_P2P_LINK_TO_ISMS1OTSP01A_Ethernet9/2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet50/1
   description [L]_P2P_LINK_TO_ISMS1OTSP02A_Ethernet9/2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet51/1
   description [L]_P2P_LINK_TO_ISMS1OTSP03A_Ethernet9/2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet55/1
   description [L]_MLAG_PEER_HS11AOTAGG01A_Ethernet55/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet56/1
   description [L]_MLAG_PEER_HS11AOTAGG01A_Ethernet56/1
   no shutdown
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel1 | [L]_HS11AOT01A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 1 | - |
| Port-Channel2 | [L]_HS11AOT02A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 2 | - |
| Port-Channel3 | [L]_HS11AOT03A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 3 | - |
| Port-Channel4 | [L]_HS11AOT04A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 4 | - |
| Port-Channel5 | [L]_HS11AOT05A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 5 | - |
| Port-Channel6 | [L]_HS11AOT06A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 6 | - |
| Port-Channel7 | [L]_HS11AOT07A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 7 | - |
| Port-Channel8 | [L]_HS11AOT08A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 8 | - |
| Port-Channel9 | [L]_HS11AOT09A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 9 | - |
| Port-Channel10 | [L]_HS11AOT10A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 10 | - |
| Port-Channel11 | [L]_HS11AOT11A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 11 | - |
| Port-Channel12 | [L]_HS11AOT12A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 12 | - |
| Port-Channel13 | [L]_HS11AOT13A_Po49 | switched | trunk | 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020 | - | - | - | - | 13 | - |
| Port-Channel4094 | [L]_MLAG_PEER_HS11AOTAGG01A_Po551 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description [L]_HS11AOT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 1
!
interface Port-Channel2
   description [L]_HS11AOT02A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 2
!
interface Port-Channel3
   description [L]_HS11AOT03A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 3
!
interface Port-Channel4
   description [L]_HS11AOT04A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 4
!
interface Port-Channel5
   description [L]_HS11AOT05A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 5
!
interface Port-Channel6
   description [L]_HS11AOT06A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 6
!
interface Port-Channel7
   description [L]_HS11AOT07A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 7
!
interface Port-Channel8
   description [L]_HS11AOT08A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 8
!
interface Port-Channel9
   description [L]_HS11AOT09A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 9
!
interface Port-Channel10
   description [L]_HS11AOT10A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 10
!
interface Port-Channel11
   description [L]_HS11AOT11A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 11
!
interface Port-Channel12
   description [L]_HS11AOT12A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 12
!
interface Port-Channel13
   description [L]_HS11AOT13A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 253,261,269,273,277,281,285,289,293,297,301,313,327,329,4020
   switchport mode trunk
   mlag 13
!
interface Port-Channel4094
   description [L]_MLAG_PEER_HS11AOTAGG01A_Po551
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
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.3.17/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.210.248.16/32 |

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
   ip address 172.21.3.17/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.210.248.16/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan253 | 10.211.32.1/21_SM1-AMHS-Module | OT | - | False |
| Vlan261 | 10.211.40.0/21_SM1-CMP-Module | OT | - | False |
| Vlan269 | 10.211.48.0/22_SM1-Implant-Module | OT | - | False |
| Vlan273 | 10.211.52.0/22_SM1-Photo-Module | OT | - | False |
| Vlan277 | 10.211.56.0/22_SM1-Furnace-Module | OT | - | False |
| Vlan281 | 10.211.60.0/22_SM1-EPI-Module | OT | - | False |
| Vlan285 | 10.211.64.1/22_SM1-Plasma-Module | OT | - | False |
| Vlan289 | 10.211.68.0/22_SM1-ThinFilm-Module | OT | - | False |
| Vlan293 | 10.211.72.0/22_SM1-RTP-Module | OT | - | False |
| Vlan297 | 10.211.76.0/22_SM1-Wet-Module | OT | - | False |
| Vlan301 | 10.211.80.0/22_SM1-YE/Metrology-Module | OT | - | False |
| Vlan313 | 10.215.88.0/21_SM-Parametric-Test | OT | - | False |
| Vlan327 | 10.211.106.0/24_SM1-AMHS-Controller | OT | - | False |
| Vlan329 | 10.211.108.0/22_SM1-AMHS-WLAN | OT | - | False |
| Vlan4020 | 10.215.17.0/24_S0-MFG-Engineering-Lab | OT | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan253 |  OT  |  -  |  10.211.32.1/21  |  -  |  -  |  -  |  -  |
| Vlan261 |  OT  |  -  |  10.211.40.1/21  |  -  |  -  |  -  |  -  |
| Vlan269 |  OT  |  -  |  10.211.48.1/22  |  -  |  -  |  -  |  -  |
| Vlan273 |  OT  |  -  |  10.211.52.1/22  |  -  |  -  |  -  |  -  |
| Vlan277 |  OT  |  -  |  10.211.56.1/22  |  -  |  -  |  -  |  -  |
| Vlan281 |  OT  |  -  |  10.211.60.1/22  |  -  |  -  |  -  |  -  |
| Vlan285 |  OT  |  -  |  10.211.64.1/22  |  -  |  -  |  -  |  -  |
| Vlan289 |  OT  |  -  |  10.211.68.1/22  |  -  |  -  |  -  |  -  |
| Vlan293 |  OT  |  -  |  10.211.72.1/22  |  -  |  -  |  -  |  -  |
| Vlan297 |  OT  |  -  |  10.211.76.1/22  |  -  |  -  |  -  |  -  |
| Vlan301 |  OT  |  -  |  10.211.80.1/22  |  -  |  -  |  -  |  -  |
| Vlan313 |  OT  |  -  |  10.215.88.1/21  |  -  |  -  |  -  |  -  |
| Vlan327 |  OT  |  -  |  10.211.106.1/24  |  -  |  -  |  -  |  -  |
| Vlan329 |  OT  |  -  |  10.211.108.1/22  |  -  |  -  |  -  |  -  |
| Vlan4020 |  OT  |  -  |  10.215.17.1/24  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  -  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan253
   description 10.211.32.1/21_SM1-AMHS-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.32.1/21
!
interface Vlan261
   description 10.211.40.0/21_SM1-CMP-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.40.1/21
!
interface Vlan269
   description 10.211.48.0/22_SM1-Implant-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.48.1/22
!
interface Vlan273
   description 10.211.52.0/22_SM1-Photo-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.52.1/22
!
interface Vlan277
   description 10.211.56.0/22_SM1-Furnace-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.56.1/22
!
interface Vlan281
   description 10.211.60.0/22_SM1-EPI-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.60.1/22
!
interface Vlan285
   description 10.211.64.1/22_SM1-Plasma-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.64.1/22
!
interface Vlan289
   description 10.211.68.0/22_SM1-ThinFilm-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.68.1/22
!
interface Vlan293
   description 10.211.72.0/22_SM1-RTP-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.72.1/22
!
interface Vlan297
   description 10.211.76.0/22_SM1-Wet-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.76.1/22
!
interface Vlan301
   description 10.211.80.0/22_SM1-YE/Metrology-Module
   no shutdown
   vrf OT
   ip address virtual 10.211.80.1/22
!
interface Vlan313
   description 10.215.88.0/21_SM-Parametric-Test
   no shutdown
   vrf OT
   ip address virtual 10.215.88.1/21
!
interface Vlan327
   description 10.211.106.0/24_SM1-AMHS-Controller
   no shutdown
   vrf OT
   ip address virtual 10.211.106.1/24
!
interface Vlan329
   description 10.211.108.0/22_SM1-AMHS-WLAN
   no shutdown
   vrf OT
   ip address virtual 10.211.108.1/22
!
interface Vlan4020
   description 10.215.17.0/24_S0-MFG-Engineering-Lab
   no shutdown
   vrf OT
   ip address virtual 10.215.17.1/24
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
| 253 | 10253 | - | - |
| 261 | 10261 | - | - |
| 269 | 10269 | - | - |
| 273 | 10273 | - | - |
| 277 | 10277 | - | - |
| 281 | 10281 | - | - |
| 285 | 10285 | - | - |
| 289 | 10289 | - | - |
| 293 | 10293 | - | - |
| 297 | 10297 | - | - |
| 301 | 10301 | - | - |
| 313 | 10313 | - | - |
| 327 | 10327 | - | - |
| 329 | 10329 | - | - |
| 4020 | 14020 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| OT | 5001 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description HS11AOTAGG02A_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 253 vni 10253
   vxlan vlan 261 vni 10261
   vxlan vlan 269 vni 10269
   vxlan vlan 273 vni 10273
   vxlan vlan 277 vni 10277
   vxlan vlan 281 vni 10281
   vxlan vlan 285 vni 10285
   vxlan vlan 289 vni 10289
   vxlan vlan 293 vni 10293
   vxlan vlan 297 vni 10297
   vxlan vlan 301 vni 10301
   vxlan vlan 313 vni 10313
   vxlan vlan 327 vni 10327
   vxlan vlan 329 vni 10329
   vxlan vlan 4020 vni 14020
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
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing ipv6 interfaces
no ip routing vrf mgmt
ip routing vrf OT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
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
| mgmt | 0.0.0.0/0 | 10.211.240.39 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.211.240.39
```

### Router BGP

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.21207 | 172.21.3.17 |

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
| Remote AS | 65120.21207 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.3.1 | 65120.21100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.2 | 65120.21100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.3 | 65120.21100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet49/1 | default | IPv4-UNDERLAY-PEERS | 65120.21100 | - |
| Ethernet50/1 | default | IPv4-UNDERLAY-PEERS | 65120.21100 | - |
| Ethernet51/1 | default | IPv4-UNDERLAY-PEERS | 65120.21100 | - |
| Vlan4093 | default | MLAG-IPv4-UNDERLAY-PEER | 65120.21207 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 253 | 172.21.3.17:10253 | 10253:10253 | - | - | learned |
| 261 | 172.21.3.17:10261 | 10261:10261 | - | - | learned |
| 269 | 172.21.3.17:10269 | 10269:10269 | - | - | learned |
| 273 | 172.21.3.17:10273 | 10273:10273 | - | - | learned |
| 277 | 172.21.3.17:10277 | 10277:10277 | - | - | learned |
| 281 | 172.21.3.17:10281 | 10281:10281 | - | - | learned |
| 285 | 172.21.3.17:10285 | 10285:10285 | - | - | learned |
| 289 | 172.21.3.17:10289 | 10289:10289 | - | - | learned |
| 293 | 172.21.3.17:10293 | 10293:10293 | - | - | learned |
| 297 | 172.21.3.17:10297 | 10297:10297 | - | - | learned |
| 301 | 172.21.3.17:10301 | 10301:10301 | - | - | learned |
| 313 | 172.21.3.17:10313 | 10313:10313 | - | - | learned |
| 327 | 172.21.3.17:10327 | 10327:10327 | - | - | learned |
| 329 | 172.21.3.17:10329 | 10329:10329 | - | - | learned |
| 4020 | 172.21.3.17:14020 | 14020:14020 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| OT | 172.21.3.17:5001 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.21207
   router-id 172.21.3.17
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
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.21207
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description HS11AOTAGG01A
   neighbor MLAG-IPv4-UNDERLAY-PEER password 7 <removed>
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor interface Ethernet49/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21100
   neighbor interface Ethernet50/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21100
   neighbor interface Ethernet51/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21100
   neighbor interface Vlan4093 peer-group MLAG-IPv4-UNDERLAY-PEER remote-as 65120.21207
   neighbor 172.21.3.1 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.1 remote-as 65120.21100
   neighbor 172.21.3.1 description ISMS1OTSP01A
   neighbor 172.21.3.2 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.2 remote-as 65120.21100
   neighbor 172.21.3.2 description ISMS1OTSP02A
   neighbor 172.21.3.3 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.3 remote-as 65120.21100
   neighbor 172.21.3.3 description ISMS1OTSP03A
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 253
      rd 172.21.3.17:10253
      route-target both 10253:10253
      redistribute learned
   !
   vlan 261
      rd 172.21.3.17:10261
      route-target both 10261:10261
      redistribute learned
   !
   vlan 269
      rd 172.21.3.17:10269
      route-target both 10269:10269
      redistribute learned
   !
   vlan 273
      rd 172.21.3.17:10273
      route-target both 10273:10273
      redistribute learned
   !
   vlan 277
      rd 172.21.3.17:10277
      route-target both 10277:10277
      redistribute learned
   !
   vlan 281
      rd 172.21.3.17:10281
      route-target both 10281:10281
      redistribute learned
   !
   vlan 285
      rd 172.21.3.17:10285
      route-target both 10285:10285
      redistribute learned
   !
   vlan 289
      rd 172.21.3.17:10289
      route-target both 10289:10289
      redistribute learned
   !
   vlan 293
      rd 172.21.3.17:10293
      route-target both 10293:10293
      redistribute learned
   !
   vlan 297
      rd 172.21.3.17:10297
      route-target both 10297:10297
      redistribute learned
   !
   vlan 301
      rd 172.21.3.17:10301
      route-target both 10301:10301
      redistribute learned
   !
   vlan 313
      rd 172.21.3.17:10313
      route-target both 10313:10313
      redistribute learned
   !
   vlan 327
      rd 172.21.3.17:10327
      route-target both 10327:10327
      redistribute learned
   !
   vlan 329
      rd 172.21.3.17:10329
      route-target both 10329:10329
      redistribute learned
   !
   vlan 4020
      rd 172.21.3.17:14020
      route-target both 14020:14020
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
   vrf OT
      rd 172.21.3.17:5001
      route-target import evpn 5001:5001
      route-target export evpn 5001:5001
      router-id 172.21.3.17
      redistribute connected
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
| 10 | permit 172.21.3.0/24 eq 32 |
| 20 | permit 10.210.248.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.3.0/24 eq 32
   seq 20 permit 10.210.248.0/24 eq 32
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
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
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
