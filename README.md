# Install 

1. Acquire the proper SSH keys to allow cloning this repo
2. Run `ssh-agent` to embed your SSH credentials in the current shell context
3. Environment prelininaries:

**Ubuntu**
```sh
# install linuxbrew
sudo apt update
sudo apt install curl ca-certificates
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
brew update
```
**MacOS**
```sh
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```
4. Installed Fish

```sh
brew install fish
```

5. Install dotfiles via one of the following:
```sh
curl https://raw.githubusercontent.com/colejhudson/dotfiles/master/config.fish | fish -e
```
or
```sh
git clone git@github.com:colejhudson/dotfiles.git
fish config.fish
```
