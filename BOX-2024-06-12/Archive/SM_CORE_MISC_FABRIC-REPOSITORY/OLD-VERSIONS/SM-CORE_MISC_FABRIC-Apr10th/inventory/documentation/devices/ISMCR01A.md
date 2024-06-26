# ISMCR01A

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
| Management0 | oob_management | oob | mgmt | 10.210.80.72/21 | 10.210.80.1 |

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
   ip address 10.210.80.72/21
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
| - | SM-CORE_MISC_FABRIC [MDF1] ISMCR01A | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 0ccf9aa2bda87ceef8666a1a294177b980f13ff1 | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 0ccf9aa2bda87ceef8666a1a294177b980f13ff1 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 0ccf9aa2bda87ceef8666a1a294177b980f13ff1
snmp-server location SM-CORE_MISC_FABRIC [MDF1] ISMCR01A
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
snmp-server user SNMPManager network-admin v3 localized 0ccf9aa2bda87ceef8666a1a294177b980f13ff1 auth sha <removed> priv aes <removed>
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
| 510 | WANFW-TRANSIT-IT-DCVRF | - |
| 525 | WANFW-TRANSIT-ITVRF | - |
| 533 | WANFW-TRANSIT-OTVRF | - |
| 541 | SCADAFW-TRANSIT-ITVRF | - |
| 542 | VENDORFW-TRANSIT-OTVRF | - |
| 633 | IoTFW-TRANSIT-IoTVRF | - |
| 4089 | MLAG_iBGP_IoT | LEAF_PEER_L3 |
| 4090 | MLAG_iBGP_IT | LEAF_PEER_L3 |
| 4091 | MLAG_iBGP_IT-DC | LEAF_PEER_L3 |
| 4092 | MLAG_iBGP_OT | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 510
   name WANFW-TRANSIT-IT-DCVRF
!
vlan 525
   name WANFW-TRANSIT-ITVRF
!
vlan 533
   name WANFW-TRANSIT-OTVRF
!
vlan 541
   name SCADAFW-TRANSIT-ITVRF
!
vlan 542
   name VENDORFW-TRANSIT-OTVRF
!
vlan 633
   name IoTFW-TRANSIT-IoTVRF
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
| Ethernet3/5/1 | [L]_ISMTMGPAN40_Ethernet1/41 | *trunk | *525,510,533 | *- | *- | 351 |
| Ethernet3/48/1 | [L]_MLAG_PEER_ISMCR02A_Ethernet3/48/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet4/5/1 | [L]_ISMTMGPAN41_Ethernet1/42 | *trunk | *525,510,533 | *- | *- | 451 |
| Ethernet4/48/1 | [L]_MLAG_PEER_ISMCR02A_Ethernet4/48/1 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 4094 |
| Ethernet5/1 | [L]_ISMPAN98_Ethernet1/15 | *access | *633 | *- | *- | 51 |
| Ethernet5/2 | [L]_ISMPAN60_Ethernet1/15 | *access | *541 | *- | *- | 52 |
| Ethernet5/3 | [L]_ISMTMGPAN48_Ethernet1/23 | *access | *542 | *- | *- | 53 |
| Ethernet6/1 | [L]_ISMPAN99_Ethernet1/16 | *access | *633 | *- | *- | 61 |
| Ethernet6/2 | [L]_ISMPAN61_Ethernet1/16 | *access | *541 | *- | *- | 62 |
| Ethernet6/3 | [L]_ISMTMGPAN49_Ethernet1/24 | *access | *542 | *- | *- | 63 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet3/1/1.510 | [L]_ISMDC1BL01A-Eth1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet3/1/1.533 | [L]_ISMDC1BL01A-Eth1/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet3/2/1.510 | [L]_ISMDC2BL01A-Eth1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet3/2/1.533 | [L]_ISMDC2BL01A-Eth1/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet3/3/1.525 | [L]_ISMS1ITBL01A-Eth1/1-ITVRF | l3dot1q | - | 525 |
| Ethernet3/3/1.633 | [L]_ISMS1ITBL01A-Eth1/1-IoTVRF | l3dot1q | - | 633 |
| Ethernet3/4/1.525 | [L]_ISMITMSC01A-Eth49/1-ITVRF | l3dot1q | - | 525 |
| Ethernet3/4/1.533 | [L]_ISMITMSC01A-Eth49/1-OTVRF | l3dot1q | - | 533 |
| Ethernet4/1/1.510 | [L]_ISMDC1BL02A-Eth1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet4/1/1.533 | [L]_ISMDC1BL02A-Eth1/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet4/2/1.510 | [L]_ISMDC2BL02A-Eth1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet4/2/1.533 | [L]_ISMDC2BL02A-Eth1/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet4/3/1.525 | [L]_ISMS1ITBL02A-Eth1/1-ITVRF | l3dot1q | - | 525 |
| Ethernet4/3/1.633 | [L]_ISMS1ITBL02A-Eth1/1-IoTVRF | l3dot1q | - | 633 |
| Ethernet4/4/1.525 | [L]_ISMITMSC02A-Eth49/1-ITVRF | l3dot1q | - | 525 |
| Ethernet4/4/1.533 | [L]_ISMITMSC02A-Eth49/1-OTVRF | l3dot1q | - | 533 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3/1/1.510 | [L]_ISMDC1BL01A-Eth1/1-IT-DCVRF | l3dot1q | - | 10.210.226.24/31 | IT-DC | - | False | - | - |
| Ethernet3/1/1.533 | [L]_ISMDC1BL01A-Eth1/1-OT-VRF | l3dot1q | - | 10.210.226.0/31 | OT | - | False | - | - |
| Ethernet3/2/1.510 | [L]_ISMDC2BL01A-Eth1/1-IT-DCVRF | l3dot1q | - | 10.210.234.16/31 | IT-DC | - | False | - | - |
| Ethernet3/2/1.533 | [L]_ISMDC2BL01A-Eth1/1-OT-VRF | l3dot1q | - | 10.210.234.0/31 | OT | - | False | - | - |
| Ethernet3/3/1.525 | [L]_ISMS1ITBL01A-Eth1/1-ITVRF | l3dot1q | - | 10.210.241.0/31 | IT | - | False | - | - |
| Ethernet3/3/1.633 | [L]_ISMS1ITBL01A-Eth1/1-IoTVRF | l3dot1q | - | 10.210.241.8/31 | IoT | - | False | - | - |
| Ethernet3/4/1.525 | [L]_ISMITMSC01A-Eth49/1-ITVRF | l3dot1q | - | 10.210.241.16/31 | IT | - | False | - | - |
| Ethernet3/4/1.533 | [L]_ISMITMSC01A-Eth49/1-OTVRF | l3dot1q | - | 10.210.241.24/31 | OT | - | False | - | - |
| Ethernet4/1/1.510 | [L]_ISMDC1BL02A-Eth1/1-IT-DCVRF | l3dot1q | - | 10.210.226.28/31 | IT-DC | - | False | - | - |
| Ethernet4/1/1.533 | [L]_ISMDC1BL02A-Eth1/1-OT-VRF | l3dot1q | - | 10.210.226.4/31 | OT | - | False | - | - |
| Ethernet4/2/1.510 | [L]_ISMDC2BL02A-Eth1/1-IT-DCVRF | l3dot1q | - | 10.210.234.20/31 | IT-DC | - | False | - | - |
| Ethernet4/2/1.533 | [L]_ISMDC2BL02A-Eth1/1-OT-VRF | l3dot1q | - | 10.210.234.4/31 | OT | - | False | - | - |
| Ethernet4/3/1.525 | [L]_ISMS1ITBL02A-Eth1/1-ITVRF | l3dot1q | - | 10.210.241.4/31 | IT | - | False | - | - |
| Ethernet4/3/1.633 | [L]_ISMS1ITBL02A-Eth1/1-IoTVRF | l3dot1q | - | 10.210.241.12/31 | IoT | - | False | - | - |
| Ethernet4/4/1.525 | [L]_ISMITMSC02A-Eth49/1-ITVRF | l3dot1q | - | 10.210.241.20/31 | IT | - | False | - | - |
| Ethernet4/4/1.533 | [L]_ISMITMSC02A-Eth49/1-OTVRF | l3dot1q | - | 10.210.241.28/31 | OT | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3/1/1
   no shutdown
   no switchport
!
interface Ethernet3/1/1.510
   description [L]_ISMDC1BL01A-Eth1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.24/31
!
interface Ethernet3/1/1.533
   description [L]_ISMDC1BL01A-Eth1/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.0/31
!
interface Ethernet3/2/1
   no shutdown
   no switchport
!
interface Ethernet3/2/1.510
   description [L]_ISMDC2BL01A-Eth1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.234.16/31
!
interface Ethernet3/2/1.533
   description [L]_ISMDC2BL01A-Eth1/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.234.0/31
!
interface Ethernet3/3/1
   no shutdown
   no switchport
!
interface Ethernet3/3/1.525
   description [L]_ISMS1ITBL01A-Eth1/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.0/31
!
interface Ethernet3/3/1.633
   description [L]_ISMS1ITBL01A-Eth1/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.8/31
!
interface Ethernet3/4/1
   no shutdown
   no switchport
!
interface Ethernet3/4/1.525
   description [L]_ISMITMSC01A-Eth49/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.16/31
!
interface Ethernet3/4/1.533
   description [L]_ISMITMSC01A-Eth49/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.24/31
!
interface Ethernet3/5/1
   description [L]_ISMTMGPAN40_Ethernet1/41
   no shutdown
   speed 100g
   channel-group 351 mode active
!
interface Ethernet3/48/1
   description [L]_MLAG_PEER_ISMCR02A_Ethernet3/48/1
   no shutdown
   speed 100g
   channel-group 4094 mode active
!
interface Ethernet4/1/1
   no shutdown
   no switchport
!
interface Ethernet4/1/1.510
   description [L]_ISMDC1BL02A-Eth1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.28/31
!
interface Ethernet4/1/1.533
   description [L]_ISMDC1BL02A-Eth1/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.4/31
!
interface Ethernet4/2/1
   no shutdown
   no switchport
!
interface Ethernet4/2/1.510
   description [L]_ISMDC2BL02A-Eth1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.234.20/31
!
interface Ethernet4/2/1.533
   description [L]_ISMDC2BL02A-Eth1/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.234.4/31
!
interface Ethernet4/3/1
   no shutdown
   no switchport
!
interface Ethernet4/3/1.525
   description [L]_ISMS1ITBL02A-Eth1/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.4/31
!
interface Ethernet4/3/1.633
   description [L]_ISMS1ITBL02A-Eth1/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.12/31
!
interface Ethernet4/4/1
   no shutdown
   no switchport
!
interface Ethernet4/4/1.525
   description [L]_ISMITMSC02A-Eth49/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.20/31
!
interface Ethernet4/4/1.533
   description [L]_ISMITMSC02A-Eth49/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.28/31
!
interface Ethernet4/5/1
   description [L]_ISMTMGPAN41_Ethernet1/42
   no shutdown
   speed 100g
   channel-group 451 mode active
!
interface Ethernet4/48/1
   description [L]_MLAG_PEER_ISMCR02A_Ethernet4/48/1
   no shutdown
   speed 100g
   channel-group 4094 mode active
!
interface Ethernet5/1
   description [L]_ISMPAN98_Ethernet1/15
   no shutdown
   speed 10g
   channel-group 51 mode active
!
interface Ethernet5/2
   description [L]_ISMPAN60_Ethernet1/15
   no shutdown
   speed 25g
   channel-group 52 mode active
!
interface Ethernet5/3
   description [L]_ISMTMGPAN48_Ethernet1/23
   no shutdown
   speed 25g
   channel-group 53 mode active
!
interface Ethernet6/1
   description [L]_ISMPAN99_Ethernet1/16
   no shutdown
   speed 10g
   channel-group 61 mode active
!
interface Ethernet6/2
   description [L]_ISMPAN61_Ethernet1/16
   no shutdown
   speed 25g
   channel-group 62 mode active
!
interface Ethernet6/3
   description [L]_ISMTMGPAN49_Ethernet1/24
   no shutdown
   speed 25g
   channel-group 63 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel51 | [L]_ISMPAN98_MLAG PortChannel to IoT Firewalls | switched | access | 633 | - | - | - | - | 51 | - |
| Port-Channel52 | [L]_ISMPAN60_MLAG PortChannel to SCADA Firewalls | switched | access | 541 | - | - | - | - | 52 | - |
| Port-Channel53 | [L]_ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls | switched | access | 542 | - | - | - | - | 53 | - |
| Port-Channel61 | [L]_ISMPAN99_MLAG PortChannel to IoT Firewalls | switched | access | 633 | - | - | - | - | 61 | - |
| Port-Channel62 | [L]_ISMPAN61_MLAG PortChannel to SCADA Firewalls | switched | access | 541 | - | - | - | - | 62 | - |
| Port-Channel63 | [L]_ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls | switched | access | 542 | - | - | - | - | 63 | - |
| Port-Channel351 | [L]_ISMTMGPAN40_MLAG PortChannel to WAN Firewalls | switched | trunk | 525,510,533 | - | - | - | - | 351 | - |
| Port-Channel451 | [L]_ISMTMGPAN41_MLAG PortChannel to WAN Firewalls | switched | trunk | 525,510,533 | - | - | - | - | 451 | - |
| Port-Channel4094 | [L]_MLAG_PEER_ISMCR02A_Po4094 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel51
   description [L]_ISMPAN98_MLAG PortChannel to IoT Firewalls
   no shutdown
   switchport
   switchport access vlan 633
   mlag 51
   spanning-tree portfast
!
interface Port-Channel52
   description [L]_ISMPAN60_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport access vlan 541
   mlag 52
   spanning-tree portfast
!
interface Port-Channel53
   description [L]_ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport access vlan 542
   mlag 53
   spanning-tree portfast
!
interface Port-Channel61
   description [L]_ISMPAN99_MLAG PortChannel to IoT Firewalls
   no shutdown
   switchport
   switchport access vlan 633
   mlag 61
   spanning-tree portfast
!
interface Port-Channel62
   description [L]_ISMPAN61_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport access vlan 541
   mlag 62
   spanning-tree portfast
!
interface Port-Channel63
   description [L]_ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport access vlan 542
   mlag 63
   spanning-tree portfast
!
interface Port-Channel351
   description [L]_ISMTMGPAN40_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 525,510,533
   switchport mode trunk
   mlag 351
   spanning-tree portfast
!
interface Port-Channel451
   description [L]_ISMTMGPAN41_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 525,510,533
   switchport mode trunk
   mlag 451
   spanning-tree portfast
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ISMCR02A_Po4094
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
| Loopback0 | Router_ID | default | 172.21.0.245/32 |

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
   ip address 172.21.0.245/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan510 | WANFW-TRANSIT-IT-DCVRF | IT-DC | - | False |
| Vlan525 | WANFW-TRANSIT-ITVRF | IT | - | False |
| Vlan533 | WANFW-TRANSIT-OTVRF | OT | - | False |
| Vlan541 | SCADAFW-TRANSIT-ITVRF | IT | - | False |
| Vlan542 | VENDORFW-TRANSIT-OTVRF | OT | - | False |
| Vlan633 | IoTFW-TRANSIT-IoTVRF | IoT | - | False |
| Vlan4089 | MLAG_PEER_L3_iBGP: vrf IoT | IoT | 9214 | False |
| Vlan4090 | MLAG_PEER_L3_iBGP: vrf IT | IT | 9214 | False |
| Vlan4091 | MLAG_PEER_L3_iBGP: vrf IT-DC | IT-DC | 9214 | False |
| Vlan4092 | MLAG_PEER_L3_iBGP: vrf OT | OT | 9214 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan510 |  IT-DC  |  10.210.226.66/29  |  -  |  10.210.226.65  |  -  |  -  |  -  |
| Vlan525 |  IT  |  10.210.241.66/29  |  -  |  10.210.241.65  |  -  |  -  |  -  |
| Vlan533 |  OT  |  10.210.249.66/29  |  -  |  10.210.249.65  |  -  |  -  |  -  |
| Vlan541 |  IT  |  10.210.241.82/29  |  -  |  10.210.241.81  |  -  |  -  |  -  |
| Vlan542 |  OT  |  10.210.249.74/29  |  -  |  10.210.249.73  |  -  |  -  |  -  |
| Vlan633 |  IoT  |  10.210.241.74/29  |  -  |  10.210.241.73  |  -  |  -  |  -  |
| Vlan4089 |  IoT  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4090 |  IT  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4091 |  IT-DC  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4092 |  OT  |  192.168.0.4/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.2/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.0/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan510
   description WANFW-TRANSIT-IT-DCVRF
   no shutdown
   vrf IT-DC
   ip address 10.210.226.66/29
   ip virtual-router address 10.210.226.65
!
interface Vlan525
   description WANFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 10.210.241.66/29
   ip virtual-router address 10.210.241.65
!
interface Vlan533
   description WANFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 10.210.249.66/29
   ip virtual-router address 10.210.249.65
!
interface Vlan541
   description SCADAFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 10.210.241.82/29
   ip virtual-router address 10.210.241.81
!
interface Vlan542
   description VENDORFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 10.210.249.74/29
   ip virtual-router address 10.210.249.73
!
interface Vlan633
   description IoTFW-TRANSIT-IoTVRF
   no shutdown
   vrf IoT
   ip address 10.210.241.74/29
   ip virtual-router address 10.210.241.73
!
interface Vlan4089
   description MLAG_PEER_L3_iBGP: vrf IoT
   no shutdown
   mtu 9214
   vrf IoT
   ip address 192.168.0.4/31
!
interface Vlan4090
   description MLAG_PEER_L3_iBGP: vrf IT
   no shutdown
   mtu 9214
   vrf IT
   ip address 192.168.0.4/31
!
interface Vlan4091
   description MLAG_PEER_L3_iBGP: vrf IT-DC
   no shutdown
   mtu 9214
   vrf IT-DC
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
| 65120.1 | 172.21.0.245 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| timers bgp 5 15 |
| distance bgp 20 200 200 |
| neighbor default send-community |
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

##### DMZFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.98 |
| Maximum routes | 0 (no limit) |

##### IT-BL-EBGP-PEERS-IoTVRF

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
| 192.168.0.3 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IoT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.9 | - | IoT | - | - | - | - | - | - | - | - |
| 10.210.241.13 | - | IoT | - | - | - | - | - | - | - | - |
| 10.210.241.78 | Inherited from peer group DMZFW-EBGP-PEERS | IoT | - | - | Inherited from peer group DMZFW-EBGP-PEERS | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.241.1 | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.5 | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BLLF-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.17 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.21 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - |
| 10.210.241.70 | Inherited from peer group WANFW-EBGP-PEERS | IT | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 10.210.241.86 | Inherited from peer group SCADAFW-EBGP-PEERS | IT | - | - | Inherited from peer group SCADAFW-EBGP-PEERS | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | IT-DC | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.226.25 | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.226.29 | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.226.70 | Inherited from peer group WANFW-EBGP-PEERS | IT-DC | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 10.210.234.17 | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 10.210.234.21 | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF | - | - | - | - | - |
| 192.168.0.5 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | OT | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - |
| 10.210.226.1 | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.226.5 | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.234.1 | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.234.5 | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BLLF-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.241.25 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.241.29 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - |
| 10.210.249.67 | Inherited from peer group WANFW-EBGP-PEERS | OT | - | Inherited from peer group WANFW-EBGP-PEERS | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - |
| 10.210.249.78 | Inherited from peer group VENDORFW-EBGP-PEERS | OT | - | - | Inherited from peer group VENDORFW-EBGP-PEERS | - | - | - | - | - |

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
   router-id 172.21.0.245
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   timers bgp 5 15
   distance bgp 20 200 200
   neighbor default send-community
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
   neighbor DMZFW-EBGP-PEERS peer group
   neighbor DMZFW-EBGP-PEERS remote-as 65120.98
   neighbor DMZFW-EBGP-PEERS password 7 <removed>
   neighbor DMZFW-EBGP-PEERS maximum-routes 0
   neighbor IT-BL-EBGP-PEERS-IoTVRF peer group
   neighbor IT-BL-EBGP-PEERS-IoTVRF remote-as 65120.31200
   neighbor IT-BL-EBGP-PEERS-IoTVRF password 7 <removed>
   neighbor IT-BL-EBGP-PEERS-IoTVRF maximum-routes 0
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
   neighbor MLAG-IPv4-UNDERLAY-PEER description ISMCR02A
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
   neighbor 192.168.0.3 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.3 description ISMCR02A
   redistribute connected
   !
   address-family ipv4
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
      neighbor WANFW-EBGP-PEERS activate
   !
   vrf IoT
      router-id 172.21.0.245
      update wait-install
      neighbor 10.210.241.9 peer group IT-BLLF-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.9 description ISMS1ITBL01A-Eth1/1-IoTVRF
      neighbor 10.210.241.13 peer group IT-BLLF-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.13 description ISMS1ITBL02A-Eth1/1-IoTVRF
      neighbor 10.210.241.78 peer group DMZFW-EBGP-PEERS
      neighbor 10.210.241.78 description DMZFW-VIP-IoTVRF
      neighbor 10.210.241.78 route-map RM-DMZFW-IoT-VRF-OUT out
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.9 activate
         neighbor 10.210.241.13 activate
         neighbor 10.210.241.78 activate
   !
   vrf IT
      router-id 172.21.0.245
      update wait-install
      neighbor 10.210.241.1 peer group IT-BLLF-EBGP-PEERS-ITVRF
      neighbor 10.210.241.1 description ISMS1ITBL01A-Eth1/1-ITVRF
      neighbor 10.210.241.5 peer group IT-BLLF-EBGP-PEERS-ITVRF
      neighbor 10.210.241.5 description ISMS1ITBL02A-Eth1/1-ITVRF
      neighbor 10.210.241.17 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.17 description ISMITMSC01A-Eth49/1-ITVRF
      neighbor 10.210.241.21 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.21 description ISMITMSC02A-Eth49/1-ITVRF
      neighbor 10.210.241.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.241.70 description WANFW-IP-ITVRF
      neighbor 10.210.241.70 route-map RM-IT-10.210.241.70-SET-NEXT-HOP-OUT out
      neighbor 10.210.241.86 peer group SCADAFW-EBGP-PEERS
      neighbor 10.210.241.86 description SCADAFW-IP-ITVRF
      neighbor 10.210.241.86 route-map RM-IT-10.210.241.86-SET-NEXT-HOP-OUT out
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.241.1 activate
         neighbor 10.210.241.5 activate
         neighbor 10.210.241.17 activate
         neighbor 10.210.241.21 activate
         neighbor 10.210.241.70 activate
         neighbor 10.210.241.86 activate
   !
   vrf IT-DC
      router-id 172.21.0.245
      update wait-install
      neighbor 10.210.226.25 peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.25 description DC1-BL1-Eth1/1-IT-DCVRF
      neighbor 10.210.226.29 peer group DC1-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.29 description DC1-BL2-Eth1/1-IT-DCVRF
      neighbor 10.210.226.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.226.70 description WANFW-IP-IT-DCVRF
      neighbor 10.210.226.70 route-map RM-IT-DC-10.210.226.70-SET-NEXT-HOP-OUT out
      neighbor 10.210.234.17 peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.17 description DC2-BL1-Eth1/1-IT-DCVRF
      neighbor 10.210.234.21 peer group DC2-BLLF-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.21 description DC2-BL2-Eth1/1-IT-DCVRF
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.226.25 activate
         neighbor 10.210.226.29 activate
         neighbor 10.210.226.70 activate
         neighbor 10.210.234.17 activate
         neighbor 10.210.234.21 activate
   !
   vrf OT
      router-id 172.21.0.245
      update wait-install
      neighbor 10.210.226.1 peer group DC1-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.226.1 description DC1-BL1-OTVRF
      neighbor 10.210.226.5 peer group DC1-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.226.5 description DC1-BL2-OTVRF
      neighbor 10.210.234.1 peer group DC2-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.234.1 description DC2-BL1-OTVRF
      neighbor 10.210.234.5 peer group DC2-BLLF-EBGP-PEERS-OTVRF
      neighbor 10.210.234.5 description DC2-BL2-OTVRF
      neighbor 10.210.241.25 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.25 description ISMITMSC01A-Eth49/1-OTVRF
      neighbor 10.210.241.29 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.29 description ISMITMSC02A-Eth49/1-OTVRF
      neighbor 10.210.249.67 peer group WANFW-EBGP-PEERS
      neighbor 10.210.249.67 description WANFW-IP-OTVRF
      neighbor 10.210.249.67 route-map RM-OT-10.210.249.67-SET-NEXT-HOP-OUT out
      neighbor 10.210.249.78 peer group VENDORFW-EBGP-PEERS
      neighbor 10.210.249.78 description VENDORFW-IP-OTVRF
      neighbor 10.210.249.78 route-map RM-OT-10.210.249.78-SET-NEXT-HOP-OUT out
      neighbor 192.168.0.5 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
      !
      address-family ipv4
         neighbor 10.210.226.1 activate
         neighbor 10.210.226.5 activate
         neighbor 10.210.234.1 activate
         neighbor 10.210.234.5 activate
         neighbor 10.210.241.25 activate
         neighbor 10.210.241.29 activate
         neighbor 10.210.249.67 activate
         neighbor 10.210.249.78 activate
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

##### PL-DMZFW-DENY-HOST-ROUTES

| Sequence | Action |
| -------- | ------ |
| 10 | deny 0.0.0.0/0 ge 30 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-DMZFW-DENY-HOST-ROUTES
   seq 10 deny 0.0.0.0/0 ge 30
```

### Route-maps

#### Route-maps Summary

##### RM-DMZFW-IoT-VRF-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-DMZFW-DENY-HOST-ROUTES | - | - | - |
| 20 | permit | - | ip next-hop 10.210.241.73 | - | - |

##### RM-IT-10.210.241.70-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.65 | - | - |

##### RM-IT-10.210.241.86-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.81 | - | - |

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

##### RM-OT-10.210.249.78-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.249.73 | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-DMZFW-IoT-VRF-OUT permit 10
   match ip address prefix-list PL-DMZFW-DENY-HOST-ROUTES
!
route-map RM-DMZFW-IoT-VRF-OUT permit 20
   set ip next-hop 10.210.241.73
!
route-map RM-IT-10.210.241.70-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.65
!
route-map RM-IT-10.210.241.86-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.81
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
route-map RM-OT-10.210.249.78-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.249.73
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

## EOS CLI Device Configuration

```eos
!
logging event congestion-drops interval 600
no logging repeat-messages
logging level all debugging
logging event link-status global
service unsupported-transceiver TexasInstruments ffd6c10c

```
