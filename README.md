# Dotfiles

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

`brew tap homebrew/cask-fonts`

`brew install --cask font-inconsolata-nerd-font`

`brew install --cask font-robotomono-nerd-font`
narrow: `brew install --cask font-victor-mono-nerd-font`

For victor-mono remove 'italic' to use in Jetbrains IDEA

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
