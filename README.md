# zsh

Dotfiles for zsh configuration. Simple (no frameworks) and portable (plugins are git submodules, and contents symlinked to the home directory).

> Reference: https://thevaluable.dev/zsh-install-configure-mouseless/

1. Install zsh (no need if on macOS):
   ```sh
   sudo apt install zsh
   ```
2. Install [`rcm`](https://github.com/thoughtbot/rcm) to symlink files in this directory to your home directory. You may also need to [install `brew`](https://brew.sh/) first.

   ```sh
   # You may need to run this first in your terminal session to use brew:
   eval $(/opt/homebrew/bin/brew shellenv)

   brew install rcm
   ```

3. Pull into your home directory (`~`):
   ```sh
   cd ~ && git clone https://github.com/alecmarcus/zsh.git
   ```
4. Install plugin submodules:
   ```sh
   git submodule update --init --remote --recursive
   ```
5. (Optional) do a dry-run to see what is going to get symlinked:
   ```sh
   # env RCRC=... uses the rcrc file in this dir as the config. It will later get symlinked to ~/.rcrc, which rcm looks for the file by default.
   env RCRC=$HOME/zsh/rcrc lsrc
   ```
6. If the output matches the contents of this directory, go ahead and run the command that will symlink the dotfiles in it to your home directory:
   ```sh
   # -v adds verbose logging
   env RCRC=$HOME/zsh/rcrc rcup -v
   ```
   - If you make changes to `zsh/rcrc` and want to update the links again after, you have to run the above command. Otherwise, if you only updated other files in the zsh directory, you can simply run:
     ```sh
     rcup -v
     ```
     Which will use the linked `~/.rcrc` file created the first time you ran `rcup`.
7. [Install `fzf`](https://github.com/junegunn/fzf#installation):
   ```sh
   brew install fzf
   ```
8. Run zsh:
   ```sh
   zsh
   ```
9. Set the default shell to zsh:

```sh
chsh -s $(which zsh)
```

## Updating plugin submodules

To update each submodule to the latest revision after initializing, run:

```sh
git submodule update --recursive --remote
```

This is also available via the alias:

```sh
gsu
```
