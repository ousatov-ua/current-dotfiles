# Dotfiles

## Key repeat

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write -g ApplePressAndHoldEnabled -bool false

## Install neovim

Using `brew`:

HEAD is currently needed for tree-sitter

`brew install neovim --HEAD`

To upgrade:

`brew upgrade neovim --fetch-HEAD`

Run this inside `nvim` to install all plugins:

`:PackerInstall`

## Nerd fonts (Use it!)

<https://github.com/ryanoasis/nerd-fonts>

Use from ./other/fonts/
or
`brew tap homebrew/cask-fonts`

Currently, using Comic Code Nerd (and Comic Code)
Patched versions are in iCloud. 
Firts please just install any nerd font (for some reasons otherwise there are some visual gaps for Comic Code which was manually patched)

`brew install font-blex-mono-nerd-font` or from archive

Victor mono : can be installed from `other/fonts/VictorMono-Nerd.zip` or via brew:

`brew install --cask font-victor-mono-nerd-font`


## 24 bit for tmux

`brew install tmux`

Copy `/useful/xterm-24bit.terminfo` to `~/`

`tic -x -o ~/.terminfo xterm-24bit.terminfo`

## Oh my szh

Install Oh my szh: <https://ohmyz.sh>

To upgrade custom plugins put this to $ZSH/tools/upgrade.sh:

```szh
printf "\n${BLUE}%s${RESET}\n" "Updating custom plugins"
cd custom/plugins

for plugin in */; do
  if [ -d "$plugin/.git" ]; then
     printf "${YELLOW}%s${RESET}\n" "${plugin%/}"
     git -C "$plugin" pull
  fi
done
```

## Kitty

Install kitty

`brew install kitty`

## Run :checkhealth at the end and resolve errors

## Enable AAC + Aptx on MacOSX


`sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true`
`sudo defaults write bluetoothaudiod "AAC Bitrate" 320`
`sudo defaults write bluetoothaudiod "Enable AAC codec" -bool false`

To check:

`sudo defaults read bluetoothaudiod`
