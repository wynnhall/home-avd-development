# IS11JWIT01A

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
- [DHCP Relay](#dhcp-relay)
  - [DHCP Relay Summary](#dhcp-relay-summary)
  - [DHCP Relay Device Configuration](#dhcp-relay-device-configuration)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
  - [SFlow](#sflow)
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
| Management0 | oob_management | oob | mgmt | 10.211.240.14/22 | 10.211.240.1 |

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
   ip address 10.211.240.14/22
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
| Management0 | mgmt |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf mgmt source-interface Management0
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
| Management0 | mgmt |

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
ntp local-interface vrf mgmt Management0
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
| networkpw | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username networkpw privilege 15 role network-admin secret sha512 <removed>
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
| mgmt | Management0 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf mgmt source-interface Management0
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

## DHCP Relay

### DHCP Relay Summary

- DHCP Relay is disabled for tunnelled requests
- DHCP Relay is enabled for MLAG peer-link requests

### DHCP Relay Device Configuration

```eos
!
dhcp relay
   tunnel requests disabled
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
   exec /usr/bin/TerminAttr -cvaddr=10.210.80.7:9910,10.210.80.8:9910,10.210.80.9:9910 -cvauth=token,/tmp/token -cvvrf=mgmt -cvgnmi -disableaaa -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs -cvconfig
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
| mgmt | Management0 |

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
logging vrf mgmt source-interface Management0
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| - | SM_IT_FABRIC IS11JWIT01A | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | f44eb172fb27ca8a384baee2fc8ad6e1caf4d31d | - | - |
| remote | 536E4D705454 | entstrap.itg.ti.com | - |
| remote | 536576306E65406363652424 | sevonenms.itg.ti.com | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Management0 | mgmt |

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
| SNMPManager | network-admin | v3 | sha | aes | - | - | f44eb172fb27ca8a384baee2fc8ad6e1caf4d31d |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local f44eb172fb27ca8a384baee2fc8ad6e1caf4d31d
snmp-server location SM_IT_FABRIC IS11JWIT01A
snmp-server engineID remote entstrap.itg.ti.com 536E4D705454
snmp-server engineID remote sevonenms.itg.ti.com 536576306E65406363652424
snmp-server vrf mgmt local-interface Management0
snmp-server community <removed> rw ENTS-SNMP_Access
snmp-server community <removed> ro ENTS-SNMP_Access
snmp-server community <removed> ro SevOne-SNMP_Access
snmp-server community <removed> ro Statseeker-SNMP_Access
snmp-server community <removed> ro NetBrain-SNMP_Access
snmp-server community <removed> ro Airwave-SNMP_Access
snmp-server community <removed> ro NetDisco-SNMP_Access
snmp-server group network-admin v3 auth
snmp-server group network-operator v3 auth
snmp-server user SNMPManager network-admin v3 localized f44eb172fb27ca8a384baee2fc8ad6e1caf4d31d auth sha <removed> priv aes <removed>
snmp-server enable traps
snmp-server vrf mgmt
```

### SFlow

#### SFlow Summary

| VRF | SFlow Source | SFlow Destination | Port |
| --- | ------------ | ----------------- | ---- |
| mgmt | - | sflowle03 | 6343 |
| mgmt | Management0 | - | - |
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
sflow vrf mgmt source-interface Management0
sflow destination 127.0.0.1
sflow extension bgp
sflow run
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
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

*Inherited from Port-Channel Interface

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet1/1/1 | [L]_P2P_LINK_TO_ISMS1ITSP01A_Ethernet5/2/1 | routed | - | - | default | - | False | - | - | - | - |
| Ethernet1/2/1 | [L]_P2P_LINK_TO_ISMS1ITSP02A_Ethernet5/2/1 | routed | - | - | default | - | False | - | - | - | - |
| Ethernet2/1/1 | [L]_P2P_LINK_TO_ISMS1ITSP03A_Ethernet5/2/1 | routed | - | - | default | - | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/1/1
   description [L]_P2P_LINK_TO_ISMS1ITSP01A_Ethernet5/2/1
   no shutdown
   no switchport
   ipv6 enable
!
interface Ethernet1/2/1
   description [L]_P2P_LINK_TO_ISMS1ITSP02A_Ethernet5/2/1
   no shutdown
   no switchport
   ipv6 enable
!
interface Ethernet2/1/1
   description [L]_P2P_LINK_TO_ISMS1ITSP03A_Ethernet5/2/1
   no shutdown
   no switchport
   ipv6 enable
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.2.12/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.210.240.12/32 |

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
   ip address 172.21.2.12/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.210.240.12/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan224 | 10.211.3.0/23_SM1-AV | IoT | - | False |
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

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan224 |  IoT  |  -  |  10.211.3.1/23  |  -  |  -  |  -  |  -  |
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

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan224
   description 10.211.3.0/23_SM1-AV
   no shutdown
   vrf IoT
   ip address virtual 10.211.3.1/23
   no ip proxy-arp
   no autostate

!
interface Vlan227
   description 10.211.6.0/23_SM1-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.211.6.1/23
   no ip proxy-arp
   no autostate

!
interface Vlan237
   description 10.211.16.0/20_SM1-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.211.16.1/20
   no ip proxy-arp
   no autostate

!
interface Vlan243
   description 10.215.18.0/24_S0-AV
   no shutdown
   vrf IoT
   ip address virtual 10.215.18.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan245
   description 10.215.20.0/24_S0-Security
   no shutdown
   vrf IoT
   ip address virtual 10.215.20.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan247
   description 10.215.22.0/24_S0-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.215.22.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan250
   description 10.215.0.0/20_S0-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.215.0.1/20
   no ip proxy-arp
   no autostate

!
interface Vlan305
   description 10.215.80.0/24_SM-AV
   no shutdown
   vrf IoT
   ip address virtual 10.215.80.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan307
   description 10.215.82.0/24_SM-Security
   no shutdown
   vrf IoT
   ip address virtual 10.215.82.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan309
   description 10.215.84.0/24_SM-BMS
   no shutdown
   vrf IoT
   ip address virtual 10.215.84.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan337
   description 10.215.64.0/20_SM-Wired-LAN
   no shutdown
   vrf IT
   ip address virtual 10.215.64.1/20
   no ip proxy-arp
   no autostate

!
interface Vlan951
   description 10.70.32.0/24_SM-GuestNet(Wired)
   no shutdown
   vrf IT
   ip address virtual 10.70.32.1/24
   no ip proxy-arp
   no autostate

```

### VXLAN Interface

#### VXLAN Interface Summary

| Setting | Value |
| ------- | ----- |
| Source Interface | Loopback1 |
| UDP port | 4789 |

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
   description IS11JWIT01A_VTEP
   vxlan source-interface Loopback1
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
| mgmt | 0.0.0.0/0 | 10.211.240.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.211.240.1
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.31305 | 172.21.2.12 |

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

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.2.1 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.2 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.2.3 | 65120.31100 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet1/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |
| Ethernet1/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |
| Ethernet2/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.31100 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 221 | 172.21.2.12:10221 | 10221:10221 | - | - | learned |
| 224 | 172.21.2.12:10224 | 10224:10224 | - | - | learned |
| 225 | 172.21.2.12:10225 | 10225:10225 | - | - | learned |
| 227 | 172.21.2.12:10227 | 10227:10227 | - | - | learned |
| 237 | 172.21.2.12:10237 | 10237:10237 | - | - | learned |
| 243 | 172.21.2.12:10243 | 10243:10243 | - | - | learned |
| 245 | 172.21.2.12:10245 | 10245:10245 | - | - | learned |
| 247 | 172.21.2.12:10247 | 10247:10247 | - | - | learned |
| 250 | 172.21.2.12:10250 | 10250:10250 | - | - | learned |
| 305 | 172.21.2.12:10305 | 10305:10305 | - | - | learned |
| 307 | 172.21.2.12:10307 | 10307:10307 | - | - | learned |
| 309 | 172.21.2.12:10309 | 10309:10309 | - | - | learned |
| 337 | 172.21.2.12:10337 | 10337:10337 | - | - | learned |
| 951 | 172.21.2.12:10951 | 10951:10951 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IoT | 172.21.2.12:5004 | connected |
| IT | 172.21.2.12:5003 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.31305
   router-id 172.21.2.12
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
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor interface Ethernet1/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
   neighbor interface Ethernet1/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
   neighbor interface Ethernet2/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.31100
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
      rd 172.21.2.12:10221
      route-target both 10221:10221
      redistribute learned
   !
   vlan 224
      rd 172.21.2.12:10224
      route-target both 10224:10224
      redistribute learned
   !
   vlan 225
      rd 172.21.2.12:10225
      route-target both 10225:10225
      redistribute learned
   !
   vlan 227
      rd 172.21.2.12:10227
      route-target both 10227:10227
      redistribute learned
   !
   vlan 237
      rd 172.21.2.12:10237
      route-target both 10237:10237
      redistribute learned
   !
   vlan 243
      rd 172.21.2.12:10243
      route-target both 10243:10243
      redistribute learned
   !
   vlan 245
      rd 172.21.2.12:10245
      route-target both 10245:10245
      redistribute learned
   !
   vlan 247
      rd 172.21.2.12:10247
      route-target both 10247:10247
      redistribute learned
   !
   vlan 250
      rd 172.21.2.12:10250
      route-target both 10250:10250
      redistribute learned
   !
   vlan 305
      rd 172.21.2.12:10305
      route-target both 10305:10305
      redistribute learned
   !
   vlan 307
      rd 172.21.2.12:10307
      route-target both 10307:10307
      redistribute learned
   !
   vlan 309
      rd 172.21.2.12:10309
      route-target both 10309:10309
      redistribute learned
   !
   vlan 337
      rd 172.21.2.12:10337
      route-target both 10337:10337
      redistribute learned
   !
   vlan 951
      rd 172.21.2.12:10951
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
   !
   vrf IoT
      rd 172.21.2.12:5004
      route-target import evpn 5004:5004
      route-target export evpn 5004:5004
      router-id 172.21.2.12
      redistribute connected route-map RM-LOCAL-NETWORKS
   !
   vrf IT
      rd 172.21.2.12:5003
      route-target import evpn 5003:5003
      route-target export evpn 5003:5003
      router-id 172.21.2.12
      redistribute connected route-map RM-LOCAL-NETWORKS
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
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOCAL-NETWORKS

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.208.0.0/13 le 29 |
| 20 | permit 172.21.0.0/22 eq 32 |
| 30 | permit 192.168.160.0/20 eq 32 |

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.2.0/24 eq 32 |
| 20 | permit 10.210.240.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOCAL-NETWORKS
   seq 10 permit 10.208.0.0/13 le 29
   seq 20 permit 172.21.0.0/22 eq 32
   seq 30 permit 192.168.160.0/20 eq 32
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

##### RM-LOCAL-NETWORKS

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS | - | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-LOCAL-NETWORKS permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS
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

## EOS CLI Device Configuration

```eos
!
logging event congestion-drops interval 600
no logging repeat-messages
logging level all debugging
logging event link-status global
service unsupported-transceiver TexasInstruments ffd6c10c

```
