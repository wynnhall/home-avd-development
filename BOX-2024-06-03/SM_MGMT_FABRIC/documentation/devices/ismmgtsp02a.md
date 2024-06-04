# ismmgtsp02a

## Table of Contents

- [Management](#management)
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
| 192.0.2.2 | default | - |
| 192.0.2.3 | default | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf default 192.0.2.2
ip name-server vrf default 192.0.2.3
```

### Domain Lookup

#### DNS Domain Lookup Summary

| Source interface | vrf |
| ---------------- | --- |
| vlan300 | default |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf default source-interface vlan300
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
| vlan300 | default |

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 10.188.255.18 | default | - | - | - | - | - | - | - | - |
| 134.183.87.87 | default | - | - | - | - | - | - | - | - |
| 137.167.66.10 | default | - | - | - | - | - | - | - | - |
| 137.167.210.21 | default | - | - | - | - | - | - | - | - |
| 157.170.147.6 | default | - | - | - | - | - | - | - | - |
| 158.218.8.155 | default | - | - | - | - | - | - | - | - |
| 172.16.44.10 | default | - | - | - | - | - | - | - | - |
| 172.16.169.44 | default | False | - | - | - | - | - | - | - |
| 172.24.254.250 | default | - | - | - | - | - | - | - | - |
| 172.31.225.25 | default | - | - | - | - | - | - | - | - |

#### NTP Device Configuration

```eos
!
ntp local-interface vlan300
ntp server 10.188.255.18
ntp server 134.183.87.87
ntp server 137.167.66.10
ntp server 137.167.210.21
ntp server 157.170.147.6
ntp server 158.218.8.155
ntp server 172.16.44.10
ntp server 172.16.169.44
ntp server 172.24.254.250
ntp server 172.31.225.25
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
| default | Enabled |

#### Management SSH Device Configuration

```eos
!
management ssh
   idle-timeout 30
   no shutdown
   !
   vrf default
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
| default | Ansible-ACL_SM | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   no protocol http
   no shutdown
   !
   vrf default
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
| default | 172.31.225.29 | False | - |
| default | 172.31.226.32 | False | - |

Policy unknown-mandatory-attribute ignore is configured

Global timeout: 20 seconds

#### TACACS Servers Device Configuration

```eos
!
tacacs-server host 172.31.225.29 key 7 <removed>
tacacs-server host 172.31.226.32 key 7 <removed>
tacacs-server policy unknown-mandatory-attribute ignore
tacacs-server timeout 20
```

### IP TACACS Source Interfaces

#### IP TACACS Source Interfaces

| VRF | Source Interface Name |
| --- | --------------- |
| default | vlan300 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf default source-interface vlan300
```

### AAA Server Groups

#### AAA Server Groups Summary

| Server Group Name | Type  | VRF | IP address |
| ------------------| ----- | --- | ---------- |
| tacacs_servers | tacacs+ | default | 172.31.225.29 |
| tacacs_servers | tacacs+ | default | 172.31.226.32 |

#### AAA Server Groups Device Configuration

```eos
!
aaa group server tacacs+ tacacs_servers
   server 172.31.225.29 vrf default
   server 172.31.226.32 vrf default
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
| gzip | 10.210.80.7:9910,10.210.80.8:9910,10.210.80.9:9910 | default | token,/tmp/token | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | True |

#### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=10.210.80.7:9910,10.210.80.8:9910,10.210.80.9:9910 -cvauth=token,/tmp/token -cvvrf=default -cvgnmi -disableaaa -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs -cvconfig
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
| default | vlan300 |

| VRF | Hosts | Ports | Protocol |
| --- | ----- | ----- | -------- |
| default | ents.itg.ti.com | 514 | TCP |

**Syslog facility value:** local7

#### Logging Servers and Features Device Configuration

```eos
!
logging buffered 10000 debugging
logging trap debugging
no logging console
logging monitor debugging
logging synchronous level all
logging host ents.itg.ti.com 514 protocol tcp
logging format timestamp high-resolution
logging format hostname fqdn
logging facility local7
logging source-interface vlan300
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| - | SM_MGMT_FABRIC ismmgtsp02a | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 1eb68394fbe1a017840a659e338974fefab38d7e | - | - |
| remote | 536E4D705454 | entstrap.itg.ti.com | - |
| remote | 536576306E65406363652424 | sevonenms.itg.ti.com | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| vlan300 | default |

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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 1eb68394fbe1a017840a659e338974fefab38d7e |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 1eb68394fbe1a017840a659e338974fefab38d7e
snmp-server location SM_MGMT_FABRIC ismmgtsp02a
snmp-server engineID remote entstrap.itg.ti.com 536E4D705454
snmp-server engineID remote sevonenms.itg.ti.com 536576306E65406363652424
snmp-server vrf default local-interface vlan300
snmp-server community <removed> rw ENTS-SNMP_Access
snmp-server community <removed> ro ENTS-SNMP_Access
snmp-server community <removed> ro SevOne-SNMP_Access
snmp-server community <removed> ro Statseeker-SNMP_Access
snmp-server community <removed> ro NetBrain-SNMP_Access
snmp-server community <removed> ro Airwave-SNMP_Access
snmp-server community <removed> ro NetDisco-SNMP_Access
snmp-server group network-admin v3 auth
snmp-server group network-operator v3 auth
snmp-server user SNMPManager network-admin v3 localized 1eb68394fbe1a017840a659e338974fefab38d7e auth sha <removed> priv aes <removed>
snmp-server enable traps
```

### SFlow

#### SFlow Summary

| VRF | SFlow Source | SFlow Destination | Port |
| --- | ------------ | ----------------- | ---- |
| default | - | sflowle03 | 6343 |
| default | vlan300 | - | - |
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
sflow vrf default destination sflowle03 6343
sflow vrf default source-interface vlan300
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
   reload-delay mlag 1200
   reload-delay non-mlag 1320
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
| 300 | 10.210.80.0/21-DC&MDF-Mgmt | - |
| 308 | 10.210.88.0/23-OOB-Mgmt | - |
| 443 | 10.210.223.0/24-DMF-Mgmt | - |
| 461 | 10.211.240.0/22-SM1-Mgmt | - |
| 462 | 10.215.241.0/24-ADMIN-Mgmt | - |
| 463 | 10.215.242.0/23-SUPPORT-Mgmt | - |
| 549 | MGMTFW-TRANSIT-DEFAULTVRF | - |
| 4093 | LEAF_PEER_L3 | MLAG |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 300
   name 10.210.80.0/21-DC&MDF-Mgmt
!
vlan 308
   name 10.210.88.0/23-OOB-Mgmt
!
vlan 443
   name 10.210.223.0/24-DMF-Mgmt
!
vlan 461
   name 10.211.240.0/22-SM1-Mgmt
!
vlan 462
   name 10.215.241.0/24-ADMIN-Mgmt
!
vlan 463
   name 10.215.242.0/23-SUPPORT-Mgmt
!
vlan 549
   name MGMTFW-TRANSIT-DEFAULTVRF
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
| Ethernet3/1 | [L]_HS11JMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 31 |
| Ethernet3/2 | [L]_HS11CMGT21A_Ethernet50 | *trunk | *461 | *- | *- | 32 |
| Ethernet3/3 | [L]_HS11EWMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 33 |
| Ethernet3/4 | [L]_HS11BEMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 34 |
| Ethernet3/5 | [L]_HSM3XSMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 35 |
| Ethernet3/6 | [L]_HS01AMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 36 |
| Ethernet3/7 | [L]_HS03AMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 37 |
| Ethernet3/25 | [L]_ISMMGTPAN01_Eth1/16 | *access | *549 | *- | *- | 325 |
| Ethernet3/49/1 | [L]_HSMDC1MGTAGG01A_Ethernet98/1 | *trunk | *300 | *- | *- | 349 |
| Ethernet3/52/1 | [L]_MLAG_PEER_ismmgtsp01a_Ethernet3/52/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet4/1 | [L]_HS11JMGT02A_Ethernet50 | *trunk | *461 | *- | *- | 41 |
| Ethernet4/2 | [L]_HS11AMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 42 |
| Ethernet4/3 | [L]_HS11CWMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 43 |
| Ethernet4/4 | [L]_HSM0WMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 44 |
| Ethernet4/5 | [L]_HSM3WMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 45 |
| Ethernet4/6 | [L]_HS01BMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 46 |
| Ethernet4/7 | [L]_HS03BMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 47 |
| Ethernet4/25 | [L]_ISMMGTPAN02_Eth1/16 | *access | *549 | *- | *- | 425 |
| Ethernet4/49/1 | [L]_HSMDC1MGTAGG02A_Ethernet98/1 | *trunk | *300 | *- | *- | 349 |
| Ethernet4/52/1 | [L]_MLAG_PEER_ismmgtsp01a_Ethernet4/52/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet5/1 | [L]_HS11GMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 51 |
| Ethernet5/2 | [L]_HS11AMGT02A_Ethernet50 | *trunk | *461 | *- | *- | 52 |
| Ethernet5/3 | [L]_HS11KEMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 53 |
| Ethernet5/4 | [L]_HSM1WMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 54 |
| Ethernet5/5 | [L]_HS00AMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 55 |
| Ethernet5/6 | [L]_HS01CMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 56 |
| Ethernet5/7 | [L]_HSMMDF1MGT01A_Ethernet50 | *trunk | *300 | *- | *- | 57 |
| Ethernet5/49/1 | [L]_HSMDC2MGTAGG01A_Ethernet98/1 | *trunk | *300 | *- | *- | 549 |
| Ethernet6/1 | [L]_HS11GMGT02A_Ethernet50 | *trunk | *461 | *- | *- | 61 |
| Ethernet6/2 | [L]_HS11JWMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 62 |
| Ethernet6/3 | [L]_HS11HEMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 63 |
| Ethernet6/4 | [L]_HSM2WMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 64 |
| Ethernet6/5 | [L]_HS00BMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 65 |
| Ethernet6/6 | [L]_HS02AMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 66 |
| Ethernet6/7 | [L]_HSMMDF2MGT01A_Ethernet50 | *trunk | *300 | *- | *- | 67 |
| Ethernet6/49/1 | [L]_HSMDC2MGTAGG02A_Ethernet98/1 | *trunk | *300 | *- | *- | 549 |
| Ethernet7/1 | [L]_HS11CMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 71 |
| Ethernet7/2 | [L]_HS11GWMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 72 |
| Ethernet7/3 | [L]_HS11DEMGT01A_Ethernet50 | *trunk | *461 | *- | *- | 73 |
| Ethernet7/4 | [L]_HSM3XNMGT01A_Ethernet50 | *trunk | *463 | *- | *- | 74 |
| Ethernet7/5 | [L]_HS00CMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 75 |
| Ethernet7/6 | [L]_HS02BMGT01A_Ethernet50 | *trunk | *462 | *- | *- | 76 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet3/1
   description [L]_HS11JMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 31 mode active
!
interface Ethernet3/2
   description [L]_HS11CMGT21A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 32 mode active
!
interface Ethernet3/3
   description [L]_HS11EWMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 33 mode active
!
interface Ethernet3/4
   description [L]_HS11BEMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 34 mode active
!
interface Ethernet3/5
   description [L]_HSM3XSMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 35 mode active
!
interface Ethernet3/6
   description [L]_HS01AMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 36 mode active
!
interface Ethernet3/7
   description [L]_HS03AMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 37 mode active
!
interface Ethernet3/25
   description [L]_ISMMGTPAN01_Eth1/16
   no shutdown
   speed 10g
   channel-group 325 mode active
!
interface Ethernet3/49/1
   description [L]_HSMDC1MGTAGG01A_Ethernet98/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 349 mode active
!
interface Ethernet3/52/1
   description [L]_MLAG_PEER_ismmgtsp01a_Ethernet3/52/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet4/1
   description [L]_HS11JMGT02A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 41 mode active
!
interface Ethernet4/2
   description [L]_HS11AMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 42 mode active
!
interface Ethernet4/3
   description [L]_HS11CWMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 43 mode active
!
interface Ethernet4/4
   description [L]_HSM0WMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 44 mode active
!
interface Ethernet4/5
   description [L]_HSM3WMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 45 mode active
!
interface Ethernet4/6
   description [L]_HS01BMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 46 mode active
!
interface Ethernet4/7
   description [L]_HS03BMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 47 mode active
!
interface Ethernet4/25
   description [L]_ISMMGTPAN02_Eth1/16
   no shutdown
   channel-group 425 mode active
!
interface Ethernet4/49/1
   description [L]_HSMDC1MGTAGG02A_Ethernet98/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 349 mode active
!
interface Ethernet4/52/1
   description [L]_MLAG_PEER_ismmgtsp01a_Ethernet4/52/1
   no shutdown
   channel-group 4094 mode active
!
interface Ethernet5/1
   description [L]_HS11GMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 51 mode active
!
interface Ethernet5/2
   description [L]_HS11AMGT02A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 52 mode active
!
interface Ethernet5/3
   description [L]_HS11KEMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 53 mode active
!
interface Ethernet5/4
   description [L]_HSM1WMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 54 mode active
!
interface Ethernet5/5
   description [L]_HS00AMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 55 mode active
!
interface Ethernet5/6
   description [L]_HS01CMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 56 mode active
!
interface Ethernet5/7
   description [L]_HSMMDF1MGT01A_Ethernet50
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 57 mode active
!
interface Ethernet5/49/1
   description [L]_HSMDC2MGTAGG01A_Ethernet98/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 549 mode active
!
interface Ethernet6/1
   description [L]_HS11GMGT02A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 61 mode active
!
interface Ethernet6/2
   description [L]_HS11JWMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 62 mode active
!
interface Ethernet6/3
   description [L]_HS11HEMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 63 mode active
!
interface Ethernet6/4
   description [L]_HSM2WMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 64 mode active
!
interface Ethernet6/5
   description [L]_HS00BMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 65 mode active
!
interface Ethernet6/6
   description [L]_HS02AMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 66 mode active
!
interface Ethernet6/7
   description [L]_HSMMDF2MGT01A_Ethernet50
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 67 mode active
!
interface Ethernet6/49/1
   description [L]_HSMDC2MGTAGG02A_Ethernet98/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 549 mode active
!
interface Ethernet7/1
   description [L]_HS11CMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 71 mode active
!
interface Ethernet7/2
   description [L]_HS11GWMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 72 mode active
!
interface Ethernet7/3
   description [L]_HS11DEMGT01A_Ethernet50
   no shutdown
   switchport access vlan 461
   switchport mode access
   channel-group 73 mode active
!
interface Ethernet7/4
   description [L]_HSM3XNMGT01A_Ethernet50
   no shutdown
   switchport access vlan 463
   switchport mode access
   channel-group 74 mode active
!
interface Ethernet7/5
   description [L]_HS00CMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 75 mode active
!
interface Ethernet7/6
   description [L]_HS02BMGT01A_Ethernet50
   no shutdown
   switchport access vlan 462
   switchport mode access
   channel-group 76 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel31 | [L]_HS11JMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 31 | - |
| Port-Channel32 | [L]_HS11CMGT21A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 32 | - |
| Port-Channel33 | [L]_HS11EWMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 33 | - |
| Port-Channel34 | [L]_HS11BEMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 34 | - |
| Port-Channel35 | [L]_HSM3XSMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 35 | - |
| Port-Channel36 | [L]_HS01AMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 36 | - |
| Port-Channel37 | [L]_HS03AMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 37 | - |
| Port-Channel41 | [L]_HS11JMGT02A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 41 | - |
| Port-Channel42 | [L]_HS11AMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 42 | - |
| Port-Channel43 | [L]_HS11CWMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 43 | - |
| Port-Channel44 | [L]_HSM0WMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 44 | - |
| Port-Channel45 | [L]_HSM3WMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 45 | - |
| Port-Channel46 | [L]_HS01BMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 46 | - |
| Port-Channel47 | [L]_HS03BMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 47 | - |
| Port-Channel51 | [L]_HS11GMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 51 | - |
| Port-Channel52 | [L]_HS11AMGT02A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 52 | - |
| Port-Channel53 | [L]_HS11KEMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 53 | - |
| Port-Channel54 | [L]_HSM1WMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 54 | - |
| Port-Channel55 | [L]_HS00AMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 55 | - |
| Port-Channel56 | [L]_HS01CMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 56 | - |
| Port-Channel57 | [L]_HSMMDF1MGT01A_Po49 | switched | trunk | 300 | - | - | 30 | individual | 57 | - |
| Port-Channel61 | [L]_HS11GMGT02A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 61 | - |
| Port-Channel62 | [L]_HS11JWMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 62 | - |
| Port-Channel63 | [L]_HS11HEMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 63 | - |
| Port-Channel64 | [L]_HSM2WMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 64 | - |
| Port-Channel65 | [L]_HS00BMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 65 | - |
| Port-Channel66 | [L]_HS02AMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 66 | - |
| Port-Channel67 | [L]_HSMMDF2MGT01A_Po49 | switched | trunk | 300 | - | - | 30 | individual | 67 | - |
| Port-Channel71 | [L]_HS11CMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 71 | - |
| Port-Channel72 | [L]_HS11GWMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 72 | - |
| Port-Channel73 | [L]_HS11DEMGT01A_Po49 | switched | trunk | 461 | - | - | 30 | individual | 73 | - |
| Port-Channel74 | [L]_HSM3XNMGT01A_Po49 | switched | trunk | 463 | - | - | 30 | individual | 74 | - |
| Port-Channel75 | [L]_HS00CMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 75 | - |
| Port-Channel76 | [L]_HS02BMGT01A_Po49 | switched | trunk | 462 | - | - | 30 | individual | 76 | - |
| Port-Channel325 | [L]_ISMMGTPAN01_ | switched | access | 549 | - | - | - | - | 325 | - |
| Port-Channel349 | [L]_DC1_MGMT_AGG_LEAFS_Po971 | switched | trunk | 300 | - | - | 30 | individual | 349 | - |
| Port-Channel425 | [L]_ISMMGTPAN02_ | switched | access | 549 | - | - | - | - | 425 | - |
| Port-Channel549 | [L]_DC2_MGMT_AGG_LEAFS_Po971 | switched | trunk | 300 | - | - | 30 | individual | 549 | - |
| Port-Channel4094 | [L]_MLAG_PEER_ismmgtsp01a_Po3521 | switched | trunk | - | - | ['MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel31
   description [L]_HS11JMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 31
!
interface Port-Channel32
   description [L]_HS11CMGT21A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 32
!
interface Port-Channel33
   description [L]_HS11EWMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 33
!
interface Port-Channel34
   description [L]_HS11BEMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 34
!
interface Port-Channel35
   description [L]_HSM3XSMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 35
!
interface Port-Channel36
   description [L]_HS01AMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 36
!
interface Port-Channel37
   description [L]_HS03AMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 37
!
interface Port-Channel41
   description [L]_HS11JMGT02A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 41
!
interface Port-Channel42
   description [L]_HS11AMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 42
!
interface Port-Channel43
   description [L]_HS11CWMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 43
!
interface Port-Channel44
   description [L]_HSM0WMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 44
!
interface Port-Channel45
   description [L]_HSM3WMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 45
!
interface Port-Channel46
   description [L]_HS01BMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 46
!
interface Port-Channel47
   description [L]_HS03BMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 47
!
interface Port-Channel51
   description [L]_HS11GMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 51
!
interface Port-Channel52
   description [L]_HS11AMGT02A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 52
!
interface Port-Channel53
   description [L]_HS11KEMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 53
!
interface Port-Channel54
   description [L]_HSM1WMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 54
!
interface Port-Channel55
   description [L]_HS00AMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 55
!
interface Port-Channel56
   description [L]_HS01CMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 56
!
interface Port-Channel57
   description [L]_HSMMDF1MGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 300
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 57
!
interface Port-Channel61
   description [L]_HS11GMGT02A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 61
!
interface Port-Channel62
   description [L]_HS11JWMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 62
!
interface Port-Channel63
   description [L]_HS11HEMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 63
!
interface Port-Channel64
   description [L]_HSM2WMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 64
!
interface Port-Channel65
   description [L]_HS00BMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 65
!
interface Port-Channel66
   description [L]_HS02AMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 66
!
interface Port-Channel67
   description [L]_HSMMDF2MGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 300
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 67
!
interface Port-Channel71
   description [L]_HS11CMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 71
!
interface Port-Channel72
   description [L]_HS11GWMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 72
!
interface Port-Channel73
   description [L]_HS11DEMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 461
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 73
!
interface Port-Channel74
   description [L]_HSM3XNMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 463
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 74
!
interface Port-Channel75
   description [L]_HS00CMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 75
!
interface Port-Channel76
   description [L]_HS02BMGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 462
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 76
!
interface Port-Channel325
   description [L]_ISMMGTPAN01_
   no shutdown
   switchport
   switchport access vlan 549
   mlag 325
!
interface Port-Channel349
   description [L]_DC1_MGMT_AGG_LEAFS_Po971
   no shutdown
   switchport
   switchport trunk allowed vlan 300
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 349
!
interface Port-Channel425
   description [L]_ISMMGTPAN02_
   no shutdown
   switchport
   switchport access vlan 549
   mlag 425
!
interface Port-Channel549
   description [L]_DC2_MGMT_AGG_LEAFS_Po971
   no shutdown
   switchport
   switchport trunk allowed vlan 300
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 549
!
interface Port-Channel4094
   description [L]_MLAG_PEER_ismmgtsp01a_Po3521
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
| Loopback0 | Router_ID | default | 172.21.0.250/32 |

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
   ip address 172.21.0.250/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan300 | 10.210.80.0/21-DC&MDF-Mgmt | default | - | False |
| Vlan308 | 10.210.88.0/23-OOB-Mgmt | default | - | False |
| Vlan443 | 10.210.223.0/24-DMF-Mgmt | default | - | False |
| Vlan461 | 10.211.240.0/22-SM1-Mgmt | default | - | False |
| Vlan462 | 10.215.241.0/24-ADMIN-Mgmt | default | - | False |
| Vlan463 | 10.215.242.0/23-SUPPORT-Mgmt | default | - | False |
| Vlan549 | MGMTFW-TRANSIT-DEFAULTVRF | default | - | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan300 |  default  |  10.210.80.3/21  |  -  |  10.210.80.1  |  -  |  -  |  -  |
| Vlan308 |  default  |  10.210.88.3/23  |  -  |  10.210.88.1  |  -  |  -  |  -  |
| Vlan443 |  default  |  10.210.223.3/24  |  -  |  10.210.223.1  |  -  |  -  |  -  |
| Vlan461 |  default  |  10.211.240.3/22  |  -  |  10.211.240.1  |  -  |  -  |  -  |
| Vlan462 |  default  |  10.215.241.3/24  |  -  |  10.215.241.1  |  -  |  -  |  -  |
| Vlan463 |  default  |  10.215.242.3/23  |  -  |  10.215.242.1  |  -  |  -  |  -  |
| Vlan549 |  default  |  10.210.241.91/29  |  -  |  10.210.241.89  |  -  |  -  |  -  |
| Vlan4093 |  default  |  192.168.0.3/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.1/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan300
   description 10.210.80.0/21-DC&MDF-Mgmt
   no shutdown
   ip address 10.210.80.3/21
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.210.80.1
   no ip proxy-arp
   no autostate

!
interface Vlan308
   description 10.210.88.0/23-OOB-Mgmt
   no shutdown
   ip address 10.210.88.3/23
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.210.88.1
   no ip proxy-arp
   no autostate

!
interface Vlan443
   description 10.210.223.0/24-DMF-Mgmt
   no shutdown
   ip address 10.210.223.3/24
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.210.223.1
   no ip proxy-arp
   no autostate

!
interface Vlan461
   description 10.211.240.0/22-SM1-Mgmt
   no shutdown
   ip address 10.211.240.3/22
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.211.240.1
   no ip proxy-arp
   no autostate

!
interface Vlan462
   description 10.215.241.0/24-ADMIN-Mgmt
   no shutdown
   ip address 10.215.241.3/24
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.215.241.1
   no ip proxy-arp
   no autostate

!
interface Vlan463
   description 10.215.242.0/23-SUPPORT-Mgmt
   no shutdown
   ip address 10.215.242.3/23
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.215.242.1
   no ip proxy-arp
   no autostate

!
interface Vlan549
   description MGMTFW-TRANSIT-DEFAULTVRF
   no shutdown
   ip address 10.210.241.91/29
   ip helper-address 158.218.194.13
   ip helper-address 172.16.169.30
   ip virtual-router address 10.210.241.89
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

#### IP Routing Device Configuration

```eos
!
ip routing
no ip icmp redirect
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| default | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| default | 0.0.0.0/0 | 10.210.241.94 | - | 225 | - | ISMMGTPAN01-02 | 225 |

#### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 10.210.241.94 225 name ISMMGTPAN01-02 metric 225
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65120.510 | 172.21.0.250 |

| BGP Tuning |
| ---------- |
| bgp asn notation asdot |
| distance bgp 20 200 200 |
| timers bgp 5 15 |
| neighbor default send-community |
| update wait-install |
| no bgp default ipv4-unicast |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |

##### MGMTFW-EBGP-PEERS

| Settings | Value |
| -------- | ----- |
| Remote AS | 65120.511 |
| Maximum routes | 0 (no limit) |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65120.510 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 192.168.0.2 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.210.241.94 | Inherited from peer group MGMTFW-EBGP-PEERS | default | - | - | Inherited from peer group MGMTFW-EBGP-PEERS | - | - | - | - | - | - |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| default | - | - |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.510
   router-id 172.21.0.250
   maximum-paths 4 ecmp 4
   update wait-install
   no bgp default ipv4-unicast
   bgp asn notation asdot
   distance bgp 20 200 200
   timers bgp 5 15
   neighbor default send-community
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor MGMTFW-EBGP-PEERS peer group
   neighbor MGMTFW-EBGP-PEERS remote-as 65120.511
   neighbor MGMTFW-EBGP-PEERS maximum-routes 0
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65120.510
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description ismmgtsp01a
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor 192.168.0.2 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 192.168.0.2 description ismmgtsp01a
   redistribute connected route-map RM-MGMT-NETWORKS
   !
   address-family ipv4
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf default
      update wait-install
      neighbor 10.210.241.94 peer group MGMTFW-EBGP-PEERS
      neighbor 10.210.241.94 description ismmgtpan01-02
      neighbor 10.210.241.94 route-map RM-default-10.210.241.94-SET-NEXT-HOP-OUT out
      !
      address-family ipv4
         neighbor 10.210.241.94 activate
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

##### PL-MGMT-NETWORKS

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.211.240.0/22 |
| 20 | permit 10.215.241.0/24 |
| 30 | permit 10.215.242.0/23 |
| 40 | permit 10.210.80.0/21 |
| 50 | permit 10.210.88.0/23 |
| 60 | permit 10.210.223.0/24 |
| 70 | permit 10.210.241.88/29 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-MGMT-NETWORKS
   seq 10 permit 10.211.240.0/22
   seq 20 permit 10.215.241.0/24
   seq 30 permit 10.215.242.0/23
   seq 40 permit 10.210.80.0/21
   seq 50 permit 10.210.88.0/23
   seq 60 permit 10.210.223.0/24
   seq 70 permit 10.210.241.88/29
```

### Route-maps

#### Route-maps Summary

##### RM-default-10.210.241.94-SET-NEXT-HOP-OUT

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | ip next-hop 10.210.241.89 | - | - |

##### RM-MGMT-NETWORKS

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-MGMT-NETWORKS | - | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-default-10.210.241.94-SET-NEXT-HOP-OUT permit 10
   set ip next-hop 10.210.241.89
!
route-map RM-MGMT-NETWORKS permit 10
   match ip address prefix-list PL-MGMT-NETWORKS
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

### VRF Instances Device Configuration

```eos
```

## EOS CLI Device Configuration

```eos
!
router bgp 65120.510
  no neighbor IPv4-UNDERLAY-PEERS peer group

```
