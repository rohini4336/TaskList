#!/bin/bash

echo "enter account name"
read Aname 


if grep -qF "$Aname=" getaccoount.txt;
then
   echo "account already exist"
else
   echo "$Aname=$(./CypertsCoind getaccountaddress $Aname)">>getaccoount.txt
fi



#echo "enter your withdrawal address"
#read address

echo "balance of $address =$(./CypertsCoind  getbalance)">>checkbalance.txt
balance="$(./CypertsCoind  getbalance $address)"

echo "bal=$balance"
Fee=0.45


if [ `echo "$balance>$Fee"|bc` -eq 1 ]; 
then
       #echo "you can transfer amount=((`expr $balance- $Fee` ))"
val=`echo expr $balance - $Fee`
echo "balance - Fee : $val"
else
       echo "Not Sufficient Amout  to Transfer"


fi











