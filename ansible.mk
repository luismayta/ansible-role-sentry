# Ansible
.PHONY: ansible.help
USER:=ubuntu
ANSIBLE_DIR:=$(PROVISION_DIR)/ansible

ansible.help: 
	@echo '    Ansible:'
	@echo ''
	@echo '        ansible.encrypt            encrypt by env'
	@echo '        ansible.decrypt            decrypt by env'
	@echo '        ansible.update             Update Roles ansible by env'
	@echo '        ansible.provision          Provision servers by env'
	@echo '        ansible.deploy             Deploy dependences by env'
	@echo '        ansible.tag                Deploy tag by env'
	@echo ''

ansible.encrypt: clean
	@ansible-vault encrypt "${ANSIBLE_DIR}/${env}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

ansible.decrypt: clean
	@ansible-vault decrypt "${ANSIBLE_DIR}/${env}/vars/vars.yaml" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

ansible.update: clean
	@ansible-galaxy install -r "${ANSIBLE_DIR}/${env}/"requirements.yml \
			   --roles-path "${ANSIBLE_DIR}/${env}"/roles/contrib --force

ansible.provision: clean ansible.update
	@ansible-playbook -v "${ANSIBLE_DIR}/${env}/provision.yaml" -i "${ANSIBLE_DIR}/${env}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${env}.pem" \
					--extra-vars "@${ANSIBLE_DIR}/${env}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}.txt"

ansible.deploy: clean ansible.update
	@ansible-playbook -v "${ANSIBLE_DIR}/${env}/deploy.yaml" -i "${ANSIBLE_DIR}/${env}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${env}.pem" \
					--extra-vars "@${ANSIBLE_DIR}/${env}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}.txt"


ansible.tag: clean ansible.update
	@ansible-playbook -v "${ANSIBLE_DIR}/${env}/deploy.yaml" -i "${ANSIBLE_DIR}/${env}/inventories/aws"  -v \
					--user="${USER}"  --private-key="${KEYS_DIR}/${PROJECT}-${env}.pem" \
					--tags "${tags}" \
					--extra-vars "@${ANSIBLE_DIR}/${env}/vars/vars.yaml" \
					--vault-password-file "${HOME}/${PROJECT}.txt"
