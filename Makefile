PLAYBOOK_MACOS := macos.yml

.DEFAULT_GOAL := homebrew

.PHONY: all
all: ansible macos

.PHONY: update
update:
	@git pull --rebase

.PHONY: ansible
ansible:
	@brew update
	@brew reinstall ansible

.PHONY: macos
macos:
	@ansible-playbook $(PLAYBOOK_MACOS) --tags "homebrew,zsh" -K

.PHONY: homebrew
homebrew:
	@ansible-playbook $(PLAYBOOK_MACOS) --tags "homebrew"

.PHONY: zsh
zsh:
	@ansible-playbook $(PLAYBOOK_MACOS) --tags "zsh" -K

.PHONY: vscode
vscode:
	@echo 'Do enable Settings Sync'

.PHONY: dein
dein:
	@open 'https://github.com/Shougo/dein-installer.vim'

.PHONY: solarized
solarized:
	@ghq get https://github.com/tomislav/osx-terminal.app-colors-solarized.git


.PHONY: gcloud
gcloud: gcloud-install gcloud-setup

.PHONY: gcloud-install
gcloud-install:
	@curl https://sdk.cloud.google.com | bash

.PHONY: gcloud-setup
gcloud-setup:
	@gcloud auth login
	@gcloud auth application-default login
	@gcloud components install gke-gcloud-auth-plugin

.PHONY: volta
volta:
	@curl https://get.volta.sh | bash

