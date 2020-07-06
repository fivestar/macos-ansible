PLAYBOOK_MACOS := macos.yml
VSCODE_EXTENSIONS_FILE := vscode_extensions.yml

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
	@git pull --rebase

.PHONY: provision
provision:
	@ansible-playbook $(PLAYBOOK_MACOS) --skip-tags "vscode"

.PHONY: vscode
vscode:
	@ansible-playbook $(PLAYBOOK_MACOS) --tags "vscode"

.PHONY: save-vscode-ext
save-vscode-ext:
	- @echo '# automatically generated' > $(VSCODE_EXTENSIONS_FILE)
	- @echo 'vscode_extensions:' >> $(VSCODE_EXTENSIONS_FILE)
	- @code --list-extensions | sed -e 's/^/  - /' >> $(VSCODE_EXTENSIONS_FILE)
	- @cat $(VSCODE_EXTENSIONS_FILE)

.PHONY: dotfiles
dotfiles:
	@ghq get git@github.com:fivestar/dotfiles.git
	@$(MAKE) -C $(HOME)/src/github.com/fivestar/dotfiles

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

