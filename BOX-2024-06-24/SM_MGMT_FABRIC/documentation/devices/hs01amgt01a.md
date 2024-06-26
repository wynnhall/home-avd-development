# hs01amgt01a

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
| vlan462 | default |

#### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf default source-interface vlan462
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
| vlan462 | default |

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
ntp local-interface vlan462
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
| default | vlan462 |

#### IP TACACS Source Interfaces Device Configuration

```eos
!
ip tacacs vrf default source-interface vlan462
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
| default | vlan462 |

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
logging source-interface vlan462
```

### SNMP

#### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| - | SM_MGMT_FABRIC hs01amgt01a | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | b70749d1ef68236a74ab2ffde8f43f26cee644c6 | - | - |
| remote | 536E4D705454 | entstrap.itg.ti.com | - |
| remote | 536576306E65406363652424 | sevonenms.itg.ti.com | - |

#### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| vlan462 | default |

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
| SNMPManager | network-admin | v3 | sha | aes | - | - | b70749d1ef68236a74ab2ffde8f43f26cee644c6 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local b70749d1ef68236a74ab2ffde8f43f26cee644c6
snmp-server location SM_MGMT_FABRIC hs01amgt01a
snmp-server engineID remote entstrap.itg.ti.com 536E4D705454
snmp-server engineID remote sevonenms.itg.ti.com 536576306E65406363652424
snmp-server vrf default local-interface vlan462
snmp-server community <removed> rw ENTS-SNMP_Access
snmp-server community <removed> ro ENTS-SNMP_Access
snmp-server community <removed> ro SevOne-SNMP_Access
snmp-server community <removed> ro Statseeker-SNMP_Access
snmp-server community <removed> ro NetBrain-SNMP_Access
snmp-server community <removed> ro Airwave-SNMP_Access
snmp-server community <removed> ro NetDisco-SNMP_Access
snmp-server group network-admin v3 auth
snmp-server group network-operator v3 auth
snmp-server user SNMPManager network-admin v3 localized b70749d1ef68236a74ab2ffde8f43f26cee644c6 auth sha <removed> priv aes <removed>
snmp-server enable traps
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
| 462 | INBAND_MGMT | - |
| 1000 | Native_VLAN | - |

### VLANs Device Configuration

```eos
!
vlan 462
   name INBAND_MGMT
!
vlan 1000
   name Native_VLAN
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
| Ethernet1 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet2 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet3 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet4 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet5 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet6 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet7 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet8 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet9 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet10 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet11 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet12 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet13 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet14 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet15 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet16 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet17 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet18 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet19 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet20 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet21 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet22 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet23 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet24 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet25 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet26 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet27 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet28 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet29 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet30 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet31 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet32 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet33 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet34 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet35 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet36 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet37 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet38 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet39 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet40 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet41 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet42 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet43 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet44 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet45 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet46 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet47 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet48 |  [L]_VL462-ADMIN-Mgmt_ | access | 462 | - | - | - |
| Ethernet49 | [L]_ISMMGTSP01A_Ethernet3/6 | *trunk | *462,1000 | *1000 | *- | 49 |
| Ethernet50 | [L]_ISMMGTSP02A_Ethernet3/6 | *trunk | *462,1000 | *1000 | *- | 49 |

*Inherited from Port-Channel Interface

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet2
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet3
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet4
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet5
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet6
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet7
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet8
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet9
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet10
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet11
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet12
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet13
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet14
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet15
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet16
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet17
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet18
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet19
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet20
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet21
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet22
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet23
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet24
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet25
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet26
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet27
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet28
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet29
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet30
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet31
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet32
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet33
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet34
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet35
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet36
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet37
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet38
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet39
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet40
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet41
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet42
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet43
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet44
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet45
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet46
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet47
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet48
   description [L]_VL462-ADMIN-Mgmt_
   no shutdown
   switchport access vlan 462
   switchport mode access
   switchport
   spanning-tree portfast
   spanning-tree bpduguard enable
   no logging event link-status
   no snmp trap link-change

!
interface Ethernet49
   description [L]_ISMMGTSP01A_Ethernet3/6
   no shutdown
   channel-group 49 mode active
!
interface Ethernet50
   description [L]_ISMMGTSP02A_Ethernet3/6
   no shutdown
   channel-group 49 mode active
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel49 | [L]_MGMT_SPINES_Po36 | switched | trunk | 462,1000 | 1000 | - | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel49
   description [L]_MGMT_SPINES_Po36
   no shutdown
   switchport
   switchport trunk allowed vlan 462,1000
   switchport trunk native vlan 1000
   switchport mode trunk
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| vlan462 | 10.215.241.0/24-ADMIN-Mgmt | default | - | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| vlan462 |  default  |  10.215.241.25/24  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface vlan462
   description 10.215.241.0/24-ADMIN-Mgmt
   no shutdown
   ip address 10.215.241.25/24
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
| default | 0.0.0.0/0 | 10.215.241.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route 0.0.0.0/0 10.215.241.1
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
