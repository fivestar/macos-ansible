# macos-ansible

## Installing essentials

```bash
sudo xcodebuild -license
xcode-select --install
```

```bash
git clone git@github.com:fivestar/macos-ansible.git ~/src/github.com/fivestar/macos-ansible
cd ~/src/github.com/fivestar/macos-ansible
```

https://brew.sh/ja/
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
zsh
```

```bash
make all
```

## Provisioning

```bash
make
# or make homebrew
```

If you want to update ansible:

```bash
make ansible
```


## Extra packages

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

