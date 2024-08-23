# macos-ansible

## Installing essentials

```bash
sudo xcodebuild -license
xcode-select --install
```

```bash
git clone git@github.com:fivestar/macos-ansible.git src/github.com/fivestar/macos-ansible
cd src/github.com/fivestar/macos-ansible
make setup
```

## Provisioning

```bash
make
```


## Extra packages

### [fivestar/dotfiles](https://github.com/fivestar/dotfiles)

```bash
make dotfiles
```

### [Shougo/dein.vim](https://github.com/Shougo/dein.vim)

https://github.com/Shougo/dein-installer.vim

```bash
make dein
```

### [tomislav/osx-terminal.app-colors-solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized)

```bash
make solarized
```

### [Cloud SDK - Google Cloud Platform](https://cloud.google.com/sdk/downloads#interactive)

```bash
make gcloud
```

### [VOLTA](https://volta.sh/)

```bash
make volta
```

```bash
volta install node
```

