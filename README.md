# Setup
First install [vim-plug](https://github.com/junegunn/vim-plug):
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Now place the init file in the correct directory:
```
cp init.vim ~/.config/nvim/init.vim
```
then in nvim run `:PlugInstall` and restart the editor. The configuration should be loaded.
It may happen that the installation of [YCM](https://github.com/ycm-core/YouCompleteMe#installation) will fail because some dependencies are not found. In that case in the YCM install posthook switch out the `-all` flag to something more concrete.
