# ISMS1OTSP03A

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
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [Interfaces](#interfaces)
  - [Switchport Default](#switchport-default)
  - [Interface Defaults](#interface-defaults)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
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
| Management0 | oob_management | oob | mgmt | 10.210.80.69/21 | 10.210.80.1 |

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
   ip address 10.210.80.69/21
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
| - | S1_OT_FABRIC ISMS1OTSP03A | All | Enabled |

#### SNMP EngineID Configuration

| Type | EngineID (Hex) | IP | Port |
| ---- | -------------- | -- | ---- |
| local | 3e4d259a9393e83c26090de3652e77522f02a606 | - | - |
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
| SNMPManager | network-admin | v3 | sha | aes | - | - | 3e4d259a9393e83c26090de3652e77522f02a606 |

#### SNMP Device Configuration

```eos
!
snmp-server engineID local 3e4d259a9393e83c26090de3652e77522f02a606
snmp-server location S1_OT_FABRIC ISMS1OTSP03A
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
snmp-server user SNMPManager network-admin v3 localized 3e4d259a9393e83c26090de3652e77522f02a606 auth sha <removed> priv aes <removed>
snmp-server enable traps
snmp-server vrf mgmt
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **none**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
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
| Ethernet2/1/1 | [L]_P2P_LINK_TO_ISMS1OTBL01A_Ethernet27/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet2/2/1 | [L]_P2P_LINK_TO_HS11GOTAGG03A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet2/3/1 | [L]_P2P_LINK_TO_HS11AOTAGG03A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet2/4/1 | [L]_P2P_LINK_TO_HS11CWOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet2/5/1 | [L]_P2P_LINK_TO_HS11BEOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/1/1 | [L]_P2P_LINK_TO_ISMS1OTBL02A_Ethernet27/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/2/1 | [L]_P2P_LINK_TO_HS11GOTAGG04A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/3/1 | [L]_P2P_LINK_TO_HS11AOTAGG04A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/4/1 | [L]_P2P_LINK_TO_HS11CWOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet3/5/1 | [L]_P2P_LINK_TO_HS11BEOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/1/1 | [L]_P2P_LINK_TO_HS11JOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/2/1 | [L]_P2P_LINK_TO_HS11COTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/3/1 | [L]_P2P_LINK_TO_HS11JWOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/4/1 | [L]_P2P_LINK_TO_HS11KEOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet4/5/1 | [L]_P2P_LINK_TO_HSM3XNOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/1/1 | [L]_P2P_LINK_TO_HS11JOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/2/1 | [L]_P2P_LINK_TO_HS11COTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/3/1 | [L]_P2P_LINK_TO_HS11JWOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/4/1 | [L]_P2P_LINK_TO_HS11KEOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet5/5/1 | [L]_P2P_LINK_TO_HSM3XNOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/1/1 | [L]_P2P_LINK_TO_HS11JOTAGG03A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/2/1 | [L]_P2P_LINK_TO_HS11COTAGG03A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/3/1 | [L]_P2P_LINK_TO_HS11GWOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/4/1 | [L]_P2P_LINK_TO_HS11HEOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet6/5/1 | [L]_P2P_LINK_TO_HSM3XOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/1/1 | [L]_P2P_LINK_TO_HS11JOTAGG04A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/2/1 | [L]_P2P_LINK_TO_HS11COTAGG04A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/3/1 | [L]_P2P_LINK_TO_HS11GWOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/4/1 | [L]_P2P_LINK_TO_HS11HEOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet7/5/1 | [L]_P2P_LINK_TO_HSM3XOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/1/1 | [L]_P2P_LINK_TO_HS11GOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/2/1 | [L]_P2P_LINK_TO_HS11AOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/3/1 | [L]_P2P_LINK_TO_HS11EWOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet8/4/1 | [L]_P2P_LINK_TO_HS11DEOTAGG01A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet9/1/1 | [L]_P2P_LINK_TO_HS11GOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet9/2/1 | [L]_P2P_LINK_TO_HS11AOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet9/3/1 | [L]_P2P_LINK_TO_HS11EWOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |
| Ethernet9/4/1 | [L]_P2P_LINK_TO_HS11DEOTAGG02A_Ethernet51/1 | routed | - | - | default | 9214 | False | - | - | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet2/1/1
   description [L]_P2P_LINK_TO_ISMS1OTBL01A_Ethernet27/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet2/2/1
   description [L]_P2P_LINK_TO_HS11GOTAGG03A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet2/3/1
   description [L]_P2P_LINK_TO_HS11AOTAGG03A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet2/4/1
   description [L]_P2P_LINK_TO_HS11CWOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet2/5/1
   description [L]_P2P_LINK_TO_HS11BEOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/1/1
   description [L]_P2P_LINK_TO_ISMS1OTBL02A_Ethernet27/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/2/1
   description [L]_P2P_LINK_TO_HS11GOTAGG04A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/3/1
   description [L]_P2P_LINK_TO_HS11AOTAGG04A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/4/1
   description [L]_P2P_LINK_TO_HS11CWOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet3/5/1
   description [L]_P2P_LINK_TO_HS11BEOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/1/1
   description [L]_P2P_LINK_TO_HS11JOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/2/1
   description [L]_P2P_LINK_TO_HS11COTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/3/1
   description [L]_P2P_LINK_TO_HS11JWOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/4/1
   description [L]_P2P_LINK_TO_HS11KEOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet4/5/1
   description [L]_P2P_LINK_TO_HSM3XNOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/1/1
   description [L]_P2P_LINK_TO_HS11JOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/2/1
   description [L]_P2P_LINK_TO_HS11COTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/3/1
   description [L]_P2P_LINK_TO_HS11JWOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/4/1
   description [L]_P2P_LINK_TO_HS11KEOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet5/5/1
   description [L]_P2P_LINK_TO_HSM3XNOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/1/1
   description [L]_P2P_LINK_TO_HS11JOTAGG03A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/2/1
   description [L]_P2P_LINK_TO_HS11COTAGG03A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/3/1
   description [L]_P2P_LINK_TO_HS11GWOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/4/1
   description [L]_P2P_LINK_TO_HS11HEOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet6/5/1
   description [L]_P2P_LINK_TO_HSM3XOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/1/1
   description [L]_P2P_LINK_TO_HS11JOTAGG04A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/2/1
   description [L]_P2P_LINK_TO_HS11COTAGG04A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/3/1
   description [L]_P2P_LINK_TO_HS11GWOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/4/1
   description [L]_P2P_LINK_TO_HS11HEOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet7/5/1
   description [L]_P2P_LINK_TO_HSM3XOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/1/1
   description [L]_P2P_LINK_TO_HS11GOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/2/1
   description [L]_P2P_LINK_TO_HS11AOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/3/1
   description [L]_P2P_LINK_TO_HS11EWOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet8/4/1
   description [L]_P2P_LINK_TO_HS11DEOTAGG01A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet9/1/1
   description [L]_P2P_LINK_TO_HS11GOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet9/2/1
   description [L]_P2P_LINK_TO_HS11AOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet9/3/1
   description [L]_P2P_LINK_TO_HS11EWOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
!
interface Ethernet9/4/1
   description [L]_P2P_LINK_TO_HS11DEOTAGG02A_Ethernet51/1
   no shutdown
   mtu 9214
   no switchport
   ipv6 enable
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 172.21.3.3/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 172.21.3.3/32
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
| default | True (ipv6 interfaces) |
| mgmt | False |

#### IP Routing Device Configuration

```eos
!
ip routing ipv6 interfaces
no ip routing vrf mgmt
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
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
| 65120.21100 | 172.21.3.3 |

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
| Next-hop unchanged | True |
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
| 172.21.3.4 | 65120.21201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.5 | 65120.21201 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.6 | 65120.21202 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.7 | 65120.21202 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.8 | 65120.21203 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.9 | 65120.21203 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.10 | 65120.21204 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.11 | 65120.21204 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.12 | 65120.21205 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.13 | 65120.21205 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.14 | 65120.21206 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.15 | 65120.21206 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.16 | 65120.21207 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.17 | 65120.21207 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.18 | 65120.21208 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.19 | 65120.21208 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.20 | 65120.21209 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.21 | 65120.21209 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.22 | 65120.21210 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.23 | 65120.21210 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.24 | 65120.21211 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.25 | 65120.21211 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.26 | 65120.21212 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.27 | 65120.21212 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.28 | 65120.21213 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.29 | 65120.21213 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.30 | 65120.21214 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.31 | 65120.21214 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.32 | 65120.21215 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.33 | 65120.21215 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.34 | 65120.21216 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.35 | 65120.21216 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.36 | 65120.21217 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.37 | 65120.21217 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.38 | 65120.21218 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.39 | 65120.21218 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.40 | 65120.21200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 172.21.3.41 | 65120.21200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |

#### BGP Neighbor Interfaces

| Neighbor Interface | VRF | Peer Group | Remote AS | Peer Filter |
| ------------------ | --- | ---------- | --------- | ----------- |
| Ethernet2/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21200 | - |
| Ethernet2/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21204 | - |
| Ethernet2/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21208 | - |
| Ethernet2/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21212 | - |
| Ethernet2/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21216 | - |
| Ethernet3/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21200 | - |
| Ethernet3/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21204 | - |
| Ethernet3/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21208 | - |
| Ethernet3/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21212 | - |
| Ethernet3/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21216 | - |
| Ethernet4/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21201 | - |
| Ethernet4/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21205 | - |
| Ethernet4/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21209 | - |
| Ethernet4/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21213 | - |
| Ethernet4/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21217 | - |
| Ethernet5/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21201 | - |
| Ethernet5/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21205 | - |
| Ethernet5/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21209 | - |
| Ethernet5/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21213 | - |
| Ethernet5/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21217 | - |
| Ethernet6/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21202 | - |
| Ethernet6/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21206 | - |
| Ethernet6/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21210 | - |
| Ethernet6/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21214 | - |
| Ethernet6/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21218 | - |
| Ethernet7/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21202 | - |
| Ethernet7/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21206 | - |
| Ethernet7/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21210 | - |
| Ethernet7/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21214 | - |
| Ethernet7/5/1 | default | IPv4-UNDERLAY-PEERS | 65120.21218 | - |
| Ethernet8/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21203 | - |
| Ethernet8/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21207 | - |
| Ethernet8/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21211 | - |
| Ethernet8/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21215 | - |
| Ethernet9/1/1 | default | IPv4-UNDERLAY-PEERS | 65120.21203 | - |
| Ethernet9/2/1 | default | IPv4-UNDERLAY-PEERS | 65120.21207 | - |
| Ethernet9/3/1 | default | IPv4-UNDERLAY-PEERS | 65120.21211 | - |
| Ethernet9/4/1 | default | IPv4-UNDERLAY-PEERS | 65120.21215 | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-PEERS | True | default |

#### Router BGP Device Configuration

```eos
!
router bgp 65120.21100
   router-id 172.21.3.3
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
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor interface Ethernet2/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21200
   neighbor interface Ethernet2/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21204
   neighbor interface Ethernet2/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21208
   neighbor interface Ethernet2/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21212
   neighbor interface Ethernet2/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21216
   neighbor interface Ethernet3/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21200
   neighbor interface Ethernet3/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21204
   neighbor interface Ethernet3/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21208
   neighbor interface Ethernet3/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21212
   neighbor interface Ethernet3/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21216
   neighbor interface Ethernet4/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21201
   neighbor interface Ethernet4/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21205
   neighbor interface Ethernet4/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21209
   neighbor interface Ethernet4/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21213
   neighbor interface Ethernet4/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21217
   neighbor interface Ethernet5/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21201
   neighbor interface Ethernet5/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21205
   neighbor interface Ethernet5/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21209
   neighbor interface Ethernet5/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21213
   neighbor interface Ethernet5/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21217
   neighbor interface Ethernet6/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21202
   neighbor interface Ethernet6/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21206
   neighbor interface Ethernet6/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21210
   neighbor interface Ethernet6/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21214
   neighbor interface Ethernet6/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21218
   neighbor interface Ethernet7/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21202
   neighbor interface Ethernet7/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21206
   neighbor interface Ethernet7/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21210
   neighbor interface Ethernet7/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21214
   neighbor interface Ethernet7/5/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21218
   neighbor interface Ethernet8/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21203
   neighbor interface Ethernet8/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21207
   neighbor interface Ethernet8/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21211
   neighbor interface Ethernet8/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21215
   neighbor interface Ethernet9/1/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21203
   neighbor interface Ethernet9/2/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21207
   neighbor interface Ethernet9/3/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21211
   neighbor interface Ethernet9/4/1 peer-group IPv4-UNDERLAY-PEERS remote-as 65120.21215
   neighbor 172.21.3.4 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.4 remote-as 65120.21201
   neighbor 172.21.3.4 description HS11JOTAGG01A
   neighbor 172.21.3.5 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.5 remote-as 65120.21201
   neighbor 172.21.3.5 description HS11JOTAGG02A
   neighbor 172.21.3.6 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.6 remote-as 65120.21202
   neighbor 172.21.3.6 description HS11JOTAGG03A
   neighbor 172.21.3.7 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.7 remote-as 65120.21202
   neighbor 172.21.3.7 description HS11JOTAGG04A
   neighbor 172.21.3.8 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.8 remote-as 65120.21203
   neighbor 172.21.3.8 description HS11GOTAGG01A
   neighbor 172.21.3.9 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.9 remote-as 65120.21203
   neighbor 172.21.3.9 description HS11GOTAGG02A
   neighbor 172.21.3.10 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.10 remote-as 65120.21204
   neighbor 172.21.3.10 description HS11GOTAGG03A
   neighbor 172.21.3.11 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.11 remote-as 65120.21204
   neighbor 172.21.3.11 description HS11GOTAGG04A
   neighbor 172.21.3.12 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.12 remote-as 65120.21205
   neighbor 172.21.3.12 description HS11COTAGG01A
   neighbor 172.21.3.13 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.13 remote-as 65120.21205
   neighbor 172.21.3.13 description HS11COTAGG02A
   neighbor 172.21.3.14 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.14 remote-as 65120.21206
   neighbor 172.21.3.14 description HS11COTAGG03A
   neighbor 172.21.3.15 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.15 remote-as 65120.21206
   neighbor 172.21.3.15 description HS11COTAGG04A
   neighbor 172.21.3.16 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.16 remote-as 65120.21207
   neighbor 172.21.3.16 description HS11AOTAGG01A
   neighbor 172.21.3.17 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.17 remote-as 65120.21207
   neighbor 172.21.3.17 description HS11AOTAGG02A
   neighbor 172.21.3.18 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.18 remote-as 65120.21208
   neighbor 172.21.3.18 description HS11AOTAGG03A
   neighbor 172.21.3.19 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.19 remote-as 65120.21208
   neighbor 172.21.3.19 description HS11AOTAGG04A
   neighbor 172.21.3.20 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.20 remote-as 65120.21209
   neighbor 172.21.3.20 description HS11JWOTAGG01A
   neighbor 172.21.3.21 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.21 remote-as 65120.21209
   neighbor 172.21.3.21 description HS11JWOTAGG02A
   neighbor 172.21.3.22 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.22 remote-as 65120.21210
   neighbor 172.21.3.22 description HS11GWOTAGG01A
   neighbor 172.21.3.23 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.23 remote-as 65120.21210
   neighbor 172.21.3.23 description HS11GWOTAGG02A
   neighbor 172.21.3.24 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.24 remote-as 65120.21211
   neighbor 172.21.3.24 description HS11EWOTAGG01A
   neighbor 172.21.3.25 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.25 remote-as 65120.21211
   neighbor 172.21.3.25 description HS11EWOTAGG02A
   neighbor 172.21.3.26 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.26 remote-as 65120.21212
   neighbor 172.21.3.26 description HS11CWOTAGG01A
   neighbor 172.21.3.27 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.27 remote-as 65120.21212
   neighbor 172.21.3.27 description HS11CWOTAGG02A
   neighbor 172.21.3.28 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.28 remote-as 65120.21213
   neighbor 172.21.3.28 description HS11KEOTAGG01A
   neighbor 172.21.3.29 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.29 remote-as 65120.21213
   neighbor 172.21.3.29 description HS11KEOTAGG02A
   neighbor 172.21.3.30 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.30 remote-as 65120.21214
   neighbor 172.21.3.30 description HS11HEOTAGG01A
   neighbor 172.21.3.31 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.31 remote-as 65120.21214
   neighbor 172.21.3.31 description HS11HEOTAGG02A
   neighbor 172.21.3.32 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.32 remote-as 65120.21215
   neighbor 172.21.3.32 description HS11DEOTAGG01A
   neighbor 172.21.3.33 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.33 remote-as 65120.21215
   neighbor 172.21.3.33 description HS11DEOTAGG02A
   neighbor 172.21.3.34 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.34 remote-as 65120.21216
   neighbor 172.21.3.34 description HS11BEOTAGG01A
   neighbor 172.21.3.35 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.35 remote-as 65120.21216
   neighbor 172.21.3.35 description HS11BEOTAGG02A
   neighbor 172.21.3.36 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.36 remote-as 65120.21217
   neighbor 172.21.3.36 description HSM3XNOTAGG01A
   neighbor 172.21.3.37 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.37 remote-as 65120.21217
   neighbor 172.21.3.37 description HSM3XNOTAGG02A
   neighbor 172.21.3.38 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.38 remote-as 65120.21218
   neighbor 172.21.3.38 description HSM3XOTAGG01A
   neighbor 172.21.3.39 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.39 remote-as 65120.21218
   neighbor 172.21.3.39 description HSM3XOTAGG02A
   neighbor 172.21.3.40 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.40 remote-as 65120.21200
   neighbor 172.21.3.40 description ISMS1OTBL01A
   neighbor 172.21.3.41 peer group EVPN-OVERLAY-PEERS
   neighbor 172.21.3.41 remote-as 65120.21200
   neighbor 172.21.3.41 description ISMS1OTBL02A
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS next-hop address-family ipv6 originate
      neighbor IPv4-UNDERLAY-PEERS activate
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

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 172.21.3.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 172.21.3.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
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

### VRF Instances Device Configuration

```eos
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
