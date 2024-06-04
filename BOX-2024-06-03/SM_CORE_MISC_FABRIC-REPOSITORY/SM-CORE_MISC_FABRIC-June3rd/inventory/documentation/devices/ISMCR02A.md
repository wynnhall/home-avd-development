# ismcr02a

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
| Management0 | oob_management | oob | mgmt | 10.210.80.73/21 | 10.210.80.1 |

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
   ip address 10.210.80.73/21
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
| - | SM_CORE_MISC_FABRIC [SM_CORE_MISC_FABRIC] ismcr02a | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | c9e991ee95c5060fdc314b82b7b003e9779e0692 | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | c9e991ee95c5060fdc314b82b7b003e9779e0692 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local c9e991ee95c5060fdc314b82b7b003e9779e0692
snmp-server location SM_CORE_MISC_FABRIC [SM_CORE_MISC_FABRIC] ismcr02a
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
snmp-server user SNMPManager network-admin v3 localized c9e991ee95c5060fdc314b82b7b003e9779e0692 auth sha <removed> priv aes <removed>
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
| 510 | WANFW-TRANSIT-IT-DCVRF | - |
| 525 | WANFW-TRANSIT-ITVRF | - |
| 533 | WANFW-TRANSIT-OTVRF | - |
| 541 | SCADAFW-TRANSIT-ITVRF | - |
| 542 | VENDORFW-TRANSIT-OTVRF | - |
| 581 | INET-IoTFW-TRANSIT-ehsVRF | - |
| 589 | INET-IoTFW-TRANSIT-GnetVRF | - |
| 633 | INET-IoTFW-TRANSIT-IoTVRF | - |
| 4093 | LEAF_PEER_L3 | MLAG |
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
vlan 581
   name INET-IoTFW-TRANSIT-ehsVRF
!
vlan 589
   name INET-IoTFW-TRANSIT-GnetVRF
!
vlan 633
   name INET-IoTFW-TRANSIT-IoTVRF
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
| Ethernet3/5/1 | [L]_ismtmgpan40_Ethernet1/41 | *trunk | *525,510,533 | *- | *- | 351 |
| Ethernet3/48/1 | [L]_MLAG_PEER_ismcr01a_Ethernet3/48/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet4/5/1 | [L]_ismtmgpan41_Ethernet1/42 | *trunk | *525,510,533 | *- | *- | 451 |
| Ethernet4/48/1 | [L]_MLAG_PEER_ismcr01a_Ethernet4/48/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet5/1 | [L]_ismpan98_Ethernet1/15 | *trunk | *581,589,633 | *- | *- | 51 |
| Ethernet5/2 | [L]_ISMPAN60_Ethernet1/15 | *trunk | *541 | *- | *- | 52 |
| Ethernet5/3 | [L]_ISMTMGPAN48_Ethernet1/23 | *trunk | *542 | *- | *- | 53 |
| Ethernet6/1 | [L]_ismpan99_Ethernet1/16 | *trunk | *581,589,633 | *- | *- | 61 |
| Ethernet6/2 | [L]_ISMPAN61_Ethernet1/16 | *trunk | *541 | *- | *- | 62 |
| Ethernet6/3 | [L]_ISMTMGPAN49_Ethernet1/24 | *trunk | *542 | *- | *- | 63 |

*Inherited from Port-Channel Interface

##### Encapsulation Dot1q Interfaces

| Interface | Description | Type | Vlan ID | Dot1q VLAN Tag |
| --------- | ----------- | -----| ------- | -------------- |
| Ethernet3/1/1.510 | [L]_ismdc1bl01a-Eth2/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet3/1/1.533 | [L]_ismdc1bl01a-Eth2/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet3/2/1.510 | [L]_ismdc2bl01a-Eth2/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet3/2/1.533 | [L]_ismdc2bl01a-Eth2/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet3/3/1.525 | [L]_isms1itbl01a-Eth2/1-ITVRF | l3dot1q | - | 525 |
| Ethernet3/3/1.633 | [L]_isms1itbl01a-Eth2/1-IoTVRF | l3dot1q | - | 633 |
| Ethernet3/4/1.525 | [L]_ismitmsc01a-Eth50/1-ITVRF | l3dot1q | - | 525 |
| Ethernet3/4/1.533 | [L]_ismitmsc01a-Eth50/1-OTVRF | l3dot1q | - | 533 |
| Ethernet3/4/1.581 | [L]_ismitmsc01a-Eth50/1-ehsVRF | l3dot1q | - | 581 |
| Ethernet3/4/1.589 | [L]_ismitmsc01a-Eth50/1-GnetVRF | l3dot1q | - | 589 |
| Ethernet4/1/1.510 | [L]_ismdc1bl02a-Eth2/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet4/1/1.533 | [L]_ismdc1bl02a-Eth2/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet4/2/1.510 | [L]_ismdc2bl02a-Eth2/1-IT-DCVRF | l3dot1q | - | 510 |
| Ethernet4/2/1.533 | [L]_ismdc2bl02a-Eth2/1-OT-VRF | l3dot1q | - | 533 |
| Ethernet4/3/1.525 | [L]_isms1itbl02a-Eth2/1-ITVRF | l3dot1q | - | 525 |
| Ethernet4/3/1.633 | [L]_isms1itbl02a-Eth2/1-IoTVRF | l3dot1q | - | 633 |
| Ethernet4/4/1.525 | [L]_ismitmsc02a-Eth50/1-ITVRF | l3dot1q | - | 525 |
| Ethernet4/4/1.533 | [L]_ismitmsc02a-Eth50/1-OTVRF | l3dot1q | - | 533 |
| Ethernet4/4/1.581 | [L]_ismitmsc02a-Eth50/1-ehsVRF | l3dot1q | - | 581 |
| Ethernet4/4/1.589 | [L]_ismitmsc02a-Eth50/1-GnetVRF | l3dot1q | - | 589 |

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet3/1/1.510 | [L]_ismdc1bl01a-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.226.26/31 | IT-DC | - | False | - | - |
| Ethernet3/1/1.533 | [L]_ismdc1bl01a-Eth2/1-OT-VRF | l3dot1q | - | 10.210.226.2/31 | OT | - | False | - | - |
| Ethernet3/2/1.510 | [L]_ismdc2bl01a-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.234.18/31 | IT-DC | - | False | - | - |
| Ethernet3/2/1.533 | [L]_ismdc2bl01a-Eth2/1-OT-VRF | l3dot1q | - | 10.210.234.2/31 | OT | - | False | - | - |
| Ethernet3/3/1.525 | [L]_isms1itbl01a-Eth2/1-ITVRF | l3dot1q | - | 10.210.241.2/31 | IT | - | False | - | - |
| Ethernet3/3/1.633 | [L]_isms1itbl01a-Eth2/1-IoTVRF | l3dot1q | - | 10.210.241.10/31 | IoT | - | False | - | - |
| Ethernet3/4/1.525 | [L]_ismitmsc01a-Eth50/1-ITVRF | l3dot1q | - | 10.210.241.18/31 | IT | - | False | - | - |
| Ethernet3/4/1.533 | [L]_ismitmsc01a-Eth50/1-OTVRF | l3dot1q | - | 10.210.241.26/31 | OT | - | False | - | - |
| Ethernet3/4/1.581 | [L]_ismitmsc01a-Eth50/1-ehsVRF | l3dot1q | - | 10.210.241.34/31 | ehs | - | False | - | - |
| Ethernet3/4/1.589 | [L]_ismitmsc01a-Eth50/1-GnetVRF | l3dot1q | - | 10.210.241.42/31 | Gnet | - | False | - | - |
| Ethernet4/1/1.510 | [L]_ismdc1bl02a-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.226.30/31 | IT-DC | - | False | - | - |
| Ethernet4/1/1.533 | [L]_ismdc1bl02a-Eth2/1-OT-VRF | l3dot1q | - | 10.210.226.6/31 | OT | - | False | - | - |
| Ethernet4/2/1.510 | [L]_ismdc2bl02a-Eth2/1-IT-DCVRF | l3dot1q | - | 10.210.234.22/31 | IT-DC | - | False | - | - |
| Ethernet4/2/1.533 | [L]_ismdc2bl02a-Eth2/1-OT-VRF | l3dot1q | - | 10.210.234.6/31 | OT | - | False | - | - |
| Ethernet4/3/1.525 | [L]_isms1itbl02a-Eth2/1-ITVRF | l3dot1q | - | 10.210.241.6/31 | IT | - | False | - | - |
| Ethernet4/3/1.633 | [L]_isms1itbl02a-Eth2/1-IoTVRF | l3dot1q | - | 10.210.241.14/31 | IoT | - | False | - | - |
| Ethernet4/4/1.525 | [L]_ismitmsc02a-Eth50/1-ITVRF | l3dot1q | - | 10.210.241.22/31 | IT | - | False | - | - |
| Ethernet4/4/1.533 | [L]_ismitmsc02a-Eth50/1-OTVRF | l3dot1q | - | 10.210.241.30/31 | OT | - | False | - | - |
| Ethernet4/4/1.581 | [L]_ismitmsc02a-Eth50/1-ehsVRF | l3dot1q | - | 10.210.241.38/31 | ehs | - | False | - | - |
| Ethernet4/4/1.589 | [L]_ismitmsc02a-Eth50/1-GnetVRF | l3dot1q | - | 10.210.241.46/31 | Gnet | - | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3/1/1
   no shutdown
   no switchport
!
interface Ethernet3/1/1.510
   description [L]_ismdc1bl01a-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.26/31
!
interface Ethernet3/1/1.533
   description [L]_ismdc1bl01a-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.2/31
!
interface Ethernet3/2/1
   no shutdown
   no switchport
!
interface Ethernet3/2/1.510
   description [L]_ismdc2bl01a-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.234.18/31
!
interface Ethernet3/2/1.533
   description [L]_ismdc2bl01a-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.234.2/31
!
interface Ethernet3/3/1
   no shutdown
   no switchport
!
interface Ethernet3/3/1.525
   description [L]_isms1itbl01a-Eth2/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.2/31
!
interface Ethernet3/3/1.633
   description [L]_isms1itbl01a-Eth2/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.10/31
!
interface Ethernet3/4/1
   no shutdown
   no switchport
!
interface Ethernet3/4/1.525
   description [L]_ismitmsc01a-Eth50/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.18/31
!
interface Ethernet3/4/1.533
   description [L]_ismitmsc01a-Eth50/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.26/31
!
interface Ethernet3/4/1.581
   description [L]_ismitmsc01a-Eth50/1-ehsVRF
   no shutdown
   encapsulation dot1q vlan 581
   vrf ehs
   ip address 10.210.241.34/31
!
interface Ethernet3/4/1.589
   description [L]_ismitmsc01a-Eth50/1-GnetVRF
   no shutdown
   encapsulation dot1q vlan 589
   vrf Gnet
   ip address 10.210.241.42/31
!
interface Ethernet3/5/1
   description [L]_ismtmgpan40_Ethernet1/41
   no shutdown
   channel-group 351 mode active
!
interface Ethernet3/48/1
   description [L]_MLAG_PEER_ismcr01a_Ethernet3/48/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet4/1/1
   no shutdown
   no switchport
!
interface Ethernet4/1/1.510
   description [L]_ismdc1bl02a-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.226.30/31
!
interface Ethernet4/1/1.533
   description [L]_ismdc1bl02a-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.226.6/31
!
interface Ethernet4/2/1
   no shutdown
   no switchport
!
interface Ethernet4/2/1.510
   description [L]_ismdc2bl02a-Eth2/1-IT-DCVRF
   no shutdown
   encapsulation dot1q vlan 510
   vrf IT-DC
   ip address 10.210.234.22/31
!
interface Ethernet4/2/1.533
   description [L]_ismdc2bl02a-Eth2/1-OT-VRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.234.6/31
!
interface Ethernet4/3/1
   no shutdown
   no switchport
!
interface Ethernet4/3/1.525
   description [L]_isms1itbl02a-Eth2/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.6/31
!
interface Ethernet4/3/1.633
   description [L]_isms1itbl02a-Eth2/1-IoTVRF
   no shutdown
   encapsulation dot1q vlan 633
   vrf IoT
   ip address 10.210.241.14/31
!
interface Ethernet4/4/1
   no shutdown
   no switchport
!
interface Ethernet4/4/1.525
   description [L]_ismitmsc02a-Eth50/1-ITVRF
   no shutdown
   encapsulation dot1q vlan 525
   vrf IT
   ip address 10.210.241.22/31
!
interface Ethernet4/4/1.533
   description [L]_ismitmsc02a-Eth50/1-OTVRF
   no shutdown
   encapsulation dot1q vlan 533
   vrf OT
   ip address 10.210.241.30/31
!
interface Ethernet4/4/1.581
   description [L]_ismitmsc02a-Eth50/1-ehsVRF
   no shutdown
   encapsulation dot1q vlan 581
   vrf ehs
   ip address 10.210.241.38/31
!
interface Ethernet4/4/1.589
   description [L]_ismitmsc02a-Eth50/1-GnetVRF
   no shutdown
   encapsulation dot1q vlan 589
   vrf Gnet
   ip address 10.210.241.46/31
!
interface Ethernet4/5/1
   description [L]_ismtmgpan41_Ethernet1/42
   no shutdown
   channel-group 451 mode active
!
interface Ethernet4/48/1
   description [L]_MLAG_PEER_ismcr01a_Ethernet4/48/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet5/1
   description [L]_ismpan98_Ethernet1/15
   no shutdown
   channel-group 51 mode active
!
interface Ethernet5/2
   description [L]_ISMPAN60_Ethernet1/15
   no shutdown
   channel-group 52 mode active
!
interface Ethernet5/3
   description [L]_ISMTMGPAN48_Ethernet1/23
   no shutdown
   channel-group 53 mode active
!
interface Ethernet6/1
   description [L]_ismpan99_Ethernet1/16
   no shutdown
   channel-group 61 mode active
!
interface Ethernet6/2
   description [L]_ISMPAN61_Ethernet1/16
   no shutdown
   channel-group 62 mode active
!
interface Ethernet6/3
   description [L]_ISMTMGPAN49_Ethernet1/24
   no shutdown
   channel-group 63 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel51 | [L]_ismpan98_MLAG PortChannel to DMZ Firewalls | switched | trunk | 581,589,633 | - | - | - | - | 51 | - |
| Port-Channel52 | [L]_ISMPAN60_MLAG PortChannel to SCADA Firewalls | switched | trunk | 541 | - | - | - | - | 52 | - |
| Port-Channel53 | [L]_ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls | switched | trunk | 542 | - | - | - | - | 53 | - |
| Port-Channel61 | [L]_ismpan99_MLAG PortChannel to DMZ Firewalls | switched | trunk | 581,589,633 | - | - | - | - | 61 | - |
| Port-Channel62 | [L]_ISMPAN61_MLAG PortChannel to SCADA Firewalls | switched | trunk | 541 | - | - | - | - | 62 | - |
| Port-Channel63 | [L]_ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls | switched | trunk | 542 | - | - | - | - | 63 | - |
| Port-Channel351 | [L]_ismtmgpan40_MLAG PortChannel to WAN Firewalls | switched | trunk | 525,510,533 | - | - | - | - | 351 | - |
| Port-Channel451 | [L]_ismtmgpan41_MLAG PortChannel to WAN Firewalls | switched | trunk | 525,510,533 | - | - | - | - | 451 | - |
| Port-Channel4094 | [L]_MLAG_PEER_ismcr01a_Po3481 | switched | trunk | - | - | ['MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel51
   description [L]_ismpan98_MLAG PortChannel to DMZ Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 581,589,633
   switchport mode trunk
   mlag 51
!
interface Port-Channel52
   description [L]_ISMPAN60_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 541
   switchport mode trunk
   mlag 52
!
interface Port-Channel53
   description [L]_ISMTMGPAN48_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 542
   switchport mode trunk
   mlag 53
!
interface Port-Channel61
   description [L]_ismpan99_MLAG PortChannel to DMZ Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 581,589,633
   switchport mode trunk
   mlag 61
!
interface Port-Channel62
   description [L]_ISMPAN61_MLAG PortChannel to SCADA Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 541
   switchport mode trunk
   mlag 62
!
interface Port-Channel63
   description [L]_ISMTMGPAN49_MLAG PortChannel to Vendor Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 542
   switchport mode trunk
   mlag 63
!
interface Port-Channel351
   description [L]_ismtmgpan40_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 525,510,533
   switchport mode trunk
   mlag 351
!
interface Port-Channel451
   description [L]_ismtmgpan41_MLAG PortChannel to WAN Firewalls
   no shutdown
   switchport
   switchport trunk allowed vlan 525,510,533
   switchport mode trunk
   mlag 451
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ismcr01a_Po3481
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
| Loopback0 | Router_ID | default | 172.21.0.246/32 |

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
   ip address 172.21.0.246/32
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
| Vlan581 | INET-IoTFW-TRANSIT-ehsVRF | ehs | - | False |
| Vlan589 | INET-IoTFW-TRANSIT-GnetVRF | Gnet | - | False |
| Vlan633 | INET-IoTFW-TRANSIT-IoTVRF | IoT | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan510 |  IT-DC  |  10.210.226.67/29  |  -  |  10.210.226.65  |  -  |  -  |  -  |
| Vlan525 |  IT  |  10.210.241.67/29  |  -  |  10.210.241.65  |  -  |  -  |  -  |
| Vlan533 |  OT  |  10.210.249.67/29  |  -  |  10.210.249.65  |  -  |  -  |  -  |
| Vlan541 |  IT  |  10.210.241.83/29  |  -  |  10.210.241.81  |  -  |  -  |  -  |
| Vlan542 |  OT  |  10.210.249.75/29  |  -  |  10.210.249.73  |  -  |  -  |  -  |
| Vlan581 |  ehs  |  10.210.241.123/29  |  -  |  10.210.241.121  |  -  |  -  |  -  |
| Vlan589 |  Gnet  |  10.210.241.131/29  |  -  |  10.210.241.129  |  -  |  -  |  -  |
| Vlan633 |  IoT  |  10.210.241.75/29  |  -  |  10.210.241.73  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.3/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan510
   description WANFW-TRANSIT-IT-DCVRF
   no shutdown
   vrf IT-DC
   ip address 10.210.226.67/29
   ip virtual-router address 10.210.226.65
   no ip proxy-arp
   no autostate

!
interface Vlan525
   description WANFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 10.210.241.67/29
   ip virtual-router address 10.210.241.65
   no ip proxy-arp
   no autostate

!
interface Vlan533
   description WANFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 10.210.249.67/29
   ip virtual-router address 10.210.249.65
   no ip proxy-arp
   no autostate

!
interface Vlan541
   description SCADAFW-TRANSIT-ITVRF
   no shutdown
   vrf IT
   ip address 10.210.241.83/29
   ip virtual-router address 10.210.241.81
   no ip proxy-arp
   no autostate

!
interface Vlan542
   description VENDORFW-TRANSIT-OTVRF
   no shutdown
   vrf OT
   ip address 10.210.249.75/29
   ip virtual-router address 10.210.249.73
   no ip proxy-arp
   no autostate

!
interface Vlan581
   description INET-IoTFW-TRANSIT-ehsVRF
   no shutdown
   vrf ehs
   ip address 10.210.241.123/29
   ip virtual-router address 10.210.241.121
   no ip proxy-arp
   no autostate

!
interface Vlan589
   description INET-IoTFW-TRANSIT-GnetVRF
   no shutdown
   vrf Gnet
   ip address 10.210.241.131/29
   ip virtual-router address 10.210.241.129
   no ip proxy-arp
   no autostate

!
interface Vlan633
   description INET-IoTFW-TRANSIT-IoTVRF
   no shutdown
   vrf IoT
   ip address 10.210.241.75/29
   ip virtual-router address 10.210.241.73
   no ip proxy-arp
   no autostate

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
| IoT | True |
| IT | True |
| IT-DC | True |
| mgmt | False |
| OT | True |

#### IP Routing Device Configuration

```eos
!
ip routing
no ip icmp redirect
ip routing vrf ehs
ip routing vrf Gnet
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
| ehs | false |
| Gnet | false |
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
| ehs | 0.0.0.0/0 | 10.210.241.126 | - | 225 | - | ismpan98-99-ehsVRF | 225 |
| Gnet | 0.0.0.0/0 | 10.210.241.134 | - | 225 | - | ismpan98-99-GnetVRF | 225 |
| IoT | 0.0.0.0/0 | 10.210.241.78 | - | 225 | - | ismpan98-99-IoTVRF | 225 |
| IT | 0.0.0.0/0 | 10.210.241.70 | - | 225 | - | ismtmgpan40-41-ITVRF | 225 |
| IT-DC | 0.0.0.0/0 | 10.210.226.70 | - | 225 | - | ismtmgpan40-41-IT-DCVRF | 225 |
| OT | 0.0.0.0/0 | 10.210.249.70 | - | 225 | - | ismtmgpan40-41-OTVRF | 225 |

#### Static Routes Device Configuration

```eos
!
ip route vrf mgmt 0.0.0.0/0 10.210.80.1
ip route vrf ehs 0.0.0.0/0 10.210.241.126 225 name ismpan98-99-ehsVRF metric 225
ip route vrf Gnet 0.0.0.0/0 10.210.241.134 225 name ismpan98-99-GnetVRF metric 225
ip route vrf IoT 0.0.0.0/0 10.210.241.78 225 name ismpan98-99-IoTVRF metric 225
ip route vrf IT 0.0.0.0/0 10.210.241.70 225 name ismtmgpan40-41-ITVRF metric 225
ip route vrf IT-DC 0.0.0.0/0 10.210.226.70 225 name ismtmgpan40-41-IT-DCVRF metric 225
ip route vrf OT 0.0.0.0/0 10.210.249.70 225 name ismtmgpan40-41-OTVRF metric 225
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.1 | 172.21.0.246 |

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

##### DC1-BL-EBGP-PEERS-IT-DCVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.11200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### DC1-BL-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.11200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### DC2-BL-EBGP-PEERS-IT-DCVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.12200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### DC2-BL-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.12200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### INET-IoTFW-EBGP-PEERS-ehsVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.98 |
| Maximum routes | 0 (no limit) |

##### INET-IoTFW-EBGP-PEERS-GnetVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.98 |
| Maximum routes | 0 (no limit) |

##### INET-IoTFW-EBGP-PEERS-IoTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.98 |
| Maximum routes | 0 (no limit) |

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |

##### IT-BL-EBGP-PEERS-IoTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.31200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### IT-BL-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.31200 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-ehsVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-GnetVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-ITVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### MISC-CORES-EBGP-PEERS-OTVRF

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.10 |
| Default originate | True |
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
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### VENDORFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.48 |
| Default originate | True |
| Maximum routes | 0 (no limit) |

##### WANFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.40 |
| Maximum routes | 0 (no limit) |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 192.168.0.2 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.210.241.35 | Inherited from peer group MISC-CORES-EBGP-PEERS-ehsVRF | ehs | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ehsVRF | - | - | - | - | - | - |
| 10.210.241.39 | Inherited from peer group MISC-CORES-EBGP-PEERS-ehsVRF | ehs | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ehsVRF | - | - | - | - | - | - |
| 10.210.241.126 | Inherited from peer group INET-IoTFW-EBGP-PEERS-ehsVRF | ehs | - | - | Inherited from peer group INET-IoTFW-EBGP-PEERS-ehsVRF | - | - | - | - | - | - |
| 10.210.241.43 | Inherited from peer group MISC-CORES-EBGP-PEERS-GnetVRF | Gnet | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-GnetVRF | - | - | - | - | - | - |
| 10.210.241.47 | Inherited from peer group MISC-CORES-EBGP-PEERS-GnetVRF | Gnet | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-GnetVRF | - | - | - | - | - | - |
| 10.210.241.134 | Inherited from peer group INET-IoTFW-EBGP-PEERS-GnetVRF | Gnet | - | - | Inherited from peer group INET-IoTFW-EBGP-PEERS-GnetVRF | - | - | - | - | - | - |
| 10.210.241.11 | Inherited from peer group IT-BL-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group IT-BL-EBGP-PEERS-IoTVRF | - | - | - | - | - | - |
| 10.210.241.15 | Inherited from peer group IT-BL-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group IT-BL-EBGP-PEERS-IoTVRF | - | - | - | - | - | - |
| 10.210.241.78 | Inherited from peer group INET-IoTFW-EBGP-PEERS-IoTVRF | IoT | - | - | Inherited from peer group INET-IoTFW-EBGP-PEERS-IoTVRF | - | - | - | - | - | - |
| 10.210.241.3 | Inherited from peer group IT-BL-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BL-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 10.210.241.7 | Inherited from peer group IT-BL-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group IT-BL-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 10.210.241.19 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 10.210.241.23 | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | IT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-ITVRF | - | - | - | - | - | - |
| 10.210.241.70 | Inherited from peer group WANFW-EBGP-PEERS | IT | - | - | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - | - |
| 10.210.241.86 | Inherited from peer group SCADAFW-EBGP-PEERS | IT | - | - | Inherited from peer group SCADAFW-EBGP-PEERS | - | - | - | - | - | - |
| 10.210.226.27 | Inherited from peer group DC1-BL-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BL-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.226.31 | Inherited from peer group DC1-BL-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC1-BL-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.226.70 | Inherited from peer group WANFW-EBGP-PEERS | IT-DC | - | - | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - | - |
| 10.210.234.19 | Inherited from peer group DC2-BL-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BL-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.234.23 | Inherited from peer group DC2-BL-EBGP-PEERS-IT-DCVRF | IT-DC | - | - | Inherited from peer group DC2-BL-EBGP-PEERS-IT-DCVRF | - | - | - | - | - | - |
| 10.210.226.3 | Inherited from peer group DC1-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.226.7 | Inherited from peer group DC1-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC1-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.234.3 | Inherited from peer group DC2-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.234.7 | Inherited from peer group DC2-BL-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group DC2-BL-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.241.27 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.241.31 | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | OT | - | - | Inherited from peer group MISC-CORES-EBGP-PEERS-OTVRF | - | - | - | - | - | - |
| 10.210.249.70 | Inherited from peer group WANFW-EBGP-PEERS | OT | - | - | Inherited from peer group WANFW-EBGP-PEERS | - | - | - | - | - | - |
| 10.210.249.78 | Inherited from peer group VENDORFW-EBGP-PEERS | OT | - | - | Inherited from peer group VENDORFW-EBGP-PEERS | - | - | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| ehs | - | connected<br>static |
| Gnet | - | connected<br>static |
| IoT | - | connected<br>static |
| IT | - | connected<br>static |
| IT-DC | - | connected<br>static |
| OT | - | connected<br>static |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.1
   router-id 172.21.0.246
   maximum-paths 128 ecmp 128
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   timers bgp 5 15
   distance bgp 20 200 200
   neighbor default send-community
   neighbor DC1-BL-EBGP-PEERS-IT-DCVRF peer group
   neighbor DC1-BL-EBGP-PEERS-IT-DCVRF remote-as 65120.11200
   neighbor DC1-BL-EBGP-PEERS-IT-DCVRF default-originate
   neighbor DC1-BL-EBGP-PEERS-IT-DCVRF maximum-routes 0
   neighbor DC1-BL-EBGP-PEERS-OTVRF peer group
   neighbor DC1-BL-EBGP-PEERS-OTVRF remote-as 65120.11200
   neighbor DC1-BL-EBGP-PEERS-OTVRF default-originate
   neighbor DC1-BL-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor DC2-BL-EBGP-PEERS-IT-DCVRF peer group
   neighbor DC2-BL-EBGP-PEERS-IT-DCVRF remote-as 65120.12200
   neighbor DC2-BL-EBGP-PEERS-IT-DCVRF default-originate
   neighbor DC2-BL-EBGP-PEERS-IT-DCVRF maximum-routes 0
   neighbor DC2-BL-EBGP-PEERS-OTVRF peer group
   neighbor DC2-BL-EBGP-PEERS-OTVRF remote-as 65120.12200
   neighbor DC2-BL-EBGP-PEERS-OTVRF default-originate
   neighbor DC2-BL-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor INET-IoTFW-EBGP-PEERS-ehsVRF peer group
   neighbor INET-IoTFW-EBGP-PEERS-ehsVRF remote-as 65120.98
   neighbor INET-IoTFW-EBGP-PEERS-ehsVRF maximum-routes 0
   neighbor INET-IoTFW-EBGP-PEERS-GnetVRF peer group
   neighbor INET-IoTFW-EBGP-PEERS-GnetVRF remote-as 65120.98
   neighbor INET-IoTFW-EBGP-PEERS-GnetVRF maximum-routes 0
   neighbor INET-IoTFW-EBGP-PEERS-IoTVRF peer group
   neighbor INET-IoTFW-EBGP-PEERS-IoTVRF remote-as 65120.98
   neighbor INET-IoTFW-EBGP-PEERS-IoTVRF maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IT-BL-EBGP-PEERS-IoTVRF peer group
   neighbor IT-BL-EBGP-PEERS-IoTVRF remote-as 65120.31200
   neighbor IT-BL-EBGP-PEERS-IoTVRF default-originate
   neighbor IT-BL-EBGP-PEERS-IoTVRF maximum-routes 0
   neighbor IT-BL-EBGP-PEERS-ITVRF peer group
   neighbor IT-BL-EBGP-PEERS-ITVRF remote-as 65120.31200
   neighbor IT-BL-EBGP-PEERS-ITVRF default-originate
   neighbor IT-BL-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-ehsVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-ehsVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-ehsVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-GnetVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-GnetVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-GnetVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-ITVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-ITVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-ITVRF default-originate
   neighbor MISC-CORES-EBGP-PEERS-ITVRF maximum-routes 0
   neighbor MISC-CORES-EBGP-PEERS-OTVRF peer group
   neighbor MISC-CORES-EBGP-PEERS-OTVRF remote-as 65120.10
   neighbor MISC-CORES-EBGP-PEERS-OTVRF default-originate
   neighbor MISC-CORES-EBGP-PEERS-OTVRF maximum-routes 0
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.1
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ismcr01a
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor SCADAFW-EBGP-PEERS peer group
   neighbor SCADAFW-EBGP-PEERS remote-as 65120.60
   neighbor SCADAFW-EBGP-PEERS default-originate
   neighbor SCADAFW-EBGP-PEERS maximum-routes 0
   neighbor VENDORFW-EBGP-PEERS peer group
   neighbor VENDORFW-EBGP-PEERS remote-as 65120.48
   neighbor VENDORFW-EBGP-PEERS default-originate
   neighbor VENDORFW-EBGP-PEERS maximum-routes 0
   neighbor WANFW-EBGP-PEERS peer group
   neighbor WANFW-EBGP-PEERS remote-as 65120.40
   neighbor WANFW-EBGP-PEERS maximum-routes 0
   neighbor 192.168.0.2 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.2 description ismcr01a
   redistribute connected route-map RM-LOCAL-NETWORKS
   !
   address-family ipv4
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf ehs
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.241.35 peer group MISC-CORES-EBGP-PEERS-ehsVRF
      neighbor 10.210.241.35 description ismitmsc01a-Eth50/1-ehsVRF
      neighbor 10.210.241.39 peer group MISC-CORES-EBGP-PEERS-ehsVRF
      neighbor 10.210.241.39 description ismitmsc02a-Eth50/1-ehsVRF
      neighbor 10.210.241.126 peer group INET-IoTFW-EBGP-PEERS-ehsVRF
      neighbor 10.210.241.126 description INET-IoTFW-VIP-ehsVRF
      neighbor 10.210.241.126 route-map RM-ehs-10.210.241.126-SET-NEXT-HOP-OUT out
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.241.35 activate
         neighbor 10.210.241.39 activate
         neighbor 10.210.241.126 activate
   !
   vrf Gnet
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.241.43 peer group MISC-CORES-EBGP-PEERS-GnetVRF
      neighbor 10.210.241.43 description ismitmsc01a-Eth50/1-GnetVRF
      neighbor 10.210.241.47 peer group MISC-CORES-EBGP-PEERS-GnetVRF
      neighbor 10.210.241.47 description ismitmsc02a-Eth50/1-GnetVRF
      neighbor 10.210.241.134 peer group INET-IoTFW-EBGP-PEERS-GnetVRF
      neighbor 10.210.241.134 description INET-IoTFW-VIP-GnetVRF
      neighbor 10.210.241.134 route-map RM-Gnet-10.210.241.134-SET-NEXT-HOP-OUT out
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.241.43 activate
         neighbor 10.210.241.47 activate
         neighbor 10.210.241.134 activate
   !
   vrf IoT
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.241.11 peer group IT-BL-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.11 description isms1itbl01a-Eth2/1-IoTVRF
      neighbor 10.210.241.15 peer group IT-BL-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.15 description isms1itbl02a-Eth2/1-IoTVRF
      neighbor 10.210.241.78 peer group INET-IoTFW-EBGP-PEERS-IoTVRF
      neighbor 10.210.241.78 description INET-IoTFW-VIP-IoTVRF
      neighbor 10.210.241.78 route-map RM-INET-IoTFW-IoTVRF-OUT out
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.241.11 activate
         neighbor 10.210.241.15 activate
         neighbor 10.210.241.78 activate
   !
   vrf IT
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.241.3 peer group IT-BL-EBGP-PEERS-ITVRF
      neighbor 10.210.241.3 description isms1itbl01a-Eth2/1-ITVRF
      neighbor 10.210.241.7 peer group IT-BL-EBGP-PEERS-ITVRF
      neighbor 10.210.241.7 description isms1itbl02a-Eth2/1-ITVRF
      neighbor 10.210.241.19 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.19 description ismitmsc01a-Eth50/1-ITVRF
      neighbor 10.210.241.23 peer group MISC-CORES-EBGP-PEERS-ITVRF
      neighbor 10.210.241.23 description ismitmsc02a-Eth50/1-ITVRF
      neighbor 10.210.241.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.241.70 description WANFW-IP-ITVRF
      neighbor 10.210.241.70 route-map RM-WANFW-ITVRF-OUT out
      neighbor 10.210.241.86 peer group SCADAFW-EBGP-PEERS
      neighbor 10.210.241.86 description SCADAFW-IP-ITVRF
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.241.3 activate
         neighbor 10.210.241.7 activate
         neighbor 10.210.241.19 activate
         neighbor 10.210.241.23 activate
         neighbor 10.210.241.70 activate
         neighbor 10.210.241.86 activate
   !
   vrf IT-DC
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.226.27 peer group DC1-BL-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.27 description DC1-BL1-Eth2/1-IT-DCVRF
      neighbor 10.210.226.31 peer group DC1-BL-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.226.31 description DC1-BL2-Eth2/1-IT-DCVRF
      neighbor 10.210.226.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.226.70 description WANFW-IP-IT-DCVRF
      neighbor 10.210.226.70 route-map RM-WANFW-IT-DCVRF-OUT out
      neighbor 10.210.234.19 peer group DC2-BL-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.19 description DC2-BL1-Eth2/1-IT-DCVRF
      neighbor 10.210.234.23 peer group DC2-BL-EBGP-PEERS-IT-DCVRF
      neighbor 10.210.234.23 description DC2-BL2-Eth2/1-IT-DCVRF
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.226.27 activate
         neighbor 10.210.226.31 activate
         neighbor 10.210.226.70 activate
         neighbor 10.210.234.19 activate
         neighbor 10.210.234.23 activate
   !
   vrf OT
      router-id 172.21.0.246
      update wait-install
      neighbor 10.210.226.3 peer group DC1-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.226.3 description DC1-BL1-OTVRF
      neighbor 10.210.226.7 peer group DC1-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.226.7 description DC1-BL2-OTVRF
      neighbor 10.210.234.3 peer group DC2-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.234.3 description DC2-BL1-OTVRF
      neighbor 10.210.234.7 peer group DC2-BL-EBGP-PEERS-OTVRF
      neighbor 10.210.234.7 description DC2-BL2-OTVRF
      neighbor 10.210.241.27 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.27 description ismitmsc01a-Eth50/1-OTVRF
      neighbor 10.210.241.31 peer group MISC-CORES-EBGP-PEERS-OTVRF
      neighbor 10.210.241.31 description ismitmsc02a-Eth50/1-OTVRF
      neighbor 10.210.249.70 peer group WANFW-EBGP-PEERS
      neighbor 10.210.249.70 description WANFW-IP-OTVRF
      neighbor 10.210.249.70 route-map RM-WANFW-OTVRF-OUT out
      neighbor 10.210.249.78 peer group VENDORFW-EBGP-PEERS
      neighbor 10.210.249.78 description VENDORFW-IP-OTVRF
      redistribute connected route-map RM-LOCAL-NETWORKS
      redistribute static
      !
      address-family ipv4
         neighbor 10.210.226.3 activate
         neighbor 10.210.226.7 activate
         neighbor 10.210.234.3 activate
         neighbor 10.210.234.7 activate
         neighbor 10.210.241.27 activate
         neighbor 10.210.241.31 activate
         neighbor 10.210.249.70 activate
         neighbor 10.210.249.78 activate
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

##### PL-FW-ALLOW-NETWORKS

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.0.0/22 eq 32 |
| 20 | permit 192.168.160.0/20 eq 32 |
| 30 | permit 192.0.2.0/24 eq 32 |
| 40 | permit 198.51.100.0/24 eq 32 |

##### PL-FW-DENY-HOST-ROUTES

| Sequence | Action |
| -------- | ------ |
| 10 | deny 0.0.0.0/0 ge 30 |

##### PL-LOCAL-NETWORKS

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.208.0.0/13 le 29 |
| 20 | permit 172.21.0.0/22 eq 32 |
| 30 | permit 192.168.160.0/20 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-FW-ALLOW-NETWORKS
   seq 10 permit 172.21.0.0/22 eq 32
   seq 20 permit 192.168.160.0/20 eq 32
   seq 30 permit 192.0.2.0/24 eq 32
   seq 40 permit 198.51.100.0/24 eq 32
!
ip prefix-list PL-FW-DENY-HOST-ROUTES
   seq 10 deny 0.0.0.0/0 ge 30
!
ip prefix-list PL-LOCAL-NETWORKS
   seq 10 permit 10.208.0.0/13 le 29
   seq 20 permit 172.21.0.0/22 eq 32
   seq 30 permit 192.168.160.0/20 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-ehs-10.210.241.126-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.121 | - | - |

##### RM-Gnet-10.210.241.134-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.129 | - | - |

##### RM-LOCAL-NETWORKS

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOCAL-NETWORKS | - | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

##### RM-WANFW-IoTVRF-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-FW-ALLOW-NETWORKS | - | - | - |
| 20 | permit | ip address prefix-list PL-FW-DENY-HOST-ROUTES | - | - | - |
| 30 | permit | - | ip next-hop 110.210.241.73 | - | - |

##### RM-WANFW-IT-DCVRF-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-FW-ALLOW-NETWORKS | - | - | - |
| 20 | permit | ip address prefix-list PL-FW-DENY-HOST-ROUTES | - | - | - |
| 30 | permit | - | ip next-hop 10.210.226.65 | - | - |

##### RM-WANFW-ITVRF-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-FW-ALLOW-NETWORKS | - | - | - |
| 20 | permit | ip address prefix-list PL-FW-DENY-HOST-ROUTES | - | - | - |
| 30 | permit | - | ip next-hop 10.210.241.65 | - | - |

##### RM-WANFW-OTVRF-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-FW-ALLOW-NETWORKS | - | - | - |
| 20 | permit | ip address prefix-list PL-FW-DENY-HOST-ROUTES | - | - | - |
| 30 | permit | - | ip next-hop 10.210.249.65 | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-ehs-10.210.241.126-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.121
!
route-map RM-Gnet-10.210.241.134-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.129
!
route-map RM-LOCAL-NETWORKS permit 10
   match ip address prefix-list PL-LOCAL-NETWORKS
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
!
route-map RM-WANFW-IoTVRF-OUT permit 10
   match ip address prefix-list PL-FW-ALLOW-NETWORKS
!
route-map RM-WANFW-IoTVRF-OUT permit 20
   match ip address prefix-list PL-FW-DENY-HOST-ROUTES
!
route-map RM-WANFW-IoTVRF-OUT permit 30
   set ip next-hop 110.210.241.73
!
route-map RM-WANFW-IT-DCVRF-OUT permit 10
   match ip address prefix-list PL-FW-ALLOW-NETWORKS
!
route-map RM-WANFW-IT-DCVRF-OUT permit 20
   match ip address prefix-list PL-FW-DENY-HOST-ROUTES
!
route-map RM-WANFW-IT-DCVRF-OUT permit 30
   set ip next-hop 10.210.226.65
!
route-map RM-WANFW-ITVRF-OUT permit 10
   match ip address prefix-list PL-FW-ALLOW-NETWORKS
!
route-map RM-WANFW-ITVRF-OUT permit 20
   match ip address prefix-list PL-FW-DENY-HOST-ROUTES
!
route-map RM-WANFW-ITVRF-OUT permit 30
   set ip next-hop 10.210.241.65
!
route-map RM-WANFW-OTVRF-OUT permit 10
   match ip address prefix-list PL-FW-ALLOW-NETWORKS
!
route-map RM-WANFW-OTVRF-OUT permit 20
   match ip address prefix-list PL-FW-DENY-HOST-ROUTES
!
route-map RM-WANFW-OTVRF-OUT permit 30
   set ip next-hop 10.210.249.65
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
| IoT | enabled |
| IT | enabled |
| IT-DC | enabled |
| mgmt | disabled |
| OT | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance ehs
!
vrf instance Gnet
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
