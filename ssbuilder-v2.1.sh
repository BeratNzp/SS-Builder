#!/bin/bash
########### Swap Space Builder Script 2.1               ###########
########### Written by bNi                              ###########
if [ $UID != 0 ]
then
        echo 'This script can only run with "root" privileges.'
else
        read -p 'New Swap File Direction: ' swapFileDIR
        echo Swap file direction is setted. $swapFileDIR
        echo $'Select a swap size'
        echo $'##############################################################'
        echo $'\tSwap Size\tBlock Size\tCount'
        echo $'1)\t1024 MB\t\t128 MB\t\t8 MB'
        echo $'2)\t2048 MB\t\t128 MB\t\t16 MB'
        echo $'3)\t3072 MB\t\t128 MB\t\t24 MB'
        echo $'4)\t4096 MB\t\t128 MB\t\t32 MB'
        echo $'5)\t512 MB\t\t128 MB\t\t4 MB'
        read -p 'Select an option (1, 2, 3, 4 or 5): ' swapSize
        if [[ $swapSize =~ ^[0-9]+$ ]]
        then
                echo Swap size is setted $swapSize
                echo 'Please wait while making swap file...'
        #######################
        #######################
        if [[ $swapSize == 1 ]]
        then
                dd if=/dev/zero of=$swapFileDIR bs=128M count=8 #128*8=1024
        fi
        #######################
        if [[ $swapSize == 2 ]]
        then
                dd if=/dev/zero of=$swapFileDIR bs=128M count=16 #128*16=2048
        fi
        #######################
        if [[ $swapSize == 3 ]]
        then
                dd if=/dev/zero of=$swapFileDIR bs=128M count=24 #128*24=3072
        fi
        #######################
        if [[ $swapSize == 4 ]]
        then
                dd if=/dev/zero of=$swapFileDIR bs=128M count=32 #128*32=4096
        fi
        #######################
        if [[ $swapSize == 5 ]]
        then
                dd if=/dev/zero of=$swapFileDIR bs=128M count=4 #128*4=512
        fi
        #######################
        #######################
        echo 'Swap file is made.'
        chmod 600 $swapFileDIR
        mkswap $swapFileDIR
        swapon $swapFileDIR
        swapon -s
        echo $swapFileDIR swap swap defaults 0 0 | tee -a /etc/fstab
fi
fi