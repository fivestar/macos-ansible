# macos-ansible

## Setting up the macOS with Ansible

### Installing essentials

```console
$ sudo xcodebuild -license
$ xcode-select --install
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install ansible
```

```console
$ git clone git@github.com:fivestar/macos-ansible.git src/github.com/fivestar/macos-ansible
$ cd src/github.com/fivestar/macos-ansible
```

### Executing a playbook

```console
$ ansible-playbook macos.yml
```

### As you like it

* [Shougo/dein.vim](https://github.com/Shougo/dein.vim)
    ```console
    $ pip3 install neovim
    $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s -- ~/.cache/dein
    ```

* [tomislav/osx-terminal.app-colors-solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized)
    ```console
    $ ghq get https://github.com/tomislav/osx-terminal.app-colors-solarized.git
    ```

* [Cloud SDK - Google Cloud Platform](https://cloud.google.com/sdk/downloads#interactive)
    ```console
    $ curl https://sdk.cloud.google.com | bash
    $ gcloud auth login
    $ gcloud auth application-default login
    ```
