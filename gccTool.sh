#! /bin/bash

#============================================================================================================
#                               Gcc Tool
#
#                       Welcome and dont disclaimer
#                     GCC TOOL Author By MAHAMDI AMINE
#
#       Contact me in fm_mahamdi@gmail.com or : https://twitter.com/mahamdi.amine
#============================================================================================================
VERSION='1.0.0'
NAME='MAHAMDI AMINE'
CODENAME='GCC TOOL'

#==============================================================================
# colours
#==============================================================================
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
#==============================================================================
# CTRL C
#==============================================================================
trap ctrl_c INT
ctrl_c() {
clear
echo -e
echo -e $red"  [*] (Ctrl + C ) Detected, Trying To Exit ..."
sleep 1
echo ""
echo -e $yellow"  [*] Thank You For Using  :)"
echo ""
echo -e $green"  [*] We Live by The Code , and Was Raised by Ethics ... "
echo "            "
read enter
exit
}
#==============================================================================
# show infos
#==============================================================================
show () {
echo""
echo -e $white"\t||"$red"============================================$white||";tput sgr0
echo -e "\t||  $white |=| "$okegreen"Version : $VERSION \t\t   $white   ||"
echo -e "\t||  $white |=| "$okegreen"Code by : $NAME $white             || "
echo -e "\t||  $white |=| "$okegreen"Codename: $CODENAME $white \t\t      || "
echo -e $white"\t||"$red"============================================$white||\n"
echo -e
echo -e $yellow"                                                   fm_mahamdi@esi.dz";tput sgr0
echo -e $green"	___________________________________________________________________";tput sgr0
echo -e
echo -e $BlueF"	  [$white"0x1"$BlueF]$cyan  Compile And Run  						"
echo -e $BlueF"	  [$white"0x2"$BlueF]$cyan  Create Static Library  	    "
echo -e $BlueF"	  [$white"0x3"$BlueF]$cyan  Create Dynamic Library                "
echo -e $BlueF"	  [$white"0x4"$BlueF]$cyan  Add your Dynamic Library to the system"
echo -e $BlueF"	  [$white"0x5"$BlueF]$cyan  Buy Me a Coffee 					  "
echo -e $BlueF"	  [$white"0x6"$BlueF]$cyan  Exit  														    "
echo -e
echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> '; tput sgr0 #insert your choice
}
#===========================================================================
#functions
#===========================================================================
#function 1: Compile And Run
#===========================================================================
fun_1(){
	echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> 01 '; tput sgr0
	echo -e $cyan  "Compile And Run  "
	echo""
	echo""
	echo -ne $okegreen"  Enter The name of the main program (.c)   : " ; tput sgr0
	read main
	echo -ne $okegreen"  Enter The name of the other functions (.c): " ; tput sgr0
			read others
			for elem in $others ;do
					elem1=${elem%.c}
					list=$list' '$elem1'.o'
					if [[ -e $elem ]]; then
							gcc -c $elem -o "$elem1".o ;
					else
							echo "$elem1 not Exist !!"
							sleep 20
							exit
			 fi
		 done
			 if [[ -e $main ]]; then
					gcc -c $main -o main.o ;
					gcc -o prog.run main.o $list ;
					echo ""
					echo -e $yellow "Your program will run ...";tput sgr0
					echo ""
					sleep 3
					clear;
					./prog.run;
			fi
			echo
			echo
			sleep 2
			echo -e $okegreen"  Press any key to continue ......... "
			read aw
			mainmenu
}
#===========================================================================
#function 2 :Create Static Library
#===========================================================================
fun_2(){
	echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> 02 '; tput sgr0
	echo -e $cyan  "Create Static Library  "
	echo""
	echo""
	echo -ne $okegreen"  Enter The full name of the Library (.a):" ; tput sgr0
	read libname
	echo -ne $okegreen"  Enter The name of the functions (.c)   : " ; tput sgr0
	read others
	for elem in $others ;do
						elem1=${elem%.c}
					  list=$list' '$elem1'.o'
					  if [[ -e $elem ]]; then
						     gcc -c $elem -o "$elem1".o ;
					  else
					      	echo "$elem1 not Exist !! "
					      	sleep 3
					      	exit
					 fi
	done
	ar cr $libname $list
	echo""
	echo -e $yellow " Succes Creating Library ";tput sgr0
	echo
	echo
	sleep 2
	echo -e $okegreen"  Press any key to continue ......... "
	read aw
	mainmenu
}
#===========================================================================
#function 3 :Create Dynamic Library
#===========================================================================
fun_3(){
	echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> 03 '; tput sgr0
	echo -e $cyan  "Create Dynamic Library  "
	echo""
	echo""
	echo -ne $okegreen"  Enter The full name of the Library (.so):" ; tput sgr0
	read libname
	echo -ne $okegreen"  Enter The name of the functions (.c)    : " ; tput sgr0
	read others
	for elem in $others ;do
						elem1=${elem%.c}
						list=$list' '$elem1'.o'
						if [[ -e $elem ]]; then
										gcc -c -fPIC $elem -o $elem1'.o'
						else
									echo "$elem1 not Exist !! "
									sleep 3
									exit
					 fi
	done
	gcc -shared -o $libname $list
	echo""
	echo -e $yellow " Success Creating Library ";tput sgr0
	echo
	echo
	sleep 2
	echo -e $okegreen"  Press any key to continue ......... "
	read aw
	mainmenu
}
#===========================================================================
#function 4 :Add Dynamic Library to the system 
#===========================================================================
fun_4(){
	echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> 04 '; tput sgr0
	echo -e $cyan  "Add your Dynamic Library to the system  "; tput sgr0
	echo""
	echo""
	echo -ne $okegreen"  Enter The Path Into Your Lib's Folder(.a):" ; tput sgr0
	read path
	export LD_LIBRARY_PATH=$path :$ LD_LIBRARY_PATH;
        ldconf;
	echo""
	echo -e $yellow " Your Library has been added To The System successfully";tput sgr0
	echo
	echo
	sleep 2
	echo -e $okegreen"  Press any key to continue ......... "
	read aw
        mainmenu
}
#===========================================================================
#function 5 :Donation
#===========================================================================
fun_5(){
	echo -n -e $red'  \033[4mGcc@Tool:\033[0m >> 05 '; tput sgr0
	echo
	echo
	echo
	echo -e $cyan  "       If you found my script useful, you can buy me a coffee :)  "; tput sgr0
	echo""
	echo""
	sleep 2
	echo -e "    Donation link: https://www.paypal.com/cgi-bin/"
	echo
	echo
	sleep 3
	echo -e $okegreen"  Press any key to continue ......... "
	read aw
	mainmenu
}
#==============================================================================
# main
#==============================================================================
mainmenu(){
	clear
	echo""
        show
	read mainchoice
	clear
	echo
	case $mainchoice in
		1) fun_1 ;;
		2) fun_2 ;;
		3) fun_3 ;;
		4) fun_4 ;;
		5) fun_5 ;;
		6|Q|q|exit|quit) exit ;;
		*) mainmenu ;;
		esac

	}

   clear
   mainmenu


