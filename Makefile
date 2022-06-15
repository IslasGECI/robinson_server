all: init create_server host_known sleep setup_server

.PHONY: \
	all \
	check \
	create_server \
	destroy_server \
	format \
	host_known \
	init \
	setup_server \
	sleep

clean:
	rm --force --recursive src/.terraform
	rm --force src/.terraform.lock.hcl
	rm --force src/terraform.tfstate*

create_server:
	cd src && terraform apply -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

destroy_server:
	cd src && terraform destroy -auto-approve -var "do_token=$${DO_PAT}" -var "pvt_key=$${HOME}/.ssh/id_rsa"

host_known:
	ssh-keyscan "robinsondata.icu" > "$${HOME}/.ssh/known_hosts"

init:
	cd src && terraform init

format:
	cd src && terraform fmt

check:
	ansible-lint ansible-playbook.yml
	cd src && terraform fmt -check

setup_server:
	ansible-playbook ansible-playbook.yml

sleep:
	@echo "Wait idle to avoid conflicts with APT. 😴 💤 😪"
	sleep 100
