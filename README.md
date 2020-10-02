# :rocket: My vim config ready to use in any distribution!

### This config features:

- Slightly modified color version of the beatifull Night Forest vim theme: https://github.com/sainnhe/forest-night
- Custom vim commands for a quick workflow focused on editing and window management
- Shared Clipboard
- Some useful plugins for autocompletion and productivity in general.

## Installing all from scratch, step by step

#### Step ONE: Setting the basics.
- Make sure Vim is installed, version equal or above 8.1 and clipboard is active. You can check all this running `vim --version`. Clipboard option will be shown as `+clipboard`. You can also try typing in VIM's normal mode: `echo has('clipboard')`and you should get a `1`. In case clipboard is not active you can install the package `vim-gtk`.

**NOTE I** If you still have problems and you could also try downloading the source code and recompiling everything:
```bash
#Install some dependencies
sudo apt install ncurses-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev

#Install source
cd /usr/local/src
sudo git clone https://github.com/vim/vim.git
cd vim/src
sudo make distclean  # if you build Vim before
sudo make
sudo make install
```
**NOTE II** On Windows Subsystem Linux you will have problems with clipboard portability. In order to solve this you will have to install a X11 server and set `clipboard=unnamedplus` option on vimrc. Here you have two good sources to set up everything:
[Named Link](https://gist.github.com/necojackarc/02c3c81e1525bb5dc3561f378e921541 "guide1")
[Named Link](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2 "guide2")

#### Step TWO: Getting colors and vimrc.
- Clone this repo on a temp folder (this repo can be deleted at the end of installation).
- If it does not exist, create at the root of your `$HOME` a folder called `.vim` and place inside the `colors` folder found in this repo.
- Go to `/etc/vim` and remove all the `vimrc` files you find (vimrc, vimrc.tiny etc.)
- In the root of your $HOME place the `vimrc` file of the repo.

**NOTE** You will notice that there are two different versions of `vimrc` files. One of them, the `vimrc_simple` file is a light configuration for quick usecases where you won't need any plugins. In case you want to go with this config your trip ends here, you won't need to install anything else.

#### Step THREE: Getting a cool font.
- Now, for further completing the [Named Link](https://github.com/sainnhe/forest-night "night-forest theme") we will install you will need to get a [Named Link](https://github.com/ryanoasis/nerd-fonts "Nerd Font"). My personal taste in this case is going for the `Jet Brains Mono` font-family. I recommend you to downloading the package directly from the [Named Link](https://github.com/ryanoasis/nerd-fonts/releases/tag/v2.1.0 "latest release section").
- Once you have your font, you must add it to your OS (look in your OS settings options). Then you will have to make your terminal yo use that particular font. Look for the name your OS has stored it with.
- As a personal recommendation, in order to assure everything has been imported correctly, I recommend you to test in VIM's normal mode: `echo "\ue62b"`. If you see a VIM's V it means all have been configured correctly :thumbsup:.

#### Step FOUR: Getting the pluggins.
- Install `Vim-Plug` manager as indicated in their [Named Link](https://github.com/junegunn/vim-plug "source repo"). 
- Inside vim, execute `PlugInstall` to install all pluggings. Wait until everything has been installed, exit VIM and enter again.

#### Step FOUR: Customizing your own plugins.
- I recommend you to begin with adding some coc-extensions to add language functionality or install any additional ones you desired. Remember not to add to many! VIM already has a lot of powerfull tools you can learn how to use.'
