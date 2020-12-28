
# Homebrew Tap for Openlegacy

##### Add this repository to the list of formulae:

```sh
brew tap openlegacy/tap
```

##### Installing packages from this repository:

```sh
brew install <package>
```
---

#### Openlegacy-CLI


##### Check for available package versions

```sh
brew search openlegacy-cli
```

#####  Install latest version

```sh
brew install openlegacy-cli
```

#####  Install specific version (ex. 1.1.0)

```sh
brew install openlegacy-cli@1.1.0
```

#####  Install alpha version (latest release branch build)

```sh
brew install openlegacy-cli-alpha
```

#####  Auto-completion

If you are using [bash-completion](https://formulae.brew.sh/formula/bash-completion) or [zsh-completions](https://formulae.brew.sh/formula/zsh-completions) auto-completion for `ol` should work out of the box. Otherwise run the command from below for your shell.

###### Bash

```sh
echo "source /usr/local/opt/openlegacy-cli/etc/bash_completion.d/ol" >> ~/.bashrc
```

###### ZSH

```sh
echo "source /usr/local/share/zsh/site-functions/_ol" >> ~/.zshrc
```
