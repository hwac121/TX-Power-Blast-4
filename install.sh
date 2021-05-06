#!/bin/bash

#==============================================#
#                     DETAILS                  #
#==============================================#

# TITLE: Tx Power Blast v4.0
# AUTHOR: Majik Cat Security
# DATE: May 6, 2021
# GITHUB: https://github.com/hwac121

#================================================================================================
#                                    LISTED VARIABLES
#================================================================================================



#================================================================================================
#========                                 FUNCTIONS                                     ========#
#================================================================================================

Splash(){
	echo -e "\e[32m ______ __ __ ____   ___  __    __   ___ ____       ____  _      ____  ___________ \e[0m";
	sleep 0.05
	echo -e "\e[32m|      |  |  |    \ /   \|  |__|  | /  _]    \     |    \| |    /    |/ ___/      |\e[0m";
	sleep 0.05
	echo -e "\e[32m|      |  |  |  o  )     |  |  |  |/  [_|  D  )    |  o  ) |   |  o  (   \_|      |\e[0m";
	sleep 0.05
	echo -e "\e[32m|_|  |_|_   _|   _/|  O  |  |  |  |    _]    /     |     | |___|     |\__  |_|  |_|\e[0m";
	sleep 0.05
	echo -e "\e[32m  |  | |     |  |  |     |  \`  '  |   [ |    \     |  O  |     |  _  |/  \ | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[32m  |  | |  |  |  |  |     |\      /|     |  .  \    |     |     |  |  |\    | |  |  \e[0m";
	sleep 0.05
	echo -e "\e[32m  |__| |__|__|__|   \___/  \_/\_/ |_____|__|\_|    |_____|_____|__|__| \___| |__|  \e[0m";
	sleep 0.05
	echo -e "\e[32m                                                                                   \e[0m";
	sleep 0.05
	figlet "Version 4.0";
	sleep 0.05
	echo "......................................................................................"
	sleep .75
	echo " "
	echo -e "by Majik Cat Security"
	echo " "
}

#================================================================================================
#========                          CHECK IF ROOT OR EXIT                                ========#
#================================================================================================

clear
Splash
echo "$(whoami)"

[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "Now running as root..."
sleep 0.15s


#================================================================================================
#                              CHECK FOR PREVIOUS VERSION
#================================================================================================
clear
Splash
echo -e "\e[34mRemoving old version if present...\e[0m"
rm /bin/txpow
echo -e "\e[36mSetting Global Permissions...\e[0m"
cp txpow4.sh /bin/txpow
sleep 1.5
echo -e "\e[32m....Setting permissions....\e[0m"
sleep 0.5
chmod +x /bin/txpow
chmod +x txpow4.sh
sleep 1.5
echo -e "\e[34mInstallation is complete!\e[0m"
sleep 1.5
echo -e "Just type \e[32mtxpow\e[0m as root, or as user \e[32msudo txpow\e[0m to run anywhere in terminal"
echo " "
sleep 3
clear
