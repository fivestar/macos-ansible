PLAYBOOK_MACOS := macos.yml
VSCODE_EXTENSIONS_FILE := vscode_extensions.yml

DOTFILES_REPO := fivestar/dotfiles

.PHONY: all
all: macos

.PHONY: update
update:
	@git pull --rebase

.PHONY: setup
setup: install-homebrew ansible

.PHONY: install-homebrew
brew:
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
	#@ansible-playbook $(PLAYBOOK_MACOS) --tags "vscode"
	@echo 'Do enable Settings Sync'

.PHONY: dotfiles
dotfiles:
	@mkdir -p $(HOME)/tmp && chmod 700 $(HOME)/tmp
	@ghq get git@github.com:$(DOTFILES_REPO).git
	@$(MAKE) -C $(HOME)/src/github.com/$(DOTFILES_REPO)

.PHONY: dein
dein:
	@echo 'https://github.com/Shougo/dein-installer.vim'

.PHONY: solarized
solarized:
	@ghq get https://github.com/tomislav/osx-terminal.app-colors-solarized.git

.PHONY: gcloud
gcloud:
	@curl https://sdk.cloud.google.com | bash
	@gcloud auth login
	@gcloud auth application-default login
	@gcloud components install gke-gcloud-auth-plugin

.PHONY: volta
volta:
	@curl https://get.volta.sh | bash

