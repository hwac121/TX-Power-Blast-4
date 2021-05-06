#!/bin/bash

#==============================================#
#                     DETAILS                  #
#==============================================#

# TITLE: Tx Power Blast v4.0
# AUTHOR: Majik Cat Security
# DATE: May 6, 2021
# GITHUB: https://github.com/hwac121

#================================================================================================
#========                                 FUNCTIONS                                     ========#
#================================================================================================

Splash(){
	echo -e "\e[31m ______ __ __ ____   ___  __    __   ___ ____       ____  _      ____  ___________ \e[0m";
	sleep 0.05
	echo -e "\e[31m|      |  |  |    \ /   \|  |__|  | /  _]    \     |    \| |    /    |/ ___/      |\e[0m";
	sleep 0.05
	echo -e "\e[31m|      |  |  |  o  )     |  |  |  |/  [_|  D  )    |  o  ) |   |  o  (   \_|      |\e[0m";
	sleep 0.05
	echo -e "\e[31m|_|  |_|_   _|   _/|  O  |  |  |  |    _]    /     |     | |___|     |\__  |_|  |_|\e[0m";
	sleep 0.05
	echo -e "\e[31m  |  | |     |  |  |     |  \`  '  |   [ |    \     |  O  |     |  _  |/  \ | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[31m  |  | |  |  |  |  |     |\      /|     |  .  \    |     |     |  |  |\    | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[31m  |__| |__|__|__|   \___/  \_/\_/ |_____|__|\_|    |_____|_____|__|__| \___| |__|  \e[0m";
	sleep 0.05
	echo -e "\e[31m                                                                                   \e[0m";
	sleep 0.05
	figlet "Version 4.0";
	echo -e "\e[35mby Majik Cat Security\e[0m";
	sleep 0.05
	echo "......................................................................................"
	sleep .75
	echo " "
}

#================================================================================================
#========                          CHECK IF ROOT OR EXIT                                ========#
#================================================================================================

echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Now running as root..."
sleep 2

#=================================================================================================
#========                                 MENU SYSTEM                                    ========#
#=================================================================================================

options=("Show Status" "What is Connected" "ALFA Connection Status" "Boost ALFA" "Restart Network Manager" "ALFA Managed Mode (ON)" "ALFA Monitor Mode (ON)" "ALFA Monitor Mode (OFF)" "Internal IP" "External IP" "Check Tx Power" "Quit")
PS3='Choose which WiFi card to boost and open all channels: '

while [ "$menu" != 1 ]; do
clear
Splash
select opt in "${options[@]}" ; do
		case $opt in
#=================================================================================================
#========                                 WiFi CARD MENU                                 ========#
#=================================================================================================
		"Show Status")
			clear
			Splash
			echo -e "Now showing general status";
			nmcli dev status
			sleep 6
		break
		;;
		"What is Connected")
			clear
			Splash
			echo -e "Now showing what is connected";
			nmcli connection show
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 8 seconds...\e[0m"
			sleep 6
		break
		;;
		"ALFA Connection Status")
			nmcli device show wlx00c0ca9241d4
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 8 seconds...\e[0m"
			sleep 8
		break
		;;
		"Boost ALFA")
			clear
			Splash
			echo -e "Now boosting $opt - option $REPLY"
			echo -e " "
			sleep 0.5
			echo -e "Taking down \e[34mALFA\e[0m";
			ifconfig wlx00c0ca9241d4 down
			echo -e " "
			sleep 3
			echo -e "Setting Region to \e[34mBolivia\e[0m";
			iw reg set GY
			echo -e " "
			sleep 3
			echo -e "Setting \e[34mTxPower to 30\e[0m";
			iwconfig wlx00c0ca9241d4 txpower 45
			echo -e " "
			sleep 2
			echo -e "Starting \e[34mALFA\e[0m";
			ifconfig wlx00c0ca9241d4 up
			echo -e " " 
			echo -e "Pulled \e[34mALFA\e[0m interface up";
			sleep 1.5
			clear
			sleep 0.5
			iwconfig
			sleep 3
			clear
			echo -e "\e[33mTx Power Now Set\e[0m";
		break
		;;
		"Restart Network Manager")
			clear
			Splash
			echo "Restarting the Network Manager..."
			service NetworkManager restart
			sleep 2
			echo -e "\e[31mPlease Note:\e[0m \e[7mAllow a minute or two for devices to reconnect.\e[0m"
			sleep 4
		break
		;;
		"ALFA Managed Mode (ON)")
			clear
			Splash
			figlet "Entering ALFA"
			figlet "Managed Mode"
			ifconfig wlx00c0ca9241d4 down
			iwconfig wlx00c0ca9241d4 mode managed
			ifconfig wlx00c0ca9241d4 up
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
		"ALFA Monitor Mode (ON)")
			clear
			Splash
			figlet "Entering ALFA" 
			figlet "Monitor Mode"
			ifconfig wlx00c0ca9241d4 down
			iwconfig wlx00c0ca9241d4 mode monitor
			ifconfig wlx00c0ca9241d4 up
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
		"ALFA Monitor Mode (OFF)")
			clear
			Splash
			figlet "Turning Off"
			figlet "Monitor Mode"
			airmon-ng stop wlx00c0ca9241d4
			clear
			echo "Action Complete!"
			sleep 4
		break
		;;
#=================================================================================================
#========                                  UTILITIES                                     ========#
#=================================================================================================
		"Internal IP")
			clear
			Splash
			echo -e "#\e[33m***************************\e[0m #"
			sleep 0.15
			echo -e "#\e[33m**\e[0m      \e[32mINTERNAL IP:\e[0m     \e[33m**\e[0m #"
			sleep 0.15
			echo -e "#\e[33m****************************\e[0m#"
			sleep 0.25
			echo -e " "
			sleep 0.25
			hostname -I
			sleep 0.25
			echo -e " "
			sleep 0.25
			ifconfig
			sleep 0.25
			echo -e " "
			sleep 1.5
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 10 seconds...\e[0m"
			sleep 10
			clear
		break
		;;
		"External IP")
			clear
			Splash
			echo -e "#\e[33m***************************\e[0m#"
			sleep 0.15
			echo -e "#\e[33m**\e[0m      \e[32mEXTERNAL IP:\e[0m     \e[33m**\e[0m#"
			sleep 0.15
			echo -e "#\e[33m****************************\e[0m#"
			sleep 0.25
			echo -e " "
			curl http://ipecho.net/plain
			echo -e " "
			sleep 1.5
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to main menu in 10 seconds...\e[0m"
			sleep 10
			clear
		break
		;;
		"Check Tx Power")
			clear
			Splash
			iwconfig
			sleep 1.5
			echo -e " "
			echo -e "\e[31mPlease Note:\e[0m \e[7mYou will return to the main menu in 10 seconds...\e[0m"
			sleep 10
			clear
		break
		;;
#=================================================================================================
#========                        CREDITS, HELP, VERSION, QUIT                            ========#
#=================================================================================================
		"Quit")
			clear
			Splash
			echo -e " "
			echo -e "\e[37mThank you for using TX Power Blast 4.0 by Majik Cat Security - July 2019\e[0m"
			sleep 3
			clear
			menu=1
		break
		;;
#=================================================================================================
#========                        ERROR CAPTURE - INVALID OPTION                          ========#
#=================================================================================================
		*) 
			clear
			Splash
			echo -e "invalid option $REPLY"
		break
		;;
		esac
	done
done

exit 0
