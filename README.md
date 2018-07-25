# Dotfiles

## Install

```{bash}
# Temporarily add api keys to the env
source <(curl https://gitlab.com/colejhudson/secrets/raw/master/apikeys.secret | keybase pgp decrypt) 
# Execute the boot script
source <(curl -X GET --header "PRIVATE-TOKEN: ${GITLAB_DOTFILES_READ_KEY}" https://gitlab.com/colejhudson/dotfiles/raw/master/boot.sh)
# Clean up
unset ${GITLAB_DOTFILES_READ_KEY}
```