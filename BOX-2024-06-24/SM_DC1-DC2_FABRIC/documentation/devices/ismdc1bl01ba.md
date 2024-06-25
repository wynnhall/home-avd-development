# ismdc1bl01ba

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
| Management1 | oob_management | oob | mgmt | 10.210.80.14/21 | 10.210.80.1 |

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
   ip address 10.210.80.14/21
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
| tacacs_servers | tacacs+ | mgmt | 172.31.225.29 |
| tacacs_servers | tacacs+ | mgmt | 172.31.226.32 |

#### AAA Server Groups Device Configuration

```eos
!
aaa group server tacacs+ tacacs_servers
   server 172.31.225.29 vrf mgmt
   server 172.31.226.32 vrf mgmt
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
| - | SM_DC1-DC2_FABRIC SM_DC1_FABRIC ismdc1bl01ba | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | a6c4d7d94e3c0a6ae02777308c011493fb60d868 | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | a6c4d7d94e3c0a6ae02777308c011493fb60d868 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local a6c4d7d94e3c0a6ae02777308c011493fb60d868
snmp-server location SM_DC1-DC2_FABRIC SM_DC1_FABRIC ismdc1bl01ba
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
snmp-server user SNMPManager network-admin v3 localized a6c4d7d94e3c0a6ae02777308c011493fb60d868 auth sha <removed> priv aes <removed>
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
| 238 | 10.210.18.0/24-NAS-ST-PUB-OT | - |
| 239 | 10.210.19.0/24-NAS-ST-PUB-IT-DC | - |
| 323 | 10.210.103.0/28-DC-METROCL-INTCL | - |
| 355 | 10.210.103.32/27-ORCLERAC-PRVNET | - |
| 451 | 10.210.103.128/27-GAD-PNET-iSCSI | - |
| 1012 | 10.210.0.0/21-VCF-WL-Edge-TEP | - |
| 1013 | 10.210.8.0/21-VCF-WL-Host-TEP | - |
| 1014 | 10.210.16.0/24-VCF-MU-Edge-TEP | - |
| 1015 | 10.210.17.0/24-VCF-MU-Host-TEP | - |
| 1016 | 10.210.100.0/24-VCF-MDOMAIN-VSAN | - |
| 1017 | 10.210.106.0/24-VCF-WD-ESXI-MGMT | - |
| 1018 | 10.210.107.0/24-VC-MD-ESXI-MGMT | - |
| 1019 | 10.210.108.0/23-VCF-WD-VMOTION | - |
| 1020 | 10.210.110.0/24-VCF-MD-VMOTION | - |
| 1021 | 10.210.111.0/24-VMWare-FT | - |
| 4093 | LEAF_PEER_L3 | MLAG |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 238
   name 10.210.18.0/24-NAS-ST-PUB-OT
!
vlan 239
   name 10.210.19.0/24-NAS-ST-PUB-IT-DC
!
vlan 323
   name 10.210.103.0/28-DC-METROCL-INTCL
!
vlan 355
   name 10.210.103.32/27-ORCLERAC-PRVNET
!
vlan 451
   name 10.210.103.128/27-GAD-PNET-iSCSI
!
vlan 1012
   name 10.210.0.0/21-VCF-WL-Edge-TEP
!
vlan 1013
   name 10.210.8.0/21-VCF-WL-Host-TEP
!
vlan 1014
   name 10.210.16.0/24-VCF-MU-Edge-TEP
!
vlan 1015
   name 10.210.17.0/24-VCF-MU-Host-TEP
!
vlan 1016
   name 10.210.100.0/24-VCF-MDOMAIN-VSAN
!
vlan 1017
   name 10.210.106.0/24-VCF-WD-ESXI-MGMT
!
vlan 1018
   name 10.210.107.0/24-VC-MD-ESXI-MGMT
!
vlan 1019
   name 10.210.108.0/23-VCF-WD-VMOTION
!
vlan 1020
   name 10.210.110.0/24-VCF-MD-VMOTION
!
vlan 1021
   name 10.210.111.0/24-VMWare-FT
!
vlan 4093
   name LEAF_PEER_L3
   trunk group MLAG
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

- Default Routed Interface MTU: 9236

#### Interface Defaults Device Configuration

```eos
!
interface defaults
   ethernet
      shutdown
   mtu 9236
```

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet31/1 | [L]_MLAG_PEER_ismdc1bl01aa_Ethernet31/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet32/1 | [L]_MLAG_PEER_ismdc1bl01aa_Ethernet32/1 | *trunk | *- | *- | *['MLAG'] | 4094 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet1/1.510 | [L]_ismcr01a-Eth4/1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet1/1.533 | [L]_ismcr01a-Eth4/1/1-OTVRF | l3dot1q | - | 533 |
| Ethernet2/1.510 | [L]_ismcr02a-Eth4/1/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet2/1.533 | [L]_ismcr02a-Eth4/1/1-OTVRF | l3dot1q | - | 533 |
| Ethernet5/1.533 | [L]_isms1otbl01aa-Eth2/1-OTVRF | l3dot1q | - | 533 |
| Ethernet6/1.533 | [L]_isms1otbl01ba-Eth2/1-OTVRF | l3dot1q | - | 533 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1/1.510 | [L]_ismcr01a-Eth4/1/1-IT-DCVRF | l3dot1q | - | 10.210.226.29/31 | IT-DC | - | False | - | - |
| Ethernet1/1.533 | [L]_ismcr01a-Eth4/1/1-OTVRF | l3dot1q | - | 10.210.226.5/31 | OT | - | False | - | - |
| Ethernet2/1.510 | [L]_ismcr02a-Eth4/1/1-IT-DCVRF | l3dot1q | - | 10.210.226.31/31 | IT-DC | - | False | - | - |
| Ethernet2/1.533 | [L]_ismcr02a-Eth4/1/1-OTVRF | l3dot1q | - | 10.210.226.7/31 | OT | - | False | - | - |
| Ethernet3/1 | P2P_LINK_TO_ismdc2bl01aa_Ethernet4/1 | routed | - | 10.210.226.12/31 | default | 9214 | False | - | - |
| Ethernet4/1 | P2P_LINK_TO_ismdc2bl01ba_Ethernet4/1 | routed | - | 10.210.226.14/31 | default | 9214 | False | - | - |
| Ethernet5/1.533 | [L]_isms1otbl01aa-Eth2/1-OTVRF | l3dot1q | - | 10.210.226.21/31 | OT | - | False | - | - |
| Ethernet6/1.533 | [L]_isms1otbl01ba-Eth2/1-OTVRF | l3dot1q | - | 10.210.226.23/31 | OT | - | False | - | - |

##### IPv6

| Interface | Description | Type | Channel Group | IPv6 Address | VRF | MTU | Shutdown | ND RA Disabled | Managed Config Flag | IPv6 ACL In | IPv6 ACL Out |
| --------- | ----------- | ---- | --------------| ------------ | --- | --- | -------- | -------------- | -------------------| ----------- | ------------ |
| Ethernet25/1 | [L]_P2P_LINK_TO_ISMDC1SP01A_Ethernet2/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet26/1 | [L]_P2P_LINK_TO_ISMDC1SP02A_Ethernet2/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet27/1 | [L]_P2P_LINK_TO_ISMDC1SP03A_Ethernet2/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1/1
   no shutdown
   no switchport
!
interface Ethernet1/1.510
   description [L]_ismcr01a-Eth4/1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.29/31
!
interface Ethernet1/1.533
   description [L]_ismcr01a-Eth4/1/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.5/31
!
interface Ethernet2/1
   no shutdown
   no switchport
!
interface Ethernet2/1.510
   description [L]_ismcr02a-Eth4/1/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.31/31
!
interface Ethernet2/1.533
   description [L]_ismcr02a-Eth4/1/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.7/31
!
interface Ethernet3/1
   description P2P_LINK_TO_ismdc2bl01aa_Ethernet4/1
   no shutdown
   mtu 9214
   no switchport
   ip address 10.210.226.12/31
!
interface Ethernet4/1
   description P2P_LINK_TO_ismdc2bl01ba_Ethernet4/1
   no shutdown
   mtu 9214
   no switchport
   ip address 10.210.226.14/31
!
interface Ethernet5/1
   no shutdown
   no switchport
!
interface Ethernet5/1.533
   description [L]_isms1otbl01aa-Eth2/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.21/31
!
interface Ethernet6/1
   no shutdown
   no switchport
!
interface Ethernet6/1.533
   description [L]_isms1otbl01ba-Eth2/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.23/31
!
interface Ethernet25/1
   description [L]_P2P_LINK_TO_ISMDC1SP01A_Ethernet2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet26/1
   description [L]_P2P_LINK_TO_ISMDC1SP02A_Ethernet2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet27/1
   description [L]_P2P_LINK_TO_ISMDC1SP03A_Ethernet2/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet31/1
   description [L]_MLAG_PEER_ismdc1bl01aa_Ethernet31/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet32/1
   description [L]_MLAG_PEER_ismdc1bl01aa_Ethernet32/1
   no shutdown
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel4094 | [L]_MLAG_PEER_ismdc1bl01aa_Po311 | switched | trunk | - | - | ['MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ismdc1bl01aa_Po311
   no shutdown
   switchport
   switchport mode trunk
   switchport trunk group MLAG
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.0.25/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.210.224.24/32 |

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
   ip address 172.21.0.25/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.210.224.24/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan238 | 10.210.18.0/24-NAS-ST-PUB-OT | OT | - | False |
| Vlan239 | 10.210.19.0/24-NAS-ST-PUB-IT-DC | IT-DC | - | False |
| Vlan323 | 10.210.103.0/28-DC-METROCL-INTCL | IT-DC | - | False |
| Vlan355 | 10.210.103.32/27-ORCLERAC-PRVNET | IT-DC | - | False |
| Vlan451 | 10.210.103.128/27-GAD-PNET-iSCSI | IT-DC | - | False |
| Vlan1012 | 10.210.0.0/21-VCF-WL-Edge-TEP | IT-DC | - | False |
| Vlan1013 | 10.210.8.0/21-VCF-WL-Host-TEP | IT-DC | - | False |
| Vlan1014 | 10.210.16.0/24-VCF-MU-Edge-TEP | IT-DC | - | False |
| Vlan1015 | 10.210.17.0/24-VCF-MU-Host-TEP | IT-DC | - | False |
| Vlan1016 | 10.210.100.0/24-VCF-MDOMAIN-VSAN | IT-DC | - | False |
| Vlan1017 | 10.210.106.0/24-VCF-WD-ESXI-MGMT | IT-DC | - | False |
| Vlan1018 | 10.210.107.0/24-VC-MD-ESXI-MGMT | IT-DC | - | False |
| Vlan1019 | 10.210.108.0/23-VCF-WD-VMOTION | IT-DC | - | False |
| Vlan1020 | 10.210.110.0/24-VCF-MD-VMOTION | IT-DC | - | False |
| Vlan1021 | 10.210.111.0/24-VMWare-FT | IT-DC | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan238 |  OT  |  -  |  10.210.18.1/24  |  -  |  -  |  -  |  -  |
| Vlan239 |  IT-DC  |  -  |  10.210.19.1/24  |  -  |  -  |  -  |  -  |
| Vlan323 |  IT-DC  |  -  |  10.210.103.1/28  |  -  |  -  |  -  |  -  |
| Vlan355 |  IT-DC  |  -  |  10.210.103.33/27  |  -  |  -  |  -  |  -  |
| Vlan451 |  IT-DC  |  -  |  10.210.103.129/27  |  -  |  -  |  -  |  -  |
| Vlan1012 |  IT-DC  |  -  |  10.210.0.1/21  |  -  |  -  |  -  |  -  |
| Vlan1013 |  IT-DC  |  -  |  10.210.8.1/21  |  -  |  -  |  -  |  -  |
| Vlan1014 |  IT-DC  |  -  |  10.210.16.1/24  |  -  |  -  |  -  |  -  |
| Vlan1015 |  IT-DC  |  -  |  10.210.17.1/24  |  -  |  -  |  -  |  -  |
| Vlan1016 |  IT-DC  |  -  |  10.210.100.1/24  |  -  |  -  |  -  |  -  |
| Vlan1017 |  IT-DC  |  -  |  10.210.106.1/24  |  -  |  -  |  -  |  -  |
| Vlan1018 |  IT-DC  |  -  |  10.210.107.1/24  |  -  |  -  |  -  |  -  |
| Vlan1019 |  IT-DC  |  -  |  10.210.108.1/23  |  -  |  -  |  -  |  -  |
| Vlan1020 |  IT-DC  |  -  |  10.210.110.1/24  |  -  |  -  |  -  |  -  |
| Vlan1021 |  IT-DC  |  -  |  10.210.111.1/24  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  -  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan238
   description 10.210.18.0/24-NAS-ST-PUB-OT
   no shutdown
   vrf OT
   ip address virtual 10.210.18.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan239
   description 10.210.19.0/24-NAS-ST-PUB-IT-DC
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.19.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan323
   description 10.210.103.0/28-DC-METROCL-INTCL
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.103.1/28
   no ip proxy-arp
   no autostate

!
interface Vlan355
   description 10.210.103.32/27-ORCLERAC-PRVNET
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.103.33/27
   no ip proxy-arp
   no autostate

!
interface Vlan451
   description 10.210.103.128/27-GAD-PNET-iSCSI
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.103.129/27
   no ip proxy-arp
   no autostate

!
interface Vlan1012
   description 10.210.0.0/21-VCF-WL-Edge-TEP
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.0.1/21
   no ip proxy-arp
   no autostate

!
interface Vlan1013
   description 10.210.8.0/21-VCF-WL-Host-TEP
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.8.1/21
   no ip proxy-arp
   no autostate

!
interface Vlan1014
   description 10.210.16.0/24-VCF-MU-Edge-TEP
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.16.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1015
   description 10.210.17.0/24-VCF-MU-Host-TEP
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.17.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1016
   description 10.210.100.0/24-VCF-MDOMAIN-VSAN
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.100.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1017
   description 10.210.106.0/24-VCF-WD-ESXI-MGMT
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.106.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1018
   description 10.210.107.0/24-VC-MD-ESXI-MGMT
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.107.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1019
   description 10.210.108.0/23-VCF-WD-VMOTION
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.108.1/23
   no ip proxy-arp
   no autostate

!
interface Vlan1020
   description 10.210.110.0/24-VCF-MD-VMOTION
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.110.1/24
   no ip proxy-arp
   no autostate

!
interface Vlan1021
   description 10.210.111.0/24-VMWare-FT
   no shutdown
   vrf IT-DC
   ip address virtual 10.210.111.1/24
   no ip proxy-arp
   no autostate

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
| 239 | 10239 | - | - |
| 323 | 10323 | - | - |
| 355 | 10355 | - | - |
| 451 | 10451 | - | - |
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

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| IT-DC | 5002 | - |
| OT | 5001 | - |

#### VXLAN Interface Device Configuration

```eos
!
interface Vxlan1
   description ismdc1bl01ba_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 238 vni 10238
   vxlan vlan 239 vni 10239
   vxlan vlan 323 vni 10323
   vxlan vlan 355 vni 10355
   vxlan vlan 451 vni 10451
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
no ip icmp redirect
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

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.11200 | 172.21.0.25 |

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

##### CORES-EBGP-PEERS-IT-DCVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### CORES-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.1 |
| Maximum routes | 0 (no limit) |

##### EVPN-OVERLAY-CORE

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 15 |
| Send community | all |
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
| Remote AS | 65120.11200 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

##### S1-OT-BL-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.21200 |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 172.21.0.1 | 65120 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.0.2 | 65120 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.0.3 | 65120 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.1.24 | 65120.12200 | default | - | Inherited from peer group EVPN-OVERLAY-CORE | Inherited from peer group EVPN-OVERLAY-CORE | - | Inherited from peer group EVPN-OVERLAY-CORE | - | - | - | - |
| 172.21.1.25 | 65120.12200 | default | - | Inherited from peer group EVPN-OVERLAY-CORE | Inherited from peer group EVPN-OVERLAY-CORE | - | Inherited from peer group EVPN-OVERLAY-CORE | - | - | - | - |
| 10.210.226.28 | Inherited from peer group CORES-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group CORES-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.226.30 | Inherited from peer group CORES-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group CORES-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.226.4 | Inherited from peer group CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.226.6 | Inherited from peer group CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.226.20 | Inherited from peer group S1-OT-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group S1-OT-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.226.22 | Inherited from peer group S1-OT-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group S1-OT-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet25/1 | default | IPv4-UNDERLAY-PEERS | 65120 | - |
| Ethernet26/1 | default | IPv4-UNDERLAY-PEERS | 65120 | - |
| Ethernet27/1 | default | IPv4-UNDERLAY-PEERS | 65120 | - |
| Vlan4093 | default | MLAG-IPv4-UNDERLAY-PEER | 65120.11200 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-CORE | True | default |
| EVPN-OVERLAY-PEERS | True | default |

##### EVPN DCI Gateway Summary

| Settings | Value |
| -------- | ----- |
| Remote Domain Peer Groups | EVPN-OVERLAY-CORE |
| L3 Gateway Configured | True |
| L3 Gateway Inter-domain | True |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 238 | 172.21.0.25:10238 | 10238:10238<br>remote 10238:10238 | - | - | learned |
| 239 | 172.21.0.25:10239 | 10239:10239<br>remote 10239:10239 | - | - | learned |
| 323 | 172.21.0.25:10323 | 10323:10323<br>remote 10323:10323 | - | - | learned |
| 355 | 172.21.0.25:10355 | 10355:10355<br>remote 10355:10355 | - | - | learned |
| 451 | 172.21.0.25:10451 | 10451:10451<br>remote 10451:10451 | - | - | learned |
| 1012 | 172.21.0.25:11012 | 11012:11012<br>remote 11012:11012 | - | - | learned |
| 1013 | 172.21.0.25:11013 | 11013:11013<br>remote 11013:11013 | - | - | learned |
| 1014 | 172.21.0.25:11014 | 11014:11014<br>remote 11014:11014 | - | - | learned |
| 1015 | 172.21.0.25:11015 | 11015:11015<br>remote 11015:11015 | - | - | learned |
| 1016 | 172.21.0.25:11016 | 11016:11016<br>remote 11016:11016 | - | - | learned |
| 1017 | 172.21.0.25:11017 | 11017:11017<br>remote 11017:11017 | - | - | learned |
| 1018 | 172.21.0.25:11018 | 11018:11018<br>remote 11018:11018 | - | - | learned |
| 1019 | 172.21.0.25:11019 | 11019:11019<br>remote 11019:11019 | - | - | learned |
| 1020 | 172.21.0.25:11020 | 11020:11020<br>remote 11020:11020 | - | - | learned |
| 1021 | 172.21.0.25:11021 | 11021:11021<br>remote 11021:11021 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| IT-DC | 172.21.0.25:5002 | connected |
| OT | 172.21.0.25:5001 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.11200
   router-id 172.21.0.25
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   distance bgp 20 200 200
   timers bgp 5 15
   neighbor default send-community
   neighbor CORES-EBGP-PEERS-IT-DCVRF peer group
   neighbor CORES-EBGP-PEERS-IT-DCVRF remote-as 65120.1
   neighbor CORES-EBGP-PEERS-IT-DCVRF maximum-routes 0
   neighbor CORES-EBGP-PEERS-OTVRF peer group
   neighbor CORES-EBGP-PEERS-OTVRF remote-as 65120.1
   neighbor CORES-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor EVPN-OVERLAY-CORE peer group
   neighbor EVPN-OVERLAY-CORE update-source Loopback0
   neighbor EVPN-OVERLAY-CORE bfd
   neighbor EVPN-OVERLAY-CORE ebgp-multihop 15
   neighbor EVPN-OVERLAY-CORE send-community
   neighbor EVPN-OVERLAY-CORE maximum-routes 0
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.11200
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ismdc1bl01aa
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor S1-OT-BL-EBGP-PEERS-OTVRF peer group
   neighbor S1-OT-BL-EBGP-PEERS-OTVRF remote-as 65120.21200
   neighbor S1-OT-BL-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor interface Ethernet25/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120
   neighbor interface Ethernet26/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120
   neighbor interface Ethernet27/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120
   neighbor interface Vlan4093 peer-group MLAG-IPv4-UNDERLAY-PEER remote-as 65120.11200
   neighbor 172.21.0.1 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.0.1 remote-as 65120
   neighbor 172.21.0.1 description ismdc1sp01a
   neighbor 172.21.0.2 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.0.2 remote-as 65120
   neighbor 172.21.0.2 description ismdc1sp02a
   neighbor 172.21.0.3 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.0.3 remote-as 65120
   neighbor 172.21.0.3 description ismdc1sp03a
   neighbor 172.21.1.24 peer group EVPN-OVERLAY-CORE
   neighbor 172.21.1.24 remote-as 65120.12200
   neighbor 172.21.1.24 description ismdc2bl01aa
   neighbor 172.21.1.25 peer group EVPN-OVERLAY-CORE
   neighbor 172.21.1.25 remote-as 65120.12200
   neighbor 172.21.1.25 description ismdc2bl01ba
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 1012
      rd 172.21.0.25:11012
      rd evpn domain remote 172.21.0.25:11012
      route-target both 11012:11012
      route-target import export evpn domain remote 11012:11012
      redistribute learned
   !
   vlan 1013
      rd 172.21.0.25:11013
      rd evpn domain remote 172.21.0.25:11013
      route-target both 11013:11013
      route-target import export evpn domain remote 11013:11013
      redistribute learned
   !
   vlan 1014
      rd 172.21.0.25:11014
      rd evpn domain remote 172.21.0.25:11014
      route-target both 11014:11014
      route-target import export evpn domain remote 11014:11014
      redistribute learned
   !
   vlan 1015
      rd 172.21.0.25:11015
      rd evpn domain remote 172.21.0.25:11015
      route-target both 11015:11015
      route-target import export evpn domain remote 11015:11015
      redistribute learned
   !
   vlan 1016
      rd 172.21.0.25:11016
      rd evpn domain remote 172.21.0.25:11016
      route-target both 11016:11016
      route-target import export evpn domain remote 11016:11016
      redistribute learned
   !
   vlan 1017
      rd 172.21.0.25:11017
      rd evpn domain remote 172.21.0.25:11017
      route-target both 11017:11017
      route-target import export evpn domain remote 11017:11017
      redistribute learned
   !
   vlan 1018
      rd 172.21.0.25:11018
      rd evpn domain remote 172.21.0.25:11018
      route-target both 11018:11018
      route-target import export evpn domain remote 11018:11018
      redistribute learned
   !
   vlan 1019
      rd 172.21.0.25:11019
      rd evpn domain remote 172.21.0.25:11019
      route-target both 11019:11019
      route-target import export evpn domain remote 11019:11019
      redistribute learned
   !
   vlan 1020
      rd 172.21.0.25:11020
      rd evpn domain remote 172.21.0.25:11020
      route-target both 11020:11020
      route-target import export evpn domain remote 11020:11020
      redistribute learned
   !
   vlan 1021
      rd 172.21.0.25:11021
      rd evpn domain remote 172.21.0.25:11021
      route-target both 11021:11021
      route-target import export evpn domain remote 11021:11021
      redistribute learned
   !
   vlan 238
      rd 172.21.0.25:10238
      rd evpn domain remote 172.21.0.25:10238
      route-target both 10238:10238
      route-target import export evpn domain remote 10238:10238
      redistribute learned
   !
   vlan 239
      rd 172.21.0.25:10239
      rd evpn domain remote 172.21.0.25:10239
      route-target both 10239:10239
      route-target import export evpn domain remote 10239:10239
      redistribute learned
   !
   vlan 323
      rd 172.21.0.25:10323
      rd evpn domain remote 172.21.0.25:10323
      route-target both 10323:10323
      route-target import export evpn domain remote 10323:10323
      redistribute learned
   !
   vlan 355
      rd 172.21.0.25:10355
      rd evpn domain remote 172.21.0.25:10355
      route-target both 10355:10355
      route-target import export evpn domain remote 10355:10355
      redistribute learned
   !
   vlan 451
      rd 172.21.0.25:10451
      rd evpn domain remote 172.21.0.25:10451
      route-target both 10451:10451
      route-target import export evpn domain remote 10451:10451
      redistribute learned
   !
   address-family evpn
      neighbor EVPN-OVERLAY-CORE activate
      neighbor EVPN-OVERLAY-CORE domain remote
      neighbor EVPN-OVERLAY-PEERS activate
      neighbor default next-hop-self received-evpn-routes route-type ip-prefix inter-domain
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-CORE activate
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS next-hop address-family ipv6 originate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER next-hop address-family ipv6 originate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf IT-DC
      rd 172.21.0.25:5002
      route-target import evpn 5002:5002
      route-target export evpn 5002:5002
      router-id 172.21.0.25
      update wait-install
      neighbor 10.210.226.28 peer group CORES-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.28 description ismcr01a-Eth4/1/1-IT-DCVRF
      neighbor 10.210.226.30 peer group CORES-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.30 description ismcr02a-Eth4/1/1-IT-DCVRF
      redistribute connected route-map RM-LOCAL-NETWORKS
      !
      address-family ipv4
         neighbor 10.210.226.28 activate
         neighbor 10.210.226.30 activate
   !
   vrf OT
      rd 172.21.0.25:5001
      route-target import evpn 5001:5001
      route-target export evpn 5001:5001
      router-id 172.21.0.25
      update wait-install
      neighbor 10.210.226.4 peer group CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.226.4 description ismcr01a-Eth4/1/1-OTVRF
      neighbor 10.210.226.6 peer group CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.226.6 description ismcr02a-Eth4/1/1-OTVRF
      neighbor 10.210.226.20 peer group S1-OT-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.226.20 description isms1otbl01aa-Eth2/1-OTVRF
      neighbor 10.210.226.22 peer group S1-OT-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.226.22 description isms1otbl01ba-Eth2/1-OTVRF
      redistribute connected route-map RM-LOCAL-NETWORKS
      !
      address-family ipv4
         neighbor 10.210.226.4 activate
         neighbor 10.210.226.6 activate
         neighbor 10.210.226.20 activate
         neighbor 10.210.226.22 activate
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
| 10 | permit 172.21.0.0/24 eq 32 |
| 20 | permit 10.210.224.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOCAL-NETWORKS
   seq 10 permit 10.208.0.0/13 le 29
   seq 20 permit 172.21.0.0/22 eq 32
   seq 30 permit 192.168.160.0/20 eq 32
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.0.0/24 eq 32
   seq 20 permit 10.210.224.0/24 eq 32
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
route-map RM-LOCAL-NETWORKS permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS
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
