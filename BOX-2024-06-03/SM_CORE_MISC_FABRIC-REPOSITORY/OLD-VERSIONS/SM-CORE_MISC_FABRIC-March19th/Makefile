################################################################################
# AVD Commands
################################################################################

.PHONY: pull
pull: ## Run ansible playbook to pull the SHARED repository for global vars and ansible-vault variables.
	ansible-playbook playbooks/pull.yml 

.PHONY: build
build: ## Run ansible playbook to build CORE_MISC Fabric configuration.
	ansible-playbook playbooks/build.yml --tags build

.PHONY: provision
provision: ## Run ansible playbook to deploy CORE_MISC Fabric.
	ansible-playbook playbooks/deploy.yml --tags provision
