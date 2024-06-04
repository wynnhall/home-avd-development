.PHONY: help
# Show this help.
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

################################################################################
#  RA_IT_FABRIC
################################################################################
.PHONY: RA_IT_FABRIC-build
RA_IT_FABRIC-build: ## Run ansible-playbook to build SM_MGMT_FABRIC
	ansible-playbook playbooks/build.yml -i ra-dev/RA_IT_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=RA_IT_FABRIC

.PHONY: RA_IT_FABRIC-clean
RA_IT_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly SM_MGMT_FABRIC
	ansible-playbook playbooks/clean.yml -i ra-dev/RA_IT_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=RA_IT_FABRIC

.PHONY: RA_IT_FABRIC-deploy
RA_IT_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i ra-dev/RA_IT_FABRIC/inventory.yml --ask-vault-pass -e "fabric_name=RA_IT_FABRIC container_root=RA"

################################################################################
#  SM_MGMT_FABRIC
################################################################################
.PHONY: SM_MGMT_FABRIC-build
SM_MGMT_FABRIC-build: ## Run ansible-playbook to build SM_MGMT_FABRIC
	ansible-playbook playbooks/build.yml -i sm/SM_MGMT_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=SM_MGMT_FABRIC

.PHONY: SM_MGMT_FABRIC-clean
SM_MGMT_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly SM_MGMT_FABRIC
	ansible-playbook playbooks/clean.yml -i sm/SM_MGMT_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=SM_MGMT_FABRIC

.PHONY: SM_MGMT_FABRIC-deploy
SM_MGMT_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i sm/SM_MGMT_FABRIC/inventory.yml --ask-vault-pass -e "fabric_name=SM_MGMT_FABRIC container_root=SM"

################################################################################
#  SM_CORE_MISC_FABRIC
################################################################################
.PHONY: SM_CORE_MISC_FABRIC-build
SM_CORE_MISC_FABRIC-build: ## Run ansible-playbook to build SM_CORE_MISC_FABRIC
	ansible-playbook playbooks/build.yml -i sm/SM_CORE_MISC_FABRIC-REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_CORE_MISC_FABRIC

.PHONY: SM_CORE_MISC_FABRIC-clean
SM_CORE_MISC_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly SM_CORE_MISC_FABRIC
	ansible-playbook playbooks/clean.yml -i sm/SM_CORE_MISC_FABRIC-REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_CORE_MISC_FABRIC

.PHONY: SM_CORE_MISC_FABRIC-deploy
SM_CORE_MISC_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i sm/SM_CORE_MISC_FABRIC-REPOSITORY/inventory.yml --ask-vault-pass -e "fabric_name=SM_CORE_MISC_FABRIC container_root=SM"


################################################################################
#  SM_DC1-DC2_FABRIC
################################################################################
.PHONY: SM_DC1-DC2_FABRIC-build
SM_DC1-DC2_FABRIC-build: ## Run ansible-playbook to build SM_DC1-DC2_FABRIC
	ansible-playbook playbooks/build.yml -i sm/SM_DC1-DC2_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_DC1-DC2_FABRIC

.PHONY: SM_DC1-DC2_FABRIC-clean
SM_DC1-DC2_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly SM_DC1-DC2_FABRIC
	ansible-playbook playbooks/clean.yml -i sm/SM_DC1-DC2_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_DC1-DC2_FABRIC

.PHONY: SM_DC1-DC2_FABRIC-deploy
SM_DC1-DC2_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i sm/SM_DC1-DC2_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e "fabric_name=SM_DC1-DC2_FABRIC container_root=SM"

	
################################################################################
#  SM_IT_FABRIC
################################################################################
.PHONY: SM_IT_FABRIC-build
SM_IT_FABRIC-build: ## Run ansible-playbook to build SM_IT_FABRIC
	ansible-playbook playbooks/build.yml -i sm/SM_IT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_IT_FABRIC

.PHONY: SM_IT_FABRIC-clean
SM_IT_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly SM_IT_FABRIC
	ansible-playbook playbooks/clean.yml -i sm/SM_IT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=SM_IT_FABRIC

.PHONY: SM_IT_FABRIC-deploy
SM_IT_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i sm/SM_IT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e "fabric_name=SM_IT_FABRIC container_root=SM"


################################################################################
#  S1_OT_FABRIC
################################################################################
.PHONY: S1_OT_FABRIC-build
S1_OT_FABRIC-build: ## Run ansible-playbook to build S1_OT_FABRIC
	ansible-playbook playbooks/build.yml -i sm/S1_OT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=S1_OT_FABRIC

.PHONY: S1_OT_FABRIC-clean
S1_OT_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly S1_OT_FABRIC
	ansible-playbook playbooks/clean.yml -i sm/S1_OT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e fabric_name=S1_OT_FABRIC

.PHONY: S1_OT_FABRIC-deploy
S1_OT_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i sm/S1_OT_FABRIC_REPOSITORY/inventory.yml --ask-vault-pass -e "fabric_name=S1_OT_FABRIC container_root=SM"


################################################################################
#  L2LS_FABRIC
################################################################################
.PHONY: L2LS_FABRIC-build
L2LS_FABRIC-build: ## Run ansible-playbook to build L2LS_FABRIC
	ansible-playbook playbooks/build.yml -i project1/L2LS_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=DC1_FABRIC

.PHONY: L2LS_FABRIC-clean
L2LS_FABRIC-clean: ## Run ansible-playbook to remove intended/ directories and re-build cleanly L2LS_FABRIC
	ansible-playbook playbooks/clean.yml -i project1/L2LS_FABRIC/inventory.yml --ask-vault-pass -e fabric_name=DC1_FABRIC

.PHONY: L2LS_FABRIC-deploy
L2LS_FABRIC-deploy: ## Run ansible playbook to deploy configs to CVP
	ansible-playbook playbooks/deploy.yml -i project1/L2LS_FABRIC/inventory.yml --ask-vault-pass -e "fabric_name=DC1_FABRIC container_root=DC1"