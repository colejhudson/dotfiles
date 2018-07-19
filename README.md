The goal of this config is to enable a common configuration both, across devices, 
across accounts on those devices, and across differing shells therein.

The common shell interface, at the moment, is bash, hence this is the langauge in
which the boot script is written. 

The boot script will create the user directory in /usr/local/etc where all common files
will be stored. Here we will ask for root permissions to create the directory and add
the files but making all such files readable to everyone. Then when you run this file
it will install local configuration files locally. Symlinking the boot script to your home.

That is

curl script-url.com | sh
sudo mkdir /usr/local/etc/user
sudo git clone git-config-repo > /usr/local/etc/user/.bash_profile
bash /usr/local/etc/user/.bash_profile

ln -s /usr/local/etc/user/.bash_profile ${HOME}/.bash_profile
mkdir .$(whoami)
mkdir 
git clone $(uname)

## Install

Install config by first downloading the config bootstrap script, this will then install
the appropriate version of the config file to your /etc directory.

```{bash}
curl
```