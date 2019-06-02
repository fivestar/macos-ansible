PLAYBOOK_FILE := macos.yml

.PHONY: all
all: update provision

.PHONY: setup
setup:
	@ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@brew reinstall ansible

.PHONY: update
update:
	@git pull

.PHONY: provision
provision:
	@ansible-playbook $(PLAYBOOK_FILE)

.PHONY: dotfiles
dotfiles:
	@ghq get git@github.com:fivestar/dotfiles.git
	@$(MAKE) -C ~/src/github.com/fivestar/dotfiles

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

