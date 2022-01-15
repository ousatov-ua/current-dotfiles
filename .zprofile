#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home

export M2_HOME=~/opt/apache-maven
export M2=${M2_HOME}/bin
export PATH=${M2}:/usr/local/mysql/bin:/Users/alus/opt/kafka_2.12-2.7.0/bin:/Users/alus/sh:/Users/alus/sh/maven:$PATH
export PATH=/Users/alus/qt_6/6.0.3/clang_64/bin:$PATH
export PATH=/usr/local/opt/postgresql@11/bin:$PATH

# MacPorts Installer addition on 2017-12-27_at_19:57:35: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

#export GOOGLE_APPLICATION_CREDENTIALS="/Users/alus/work/env/google-cloud-po-service"
export AWS_PROFILE=product_nonprod
export AWS_DEFAULT_REGION=us-east-1

alias mc='LC_ALL=en_US.UTF-8 mc'
alias 'vim'=/usr/local/bin/nvim
#alias python='/usr/local/bin/python3'

export PATH="$PATH:/usr/local/Cellar/mongodb-community@3.6/3.6.18/bin"
export PATH=$PATH:$HOME/.asdf/shims

export EDITOR=nvim
