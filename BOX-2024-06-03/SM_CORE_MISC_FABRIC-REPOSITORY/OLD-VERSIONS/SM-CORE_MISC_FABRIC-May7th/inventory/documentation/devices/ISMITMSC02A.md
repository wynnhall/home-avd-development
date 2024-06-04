# ISMITMSC02A

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
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router General](#router-general)
  - [Router BGP](#router-bgp)
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
- [IP DHCP Relay](#ip-dhcp-relay)
  - [IP DHCP Relay](#ip-dhcp-relay-1)
  - [IP DHCP Relay Device Configuration](#ip-dhcp-relay-device-configuration)
- [EOS CLI Device Configuration](#eos-cli-device-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | mgmt | 10.210.80.75/21 | 10.210.80.1 |

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
   ip address 10.210.80.75/21
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
| - | SM-CORE_MISC_FABRIC ISMITMSC02A | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 8a571bede2c6450432f039b9a5227caeaa9d0fcb | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 8a571bede2c6450432f039b9a5227caeaa9d0fcb |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 8a571bede2c6450432f039b9a5227caeaa9d0fcb
snmp-server location SM-CORE_MISC_FABRIC ISMITMSC02A
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
snmp-server user SNMPManager network-admin v3 localized 8a571bede2c6450432f039b9a5227caeaa9d0fcb auth sha <removed> priv aes <removed>
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
| 851 | 10.215.160.0/19_SM-HALEKOA | - |
| 852 | 10.215.192.0/23_SM-MURRAWOLKA | - |
| 862 | 10.72.40.0/24_SM-CPN84 | - |
| 863 | 10.74.56.0/21_SM-EHS | - |
| 971 | 10.70.38.0/23_SM-GUESTNT-WIRELES | - |
| 4090 | MLAG_iBGP_IT | LEAF_PEER_L3 |
| 4092 | MLAG_iBGP_OT | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 851
   name 10.215.160.0/19_SM-HALEKOA
!
vlan 852
   name 10.215.192.0/23_SM-MURRAWOLKA
!
vlan 862
   name 10.72.40.0/24_SM-CPN84
!
vlan 863
   name 10.74.56.0/21_SM-EHS
!
vlan 971
   name 10.70.38.0/23_SM-GUESTNT-WIRELES
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
| Ethernet1 | [L]_OSMAMC01W_Port2 | *trunk | *851,863,971,862,852 | *851 | *- | 1 |
| Ethernet2 | [L]_OSMAMC01W_Port3 | *trunk | *851,863,971,862,852 | *851 | *- | 1 |
| Ethernet3 | [L]_OSMAMC02W_Port2 | *trunk | *851,863,971,862,852 | *851 | *- | 3 |
| Ethernet4 | [L]_OSMAMC02W_Port3 | *trunk | *851,863,971,862,852 | *851 | *- | 3 |
| Ethernet55/1 | [L]_MLAG_PEER_ISMITMSC01A_Ethernet55/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet56/1 | [L]_MLAG_PEER_ISMITMSC01A_Ethernet56/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet49/1.525 | [L]_ISMCR01A-Eth4/4/1-ITVRF | l3dot1q | - | 525 |
| Ethernet49/1.533 | [L]_ISMCR01A-Eth4/4/1-OTVRF | l3dot1q | - | 533 |
| Ethernet49/1.581 | [L]_ISMCR01A-Eth4/4/1-ehsVRF | l3dot1q | - | 581 |
| Ethernet49/1.589 | [L]_ISMCR01A-Eth4/4/1-GnetVRF | l3dot1q | - | 589 |
| Ethernet50/1.525 | [L]_ISMCR02A-Eth4/4/1-ITVRF | l3dot1q | - | 525 |
| Ethernet50/1.533 | [L]_ISMCR02A-Eth4/4/1-OTVRF | l3dot1q | - | 533 |
| Ethernet50/1.581 | [L]_ISMCR02A-Eth4/4/1-ehsVRF | l3dot1q | - | 581 |
| Ethernet50/1.589 | [L]_ISMCR02A-Eth4/4/1-GnetVRF | l3dot1q | - | 589 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet49/1.525 | [L]_ISMCR01A-Eth4/4/1-ITVRF | l3dot1q | - | 10.210.241.20/31 | IT | - | False | - | - |
| Ethernet49/1.533 | [L]_ISMCR01A-Eth4/4/1-OTVRF | l3dot1q | - | 10.210.241.28/31 | OT | - | False | - | - |
| Ethernet49/1.581 | [L]_ISMCR01A-Eth4/4/1-ehsVRF | l3dot1q | - | 10.210.241.37/31 | ehs | - | False | - | - |
| Ethernet49/1.589 | [L]_ISMCR01A-Eth4/4/1-GnetVRF | l3dot1q | - | 10.210.241.45/31 | Gnet | - | False | - | - |
| Ethernet50/1.525 | [L]_ISMCR02A-Eth4/4/1-ITVRF | l3dot1q | - | 10.210.241.22/31 | IT | - | False | - | - |
| Ethernet50/1.533 | [L]_ISMCR02A-Eth4/4/1-OTVRF | l3dot1q | - | 10.210.241.30/31 | OT | - | False | - | - |
| Ethernet50/1.581 | [L]_ISMCR02A-Eth4/4/1-ehsVRF | l3dot1q | - | 10.210.241.39/31 | ehs | - | False | - | - |
| Ethernet50/1.589 | [L]_ISMCR02A-Eth4/4/1-GnetVRF | l3dot1q | - | 10.210.241.47/31 | Gnet | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description [L]_OSMAMC01W_Port2
   no shutdown
   channel-group 1 mode active
!
interface Ethernet2
   description [L]_OSMAMC01W_Port3
   no shutdown
   channel-group 1 mode active
!
interface Ethernet3
   description [L]_OSMAMC02W_Port2
   no shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description [L]_OSMAMC02W_Port3
   no shutdown
   channel-group 3 mode active
!
interface Ethernet49/1
   no shutdown
   no switchport
!
interface Ethernet49/1.525
   description [L]_ISMCR01A-Eth4/4/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.20/31
!
interface Ethernet49/1.533
   description [L]_ISMCR01A-Eth4/4/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.28/31
!
interface Ethernet49/1.581
   description [L]_ISMCR01A-Eth4/4/1-ehsVRF
   no shutdown
   encapsulation dot1q vlan 581
   vrf ehs
   ip address 10.210.241.37/31
!
interface Ethernet49/1.589
   description [L]_ISMCR01A-Eth4/4/1-GnetVRF
   no shutdown
   encapsulation dot1q vlan 589
   vrf Gnet
   ip address 10.210.241.45/31
!
interface Ethernet50/1
   no shutdown
   no switchport
!
interface Ethernet50/1.525
   description [L]_ISMCR02A-Eth4/4/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.22/31
!
interface Ethernet50/1.533
   description [L]_ISMCR02A-Eth4/4/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.30/31
!
interface Ethernet50/1.581
   description [L]_ISMCR02A-Eth4/4/1-ehsVRF
   no shutdown
   encapsulation dot1q vlan 581
   vrf ehs
   ip address 10.210.241.39/31
!
interface Ethernet50/1.589
   description [L]_ISMCR02A-Eth4/4/1-GnetVRF
   no shutdown
   encapsulation dot1q vlan 589
   vrf Gnet
   ip address 10.210.241.47/31
!
interface Ethernet55/1
   description [L]_MLAG_PEER_ISMITMSC01A_Ethernet55/1
   no shutdown
   speed 100g
   channel-group 4094 mode active
!
interface Ethernet56/1
   description [L]_MLAG_PEER_ISMITMSC01A_Ethernet56/1
   no shutdown
   speed 100g
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel1 | [L]_OSMAMC01W_Po | switched | trunk | 851,863,971,862,852 | 851 | - | - | - | 1 | - |
| Port-Channel3 | [L]_OSMAMC02W_Po | switched | trunk | 851,863,971,862,852 | 851 | - | - | - | 3 | - |
| Port-Channel4094 | [L]_MLAG_PEER_ISMITMSC01A_Po4094 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description [L]_OSMAMC01W_Po
   no shutdown
   mtu 1500
   switchport
   switchport trunk allowed vlan 851,863,971,862,852
   switchport trunk native vlan 851
   switchport mode trunk
   mlag 1
!
interface Port-Channel3
   description [L]_OSMAMC02W_Po
   no shutdown
   mtu 1500
   switchport
   switchport trunk allowed vlan 851,863,971,862,852
   switchport trunk native vlan 851
   switchport mode trunk
   mlag 3
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ISMITMSC01A_Po4094
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
| Loopback0 | Router_ID | default | 172.21.0.242/32 |

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
   ip address 172.21.0.242/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan851 | 10.215.160.0/19_SM-HALEKOA | IT | - | False |
| Vlan852 | 10.215.192.0/23_SM-MURRAWOLKA | OT | - | False |
| Vlan862 | 10.72.40.0/24_SM-CPN84 | ehs | - | False |
| Vlan863 | 10.74.56.0/21_SM-EHS | ehs | - | False |
| Vlan971 | 10.70.38.0/23_SM-GUESTNT-WIRELES | Gnet | - | False |
| Vlan4090 | MLAG_PEER_L3_iBGP: vrf IT | IT | 9214 | False |
| Vlan4092 | MLAG_PEER_L3_iBGP: vrf OT | OT | 9214 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan851 |  IT  |  10.215.160.3/19  |  -  |  10.215.160.1  |  -  |  -  |  -  |
| Vlan852 |  OT  |  10.215.192.3/23  |  -  |  10.215.192.1  |  -  |  -  |  -  |
| Vlan862 |  ehs  |  10.72.40.3/24  |  -  |  10.72.40.1  |  -  |  -  |  -  |
| Vlan863 |  ehs  |  10.74.56.3/21  |  -  |  10.74.56.1  |  -  |  -  |  -  |
| Vlan971 |  Gnet  |  10.70.38.3/23  |  -  |  10.70.38.1  |  -  |  -  |  -  |
| Vlan4090 |  IT  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4092 |  OT  |  192.168.0.5/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.3/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan851
   description 10.215.160.0/19_SM-HALEKOA
   no shutdown
   vrf IT
   ip address 10.215.160.3/19
   ip virtual-router address 10.215.160.1
   no ip proxy-arp
   no autostate

!
interface Vlan852
   description 10.215.192.0/23_SM-MURRAWOLKA
   no shutdown
   vrf OT
   ip address 10.215.192.3/23
   ip virtual-router address 10.215.192.1
   no ip proxy-arp
   no autostate

!
interface Vlan862
   description 10.72.40.0/24_SM-CPN84
   no shutdown
   vrf ehs
   ip address 10.72.40.3/24
   ip helper-address 137.167.66.10 vrf default source-interface Loopback0
   ip helper-address 172.16.44.9 vrf default source-interface Loopback0
   ip virtual-router address 10.72.40.1
   no ip proxy-arp
   no autostate

!
interface Vlan863
   description 10.74.56.0/21_SM-EHS
   no shutdown
   vrf ehs
   ip address 10.74.56.3/21
   ip helper-address 137.167.66.10 vrf default source-interface Loopback0
   ip helper-address 172.16.44.9 vrf default source-interface Loopback0
   ip virtual-router address 10.74.56.1
   no ip proxy-arp
   no autostate

!
interface Vlan971
   description 10.70.38.0/23_SM-GUESTNT-WIRELES
   no shutdown
   vrf Gnet
   ip address 10.70.38.3/23
   ip virtual-router address 10.70.38.1
   no ip proxy-arp
   no autostate

!
interface Vlan4090
   description MLAG_PEER_L3_iBGP: vrf IT
   no shutdown
   mtu 9214
   vrf IT
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
| ehs | True |
| Gnet | True |
| IT | True |
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf ehs
ip routing vrf Gnet
ip routing vrf IT
no ip routing vrf mgmt
ip routing vrf OT
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| ehs | false |
| Gnet | false |
| IT | false |
| mgmt | false |
| OT | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| mgmt | 0.0.0.0/0 | 10.210.80.1 | - | 1 | - | - | - |
| IT | 10.4.12.119/32 | 137.167.10.129 | - | 1 | - | Gnet-Captive-Portal | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.210.80.1
ip route vrf IT 10.4.12.119/32 137.167.10.129 name Gnet-Captive-Portal
```

### Router General

#### VRF Route leaking

| VRF | Source VRF | Route Map Policy |
|-----|------------|------------------|
| IT | Gnet | RM-guest-net |
| Gnet | IT | RM-captive-portal |

#### Router General Device Configuration

```eos
!
router general
   vrf Gnet
      leak routes source-vrf IT subscribe-policy RM-captive-portal
      exit
   !
   vrf IT
      leak routes source-vrf Gnet subscribe-policy RM-guest-net
      exit
   !
   exit
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.10 | 172.21.0.242 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| timers bgp 5 15 |
| distance bgp 20 200 200 |
| neighbor default send-community |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 128 ecmp 128 |

#### Router BGP Peer Groups

##### CAMPUS-CORES-EBGP-PEERS-ehsVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CAMPUS-CORES-EBGP-PEERS-GnetVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CAMPUS-CORES-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CAMPUS-CORES-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |

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
| 192.168.0.2 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.210.241.36 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF | ehs | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF | - | - | - | - | - | - |
| 10.210.241.38 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF | ehs | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF | - | - | - | - | - | - |
| 10.210.241.44 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF | Gnet | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF | - | - | - | - | - | - |
| 10.210.241.46 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF | Gnet | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF | - | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.210.241.21 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 10.210.241.23 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 192.168.0.4 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | OT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.210.241.29 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.241.31 | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group CAMPUS-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| ehs | - | connected |
| Gnet | - | connected |
| IT | - | connected<br>static |
| OT | - | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.10
   router-id 172.21.0.242
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   timers bgp 5 15
   distance bgp 20 200 200
   neighbor default send-community
   neighbor CAMPUS-CORES-EBGP-PEERS-ehsVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-ehsVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-ehsVRF maximum-routes 0
   neighbor CAMPUS-CORES-EBGP-PEERS-GnetVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-GnetVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-GnetVRF maximum-routes 0
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF peer group
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF remote-as 65120.1
   neighbor CAMPUS-CORES-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.10
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ISMITMSC01A
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor 192.168.0.2 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.2 description ISMITMSC01A
   redistribute connected route-map RM-LOCAL-NETWORKS
   !
   address-family ipv4
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf ehs
      router-id 172.21.0.242
      update wait-install
      neighbor 10.210.241.36 peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF
      neighbor 10.210.241.36 description ISMCR01A-Eth4/4/1-ehsVRF
      neighbor 10.210.241.38 peer group CAMPUS-CORES-EBGP-PEERS-ehsVRF
      neighbor 10.210.241.38 description ISMCR02A-Eth4/4/1-ehsVRF
      redistribute connected route-map RM-LOCAL-NETWORKS-ehsVRF
      !
      address-family ipv4
         neighbor 10.210.241.36 activate
         neighbor 10.210.241.38 activate
   !
   vrf Gnet
      router-id 172.21.0.242
      update wait-install
      neighbor 10.210.241.44 peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF
      neighbor 10.210.241.44 description ISMCR01A-Eth4/4/1-GnetVRF
      neighbor 10.210.241.46 peer group CAMPUS-CORES-EBGP-PEERS-GnetVRF
      neighbor 10.210.241.46 description ISMCR02A-Eth4/4/1-GnetVRF
      redistribute connected route-map RM-LOCAL-NETWORKS-GnetVRF
      !
      address-family ipv4
         neighbor 10.210.241.44 activate
         neighbor 10.210.241.46 activate
   !
   vrf IT
      router-id 172.21.0.242
      update wait-install
      neighbor 10.210.241.21 peer group CAMPUS-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.21 description ISMCR01A-Eth4/4/1-ITVRF
      neighbor 10.210.241.23 peer group CAMPUS-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.23 description ISMCR02A-Eth4/4/1-ITVRF
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected route-map RM-LOCAL-NETWORKS-ITVRF
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.241.21 activate
         neighbor 10.210.241.23 activate
   !
   vrf OT
      router-id 172.21.0.242
      update wait-install
      neighbor 10.210.241.29 peer group CAMPUS-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.29 description ISMCR01A-Eth4/4/1-OTVRF
      neighbor 10.210.241.31 peer group CAMPUS-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.31 description ISMCR02A-Eth4/4/1-OTVRF
      neighbor 192.168.0.4 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected route-map RM-LOCAL-NETWORKS-OTVRF
      !
      address-family ipv4
         neighbor 10.210.241.29 activate
         neighbor 10.210.241.31 activate
   !
   no neighbor IPv4-UNDERLAY-PEERS peer group
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

##### PL-captive-portal

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.4.12.119/32 |

##### PL-guest-net

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.70.38.0/23 |

##### PL-LOCAL-NETWORKS

| Sequence | Action |
| -------- | ------ |

##### PL-LOCAL-NETWORKS-ehsVRF

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.74.56.0/21 |
| 20 | permit 10.72.40.0/24 |

##### PL-LOCAL-NETWORKS-GnetVRF

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.70.38.0/23 |

##### PL-LOCAL-NETWORKS-ITVRF

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.215.160.0/19 |

##### PL-LOCAL-NETWORKS-OTVRF

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.215.192.0/23 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-captive-portal
   seq 10 permit 10.4.12.119/32
!
ip prefix-list PL-guest-net
   seq 10 permit 10.70.38.0/23
!
ip prefix-list PL-LOCAL-NETWORKS
!
ip prefix-list PL-LOCAL-NETWORKS-ehsVRF
   seq 10 permit 10.74.56.0/21
   seq 20 permit 10.72.40.0/24
!
ip prefix-list PL-LOCAL-NETWORKS-GnetVRF
   seq 10 permit 10.70.38.0/23
!
ip prefix-list PL-LOCAL-NETWORKS-ITVRF
   seq 10 permit 10.215.160.0/19
!
ip prefix-list PL-LOCAL-NETWORKS-OTVRF
   seq 10 permit 10.215.192.0/23
```

### Route-maps

#### Route-maps Summary

##### RM-captive-portal

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-captive-portal | distance 10 | - | - |

##### RM-guest-net

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-guest-net | distance 10 | - | - |

##### RM-LOCAL-NETWORKS

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS | - | - | - |

##### RM-LOCAL-NETWORKS-ehsVRF

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS-ehsVRF | - | - | - |

##### RM-LOCAL-NETWORKS-ITVRF

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS-ITVRF | - | - | - |

##### RM-LOCAL-NETWORKS-OTVRF

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS-OTVRF | - | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-captive-portal permit 10
   match ip address prefix-list PL-captive-portal
   set distance 10
!
route-map RM-guest-net permit 10
   match ip address prefix-list PL-guest-net
   set distance 10
!
route-map RM-LOCAL-NETWORKS permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS
!
route-map RM-LOCAL-NETWORKS-ehsVRF permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS-ehsVRF
!
route-map RM-LOCAL-NETWORKS-ITVRF permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS-ITVRF
!
route-map RM-LOCAL-NETWORKS-OTVRF permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS-OTVRF
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
| ehs | enabled |
| Gnet | enabled |
| IT | enabled |
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance ehs
!
vrf instance Gnet
!
vrf instance IT
!
vrf instance mgmt
!
vrf instance OT
```

## IP DHCP Relay

### IP DHCP Relay

IP DHCP Relay Option 82 is enabled.

### IP DHCP Relay Device Configuration

```eos
!
ip dhcp relay information option
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
