#!/usr/bin/env bash
clear
if [ -d /data/data/com.termux/files/usr/ ]; then
    distro=termux
elif [ -e  /usr/local/bin/brew ]; then
    distro=darwin
else
    distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    if [ -z $distro ]; then
        distro=$(source /etc/os-release && echo $ID)
    fi
fi
bin="/usr/bin"
python="python3"
sudo="sudo"
if [ $distro = arch ]; then
    install="pacman -S --noconfirm"
elif [ $distro = debian ]; then
    install="apt-get -y install"
elif [ $distro = ubuntu ]; then
    install="apt -y install"
elif [ $distro = termux ]; then
    install="apt -y install"
    bin="$PREFIX/bin"
    python="python"
    sudo=""
elif [ $distro = fedora ] || [ $distro = redhat ]; then
    install="yum -y install"
elif [ $distro = SuSE ] || [ $distro = sles ]; then 
    install="zypper -n install"
elif [ $distro = darwin ]; then 
    install="brew install"
    bin="/usr/local/bin"
elif [ $distro = alpine ]; then 
    install="apk add"
    sudo=""
    pip="py3-pip"
fi
if [ -z $pip ] && [ $distro != termux ]; then
    pip=$python-pip
fi
$sudo $install git $python $pip
git clone https://github.com/Ceep4iK/spammer_4
$python -m pip install
$sudo cp spammer_4/spammer.py $bin/spammer_4
$sudo chmod +x $bin/spammer_4
$sudo rm -rf spammer_4
spammer