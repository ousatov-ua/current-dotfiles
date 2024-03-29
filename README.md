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

`sudo cloudflared restart` - this will not restart cloudflared service

Uninstall:

`sudo cloudflared service uninstall`
`brew uninstall cloudflared`

# Iperf3
This is a tool for measuring speed.

`brew install iperf3`

Download `iperf3 -R -c iperf.volia.net -t60 -i10 -P4`
Upload `iperf3 -c iperf.volia.net -t60 -i10 -P4`

# Dnsmasq
You will need to remove `systemd-resolved` first

Install dnsmasq. Check that is is running

`sudo ss -ltnp`

State            Recv-Q           Send-Q                       Local Address:Port                       Peer Address:Port           Process                                     
LISTEN           0                32                                 0.0.0.0:53                              0.0.0.0:*               users:(("dnsmasq",pid=610,fd=5))

## Dnsmasq

### MacOSX
$ brew install dnsmasq
$ vim /usr/local/etc/dnsmasq.conf

# Copy the daemon configuration file into place.
```
$ sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
$ sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
$ sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
$ dscacheutil -flushcache

$ sudo launchctl stop homebrew.mxcl.dnsmasq
$ sudo launchctl start homebrew.mxcl.dnsmasq
```

### Linux
`vim /etc/dnsmasq.conf`

```yaml
#Address
listen-address=::1,127.0.0.1,192.46.234.72
interface=eth0

#DNS
#AdGuard dns
#server=94.140.14.14
#server=94.140.15.15
#Cloudflare dns
#server=1.1.1.1
#server=1.0.0.1
#OpenDNS family
#server=208.67.222.123
#server=208.67.220.123
#Quad9
#server=9.9.9.9
#server=149.112.112.112
#Level 3
#server=209.244.0.3
#server=209.244.0.4
#server=4.2.2.1
#server=4.2.2.2
#server=4.2.2.3
#server=4.2.2.4
#Verisign
#server=64.6.64.6
#server=64.6.65.6
#Point to cloudflared deamon
server=127.0.0.1#5053

#Caching
cache-size=5000
local-ttl=600
#min-cache-ttl=1500 #it may not work in config but only as launch argument
```

#### Use DoH with dnsmasq

This is the variant to proxy requests from dnsmasq to cloudflared (DoH). Please check PDF file in root.
Configured it on Ubuntu - works fine.
# Install cloudflared 

Source:

https://pkg.cloudflare.com/index.html

Ubuntu 22.04 LTS (Jammy Jellyfish)

# Add cloudflare gpg key
`sudo mkdir -p --mode=0755 /usr/share/keyrings`

`curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null`

# Add this repo to your apt repositories
`echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared jammy main' | sudo tee /etc/apt/sources.list.d/cloudflared.list`

# install cloudflared

`sudo apt-get update && sudo apt-get install cloudflared`

Because you will want the proxy to run on a non-privileged port, you can create a separate service account, under which the proxy then runs:

`# useradd -s /usr/sbin/nologin -r -M cloudflared`

`# chown cloudflared:cloudflared /usr/local/bin/cloudflared`

For the service to mesh seamlessly with systemd, you need to create a suitable /etc/systemd/system/cloudflared.service Unit file (Listing 2). The /etc/default/cloudflared configuration file,

Listing 2
(Systemd Unit)


```yaml
[Unit]
Description=cloudflared DNS over HTTPS proxy
After=syslog.target network-online.target
[Service]
Type=simple
User=cloudflared
EnvironmentFile=/etc/default/cloudflared
ExecStart=/usr/local/bin/cloudflared $CLOUDFLARED_OPTS
Restart=on-failure
RestartSec=10
KillMode=process
[Install]
WantedBy=multi-user.target
```

Content of /etc/default/cloudflared:

```
CLOUDFLARED_OPTS="proxy-dns --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query --port 5053"
```

Start cloudflared:
systemctl enable --now cloudflared

Check ports:

`ss -ltnp`

Dnsmasq:

`server=127.0.0.1#5053`

Restart on ubuntu:

`sudo systemctl restart dnsmasq.service`

Check status:

`systemctl status dnsmasq`

Don't forget to remove any nameservers from resolve.conf

Sh file for renice:

```sh
mode=$1
pid_cldf=$(pidof cloudflared)
pid_dnsmasq=$(pidof dnsmasq)
echo "Pid of cloudflared $pid_cldf"
echo "Pid of dnsmasq' $pid_dnsmasq"

echo "Current statistics"
eval "ps ax -o pid,ni,cmd | grep cloudflared"
eval "ps ax -o pid,ni,cmd | grep dnsmasq"

case $mode in
        renice)
                sudo renice -n -15 -p $pid_cldf
                sudo renice -n -15 -p $pid_dnsmasq
                ;;
        info)
                eval "ps ax -o pid,ni,cmd | grep cloudflared"
                eval "ps ax -o pid,ni,cmd | grep dnsmasq"
                ;;
        *)
                echo "Possible options: info | renice <value>"
                ;;
esac
```

# Ubuntu 
Stop GUI (22.04 LTS)
Please pay attention that monitor will not turn off by itself after that

Disable GDM on startup:

`systemctl disable gdm.service`

Stop GDM:

`sudo service gdm stop`

# Tricks
1) Trurn off display on server:
 `sudo vim /etc/default/grub`
 
  `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1 consoleblank=10"`
  
  `GRUB_CMDLINE_LINUX="ipv6.disable=1"`
  
  `sudo update-grub`
  
=======
# Knot-resolver
Kresd.conf:
```
-- SPDX-License-Identifier: CC0-1.0
-- vim:syntax=lua:set ts=4 sw=4:
-- Refer to manual: https://knot-resolver.readthedocs.org/en/stable/

-- Network interface configuration
net.listen('0.0.0.0', 53, { kind = 'dns' })
--net.listen('127.0.0.1', 853, { kind = 'tls' })
--net.listen('127.0.0.1', 443, { kind = 'doh2' })
--net.listen('::1', 53, { kind = 'dns', freebind = true })
--net.listen('::1', 853, { kind = 'tls', freebind = true })
--net.listen('::1', 443, { kind = 'doh2' })

-- Load useful modules
modules = {
        'hints > iterate',  -- Allow loading /etc/hosts or custom root hints
        -- 'stats',            -- Track internal statistics
        'predict',          -- Prefetch expiring/frequent records
}

-- policy.add(policy.all(policy.FORWARD({'45.90.28.226', '45.90.30.226'})))

policy.add(policy.all(policy.TLS_FORWARD({
    {'45.90.28.0', hostname='1b96d3.dns.nextdns.io'},
    {'45.90.30.0', hostname='1b96d3.dns.nextdns.io'}
})))

-- Cache size
cache.size = 100 * MB
```
Grub:
```
 If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 consoleblank=20"
GRUB_CMDLINE_LINUX=""

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
```

