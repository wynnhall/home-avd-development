# TI-SHARED

# Shared Repository

This repository contains shared Global_Variables - SNMP, DNS, NTP etc like most of the base configurations that can be used by other repositories within the organization.

## Contents

- `ansible_vault.yml`: 
    - This file serves as an integral part of Ansible Vault.
    - It enables the secure management of sensitive data, including passwords, API keys, and other secrets within your Ansible playbooks.
- `global.yml`: 
    - This file contains global variables and it is templatized to cater both "mgmt"/"default" vrf with {{ mgmt_interface_vrf }} and different management interfaces -mgmt0/mgmt1/inband vlan interface with "{{ custom_mgmt_interface }}" defined in other fabrics repositories.
    
    *** Note: These variables, {{ mgmt_interface_vrf }} and {{ custom_mgmt_interface }}, are rewritten in the SM-MGMT_FABRIC repository to their local inband values: mgmt_interface_vrf: "{{ inband_mgmt_vrf }}" and custom_mgmt_interface: "{{ inband_mgmt_interface }}".***

## Usage

1. **Cloning Repositories**:
   - Each fabric repository (e.g., Mgmt_Fabric, DC1_Fabrics) will clone this SHARED Repository using the `ansible.builtin.git` module.
   - The cloned repository will create a local folder containing shared variables.

2. **Vars_Plugin Integration**:
   - The shared variables will be included into the fabric repositories using the Vars_Plugin.

3. **Pre-Built Paths in ansible.cfg**:
    - The paths to global.yml and global_mgmt.yml from the cloned Global_variables within the existing fabric will be pre-configured in the ansible.cfg file of each fabric repository.
    - It’s important to refrain from modifying these paths within the fabric repositories.

4. **Global Variables Updates**:
   - Any changes to global variables should be made directly in the SHARED Repository.
   - Fabric repositories should not modify the shared variables locally.