## My Dotfiles


### Auto Installer, let's screw up!

#### via curl
```
    curl -L https://github.com/phoenix24/dotfiles/raw/master/tools/install.sh | sh
```

#### via wget
```
    wget --no-check-certificate https://github.com/phoenix24/dotfiles/raw/master/tools/install.sh -O - | sh
```


### Manual Installer
1. clone the dotfiles repo.
```
    git clone https://github.com/phoenix24/dotfiles ~/.dotfiles
```

2. update resource files.


### TODO
1. distinguish between machines.


2. complete commands
```
    $ dotfiles update
    $ dotfiles status
    $ dotfiles reload [helper|alias|paths]
    $ dotfiles edit <helper|alias|paths>
    $ dotfiles nuke
    $ dotfiles list
```

3. fix emacs settings.
4. fix screenrc + inputrc settings.
5. add support for auto-completion.