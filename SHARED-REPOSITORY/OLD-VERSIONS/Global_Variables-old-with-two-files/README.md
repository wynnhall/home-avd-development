# TI-SHARED

# Shared Repository

This repository contains shared Global_Variables - SNMP, DNS, NTP etc like most of the base configurations that can be used by other repositories within the organization.

## Contents

- `ansible_vault.yml`: 
    - This file serves as an integral part of Ansible Vault.
    - It enables the secure management of sensitive data, including passwords, API keys, and other secrets within your Ansible playbooks.
- `global_mgmt.yml`: 
    - In the context of the Mgmt_Fabric, this file contains global variables.
    - Specifically, it is templatized for use with inband_mgmt_vrf and inband_mgmt_interface, which will be defined in the Mgmt_fabric repository.
- `global.yml`: 
    - Across various other fabrics, this file also contains global variables.
    - However, it is templatized differently, catering to out-of-band management (mgmt_vrf and mgmt_interface) defined in other fabrics repositories.

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