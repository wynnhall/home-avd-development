# hsmdc2mgtagg01a

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
  - [VLAN Interfaces](#vlan-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
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
| - | SM_MGMT_FABRIC [DC2 Rack F1] hsmdc2mgtagg01a | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 2f205ea1902af259077ec8a2efd2d744faeda268 | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 2f205ea1902af259077ec8a2efd2d744faeda268 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 2f205ea1902af259077ec8a2efd2d744faeda268
snmp-server location SM_MGMT_FABRIC [DC2 Rack F1] hsmdc2mgtagg01a
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
snmp-server user SNMPManager network-admin v3 localized 2f205ea1902af259077ec8a2efd2d744faeda268 auth sha <removed> priv aes <removed>
snmp-server enable traps
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
   reload-delay mlag 300
   reload-delay non-mlag 330
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 16384 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4094
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
| 240 | 10.210.20.0/24-SM-NMS-Servers | - |
| 300 | INBAND_MGMT | - |
| 316 | 10.210.96.0/22-Serv-iLO-Mgmt | - |
| 1000 | Native_VLAN | - |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
!
vlan 240
   name 10.210.20.0/24-SM-NMS-Servers
!
vlan 300
   name INBAND_MGMT
!
vlan 316
   name 10.210.96.0/22-Serv-iLO-Mgmt
!
vlan 1000
   name Native_VLAN
!
vlan 4094
   name MLAG_PEER
   trunk group MLAG
```

## Interfaces

### Switchport Default

#### Switchport Defaults Summary

- Default Switchport Mode: access

#### Switchport Default Device Configuration

```eos
!
switchport default mode access
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
| Ethernet1 | [L]_HSMDC2MGT01A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 1 |
| Ethernet2 | [L]_HSMDC2MGT02A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 2 |
| Ethernet3 | [L]_HSMDC2MGT03A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 3 |
| Ethernet4 | [L]_HSMDC2MGT04A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 4 |
| Ethernet5 | [L]_HSMDC2MGT05A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 5 |
| Ethernet6 | [L]_HSMDC2MGT06A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 6 |
| Ethernet7 | [L]_HSMDC2MGT07A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 7 |
| Ethernet8 | [L]_HSMDC2MGT08A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 8 |
| Ethernet9 | [L]_HSMDC2MGT09A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 9 |
| Ethernet10 | [L]_HSMDC2MGT10A_Ethernet49 | *trunk | *240,300,316,1000 | *1000 | *- | 10 |
| Ethernet94 |  [L]_ISMDC2BL01A_Ma1 | access | 300 | - | - | - |
| Ethernet95 |  [L]_ISMDC2SP01A_Ma1 | access | 300 | - | - | - |
| Ethernet96 |  [L]_ISMDC2SP03A_Ma1 | access | 300 | - | - | - |
| Ethernet97/1 | [L]_ISMMGTSP01A_Ethernet5/49/1 | *trunk | *240,300,316,1000 | *1000 | *- | 971 |
| Ethernet98/1 | [L]_ISMMGTSP02A_Ethernet5/49/1 | *trunk | *240,300,316,1000 | *1000 | *- | 971 |
| Ethernet103/1 | [L]_MLAG_PEER_hsmdc2mgtagg02a_Ethernet103/1 | *trunk | *- | *- | *['MLAG'] | 4094 |
| Ethernet104/1 | [L]_MLAG_PEER_hsmdc2mgtagg02a_Ethernet104/1 | *trunk | *- | *- | *['MLAG'] | 4094 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description [L]_HSMDC2MGT01A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 1 mode active
!
interface Ethernet2
   description [L]_HSMDC2MGT02A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 2 mode active
!
interface Ethernet3
   description [L]_HSMDC2MGT03A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 3 mode active
!
interface Ethernet4
   description [L]_HSMDC2MGT04A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 4 mode active
!
interface Ethernet5
   description [L]_HSMDC2MGT05A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 5 mode active
!
interface Ethernet6
   description [L]_HSMDC2MGT06A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 6 mode active
!
interface Ethernet7
   description [L]_HSMDC2MGT07A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 7 mode active
!
interface Ethernet8
   description [L]_HSMDC2MGT08A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 8 mode active
!
interface Ethernet9
   description [L]_HSMDC2MGT09A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 9 mode active
!
interface Ethernet10
   description [L]_HSMDC2MGT10A_Ethernet49
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 10 mode active
!
interface Ethernet94
   description [L]_ISMDC2BL01A_Ma1
   no shutdown
   switchport access vlan 300
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet95
   description [L]_ISMDC2SP01A_Ma1
   no shutdown
   switchport access vlan 300
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet96
   description [L]_ISMDC2SP03A_Ma1
   no shutdown
   switchport access vlan 300
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet97/1
   description [L]_ISMMGTSP01A_Ethernet5/49/1
   no shutdown
   channel-group 971 mode active
!
interface Ethernet98/1
   description [L]_ISMMGTSP02A_Ethernet5/49/1
   no shutdown
   channel-group 971 mode active
!
interface Ethernet103/1
   description [L]_MLAG_PEER_hsmdc2mgtagg02a_Ethernet103/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 4094 mode active
!
interface Ethernet104/1
   description [L]_MLAG_PEER_hsmdc2mgtagg02a_Ethernet104/1
   no shutdown
   switchport access vlan 300
   switchport mode access
   channel-group 4094 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel1 | [L]_HSMDC2MGT01A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 1 | - |
| Port-Channel2 | [L]_HSMDC2MGT02A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 2 | - |
| Port-Channel3 | [L]_HSMDC2MGT03A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 3 | - |
| Port-Channel4 | [L]_HSMDC2MGT04A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 4 | - |
| Port-Channel5 | [L]_HSMDC2MGT05A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 5 | - |
| Port-Channel6 | [L]_HSMDC2MGT06A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 6 | - |
| Port-Channel7 | [L]_HSMDC2MGT07A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 7 | - |
| Port-Channel8 | [L]_HSMDC2MGT08A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 8 | - |
| Port-Channel9 | [L]_HSMDC2MGT09A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 9 | - |
| Port-Channel10 | [L]_HSMDC2MGT10A_Po49 | switched | trunk | 240,300,316,1000 | 1000 | - | 30 | individual | 10 | - |
| Port-Channel971 | [L]_MGMT_SPINES_Po549 | switched | trunk | 240,300,316,1000 | 1000 | - | - | - | 971 | - |
| Port-Channel4094 | [L]_MLAG_PEER_hsmdc2mgtagg02a_Po1031 | switched | trunk | - | - | ['MLAG'] | 30 | individual | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel1
   description [L]_HSMDC2MGT01A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 1
!
interface Port-Channel2
   description [L]_HSMDC2MGT02A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 2
!
interface Port-Channel3
   description [L]_HSMDC2MGT03A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 3
!
interface Port-Channel4
   description [L]_HSMDC2MGT04A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 4
!
interface Port-Channel5
   description [L]_HSMDC2MGT05A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 5
!
interface Port-Channel6
   description [L]_HSMDC2MGT06A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 6
!
interface Port-Channel7
   description [L]_HSMDC2MGT07A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 7
!
interface Port-Channel8
   description [L]_HSMDC2MGT08A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 8
!
interface Port-Channel9
   description [L]_HSMDC2MGT09A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 9
!
interface Port-Channel10
   description [L]_HSMDC2MGT10A_Po49
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
   mlag 10
!
interface Port-Channel971
   description [L]_MGMT_SPINES_Po549
   no shutdown
   switchport
   switchport trunk allowed vlan 240,300,316,1000
   switchport trunk native vlan 1000
   switchport mode trunk
   mlag 971
!
interface Port-Channel4094
   description [L]_MLAG_PEER_hsmdc2mgtagg02a_Po1031
   no shutdown
   switchport
   switchport mode trunk
   switchport trunk group MLAG
   port-channel lacp fallback timeout 30
   port-channel lacp fallback individual
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| vlan300 | 10.210.80.0/21-DC&MDF-Mgmt | default | 1500 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| vlan300 |  default  |  10.210.80.113/21  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  192.168.0.0/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface vlan300
   description 10.210.80.0/21-DC&MDF-Mgmt
   no shutdown
   mtu 1500
   ip address 10.210.80.113/21
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

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |

#### IP Routing Device Configuration

```eos
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
| default | 0.0.0.0/0 | 10.210.80.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 10.210.80.1
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
logging event congestion-drops interval 600
no logging repeat-messages
logging level all debugging
logging event link-status global
service unsupported-transceiver TexasInstruments ffd6c10c

```
