PLAYBOOK_MACOS := macos.yml
CODE_VARS_FILE := roles/code/vars/main.yml

.PHONY: all
all: update provision

.PHONY: setup
setup: homebrew ansible

.PHONY: homebrew
brew:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: ansible
ansible:
	@brew reinstall ansible

.PHONY: update
update:
	@git pull

.PHONY: provision
provision:
	@ansible-playbook $(PLAYBOOK_MACOS) --skip-tags "code"

.PHONY: code
code:
	@ansible-playbook $(PLAYBOOK_MACOS) --tags "code"

.PHONY: dotfiles
dotfiles:
	@ghq get git@github.com:fivestar/dotfiles.git
	@$(MAKE) -C $(HOME)/src/github.com/fivestar/dotfiles

.PHONY: update-code-vars
update-code-vars:
	- @echo '# automatically generated' > $(CODE_VARS_FILE)
	- @echo 'code_extensions:' >> $(CODE_VARS_FILE)
	- @code --list-extensions | sed -e 's/^/  - /' >> $(CODE_VARS_FILE)
	- @cat $(CODE_VARS_FILE)

.PHONY: dein
dein:
	@pip3 install neovim
	@curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s -- ~/.cache/dein

.PHONY: solarized
solarized:
	@ghq get https://github.com/tomislav/osx-terminal.app-colors-solarized.git

.PHONY: gcloud
gcloud:
	@curl https://sdk.cloud.google.com | bash
	@gcloud auth login
	@gcloud auth application-default login

