# macos-ansible

## Setting up macOS

### Install essentials

```console
$ sudo xcodebuild -license
$ xcode-select --install
```

```console
$ git clone git@github.com:fivestar/macos-ansible.git src/github.com/fivestar/macos-ansible
$ cd src/github.com/fivestar/macos-ansible
$ make setup
```

### Provision

```console
$ make provision
```

### Visual Studio Code

#### Install user settings and extensions

```console
$ make code
```

#### Update a list of extensions

```console
$ make update-code-vars
```

### Extra packages

* [fivestar/dotfiles](https://github.com/fivestar/dotfiles)
    ```console
    $ make dotfiles
    ```

* [Shougo/dein.vim](https://github.com/Shougo/dein.vim)
    ```console
    $ make dein
    ```

* [tomislav/osx-terminal.app-colors-solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized)
    ```console
    $ make solarized
    ```

* [Cloud SDK - Google Cloud Platform](https://cloud.google.com/sdk/downloads#interactive)
    ```console
    $ make gcloud
    ```
