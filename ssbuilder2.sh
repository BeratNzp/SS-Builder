#!/bin/bash
########### Swap Space Builder Script 2.2   ###########
########### Written by bNi  ###########
if [ $UID != 0 ]
then
	echo 'This script can only run with "root" privileges.'
else
	mkdir -p /etc/ssbuilder/swapfiles
	swapFileDIR=/etc/ssbuilder/swapfiles
	time=$( date '+%F-%H-%M-%S' )
	echo $'Select a swap size'
	echo $'##############################################################'
	echo $'\tSwap Size\tBlock Size\tCount'
	echo $'1)\t1024 MB\t\t128 MB\t\t8 MB'
	echo $'2)\t2048 MB\t\t128 MB\t\t16 MB'
	echo $'3)\t3072 MB\t\t128 MB\t\t24 MB'
	echo $'4)\t4096 MB\t\t128 MB\t\t32 MB'
	echo $'5)\t512 MB\t\t128 MB\t\t4 MB'
	echo $'8)\t8192 MB\t\t128 MB\t\t64 MB'
	echo $'16)\t16384 MB\t128 MB\t\t128 MB'
	echo $'32)\t32768 MB\t128 MB\t\t256 MB'
	echo $'##############################################################'
	read -p 'Select an option (1, 2, 3, 4, 5, 8, 16 or 32): ' swapSize
	if [[ $swapSize =~ ^[0-9]+$ ]]
	then
		echo Swap size is setted $swapSize
		echo 'Please wait while making swap file...'
		#######################
		#######################
		if [[ $swapSize == 1 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_1024MB_$time bs=128M count=8 #128*8=1024
			fileNameWithDIR=$swapFileDIR/swapfile_1024MB_$time
		fi
		#######################
		if [[ $swapSize == 2 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_2048MB_$time bs=128M count=16 #128*16=2048
			fileNameWithDIR=$swapFileDIR/swapfile_2048MB_$time
		fi
		#######################
		if [[ $swapSize == 3 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_3072MB_$time bs=128M count=24 #128*24=3072
			fileNameWithDIR=$swapFileDIR/swapfile_3072MB_$time
		fi
		#######################
		if [[ $swapSize == 4 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_4096MB_$time bs=128M count=32 #128*32=4096
			fileNameWithDIR=$swapFileDIR/swapfile_4096MB_$time
		fi
		#######################
		if [[ $swapSize == 5 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_512MB_$time bs=128M count=4 #128*4=512
			fileNameWithDIR=$swapFileDIR/swapfile_512MB_$time
		fi
		#######################
		if [[ $swapSize == 8 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_8192MB_$time bs=128M count=64 #128*64=8192
			fileNameWithDIR=$swapFileDIR/swapfile_8192MB_$time
		fi
		#######################
		if [[ $swapSize == 16 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_16384MB_$time bs=128M count=128 #128*128=16384
			fileNameWithDIR=$swapFileDIR/swapfile_16384MB_$time
		fi
		#######################
		if [[ $swapSize == 32 ]]
		then
			dd if=/dev/zero of=$swapFileDIR/swapfile_32768MB_$time bs=128M count=256 #128*256=32768
			fileNameWithDIR=$swapFileDIR/swapfile_32768MB_$time
		fi
		#######################
		#######################
		echo 'Swap file is made.'
		chmod 600 $fileNameWithDIR
		mkswap $fileNameWithDIR
		swapon $fileNameWithDIR
		swapon -s
		echo $fileNameWithDIR swap swap defaults 0 0 | tee -a /etc/fstab
	fi
fi
