#!/usr/bin/env bash

cd $HOME/Massanger

install() {
		sudo apt-get update
		sudo apt-get upgrade
sudo apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
sudo luarocks install oauth 
sudo luarocks install redis-lua 
sudo luarocks install lua-cjson 
sudo luarocks install ansicolors 
sudo luarocks install serpent 
}

function print_logo() {
        green "          ____   __           _____"                                  
        green "         | __  )|--|---      |_   _|___ ____   __  __"
        green "         | _|   |--|           | |/ .__|  _ \_|  \/  |"
        green "         | _|   |--|           |_|\____/\_____|_/\/\_|"
	echo -e "\n\e[0m"
}

function logo_play() {
    declare -A txtlogo
    seconds="0.010"
    txtlogo[1]=" ____   __        _____"
    txtlogo[2]="|  __ )|--|---   |_   _|___ ____   __  __"
    txtlogo[3]="| _|   |--|        | |/ .__|  _ \_|  \/  |"
    txtlogo[4]="| _|   |--|        |_|\____/\_____|_/\/\_|"
    printf "\e[31m\t"
    for i in ${!txtlogo[@]}; do
        for x in `seq 0 ${#txtlogo[$i]}`; do
            printf "${txtlogo[$i]:$x:1}"
            sleep $seconds
        done
        printf "\n\t"
    done
    printf "\n"
	echo -e "\e[0m"
}

function beyondteam() {
	echo -e "\e[0m"
	green "     >>>>                       We Are (Anonymous)                              "
	green "     >>>>                       We Are Not Clever                               "
	white "     >>>>                       We Are Programmer                               "
	white "     >>>>                       We Are The Best                                 "
	red   "     >>>>                       We Are Family                                   "
	red   "     >>>>                       @PrimeTeam                                     "
	echo -e "\e[0m"
}

red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}
update() {
	git pull
}

if [ "$1" = "install" ]; then
	print_logo
	Primeteam
	logo_play
	install
elif [ "$1" = "update" ]; then
	logo_play
	Primeteam
	update
	exit 1
else
	print_logo
	Primeteam
	logo_play
	green "Prime Messenger Bot running..."
	#sudo service redis-server restart
	lua ./bot/bot.lua
fi
