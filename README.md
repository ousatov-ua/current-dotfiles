Using `brew`:

HEAD is currently needed for tree-sitter

`brew install neovim --HEAD`

To upgrade:

`brew upgrade neovim --fetch-HEAD`

Run this inside `nvim` to install all plugins:

`:PackerInstall`

## Python

Create venv for neovim

`python3 -m venv ~/opt/python3_nvim`
`source ~/opt/python3_nvim/bin/activate`
`python3 -m pip install pynvim`

Path to python is specified in nvim config:

`let g:python3_host_prog = expand('~/opt/python3_nvim/bin/python')`

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

# DoH
`brew install cloudflared`

vim /usr/local/etc/cloudflared/config.yml

```yaml
proxy-dns: true
proxy-dns-upstream:
  - https://1.1.1.1/dns-query
  - https://1.0.0.1/dns-query
logDirectory: /var/log/cloudflared
```

Install as system service:

`sudo cloudflared service install`

Restart:

`sudo cloudflared restart`

Uninstall:

`sudo cloudflared service uninstall`
`brew uninstall cloudflared`

# Iperf3
This is a tool for measuring speed.

`brew install iperf3`

Download `iperf3 -R -c iperf.volia.net -t60 -i10 -P4`
Upload `iperf3 -c iperf.volia.net -t60 -i10 -P4`

# Dnsmasq
config

```yaml
interface=eth0
#Cloudflare's nameservers
#server=1.1.1.1
#server=1.0.0.1
#Adguard dns
server=94.140.14.14
server=94.140.15.15
cache-size=5000
local-ttl=600
min-cache-ttl=3600
```

Restart on ubuntu:

`sudo systemctl restart dnsmasq.service`

