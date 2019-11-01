#!/bin/bash

echo "enter account name"
read Aname 


if grep -qF "$Aname=" getaccoount.txt;
then
   echo "account already exist"
else
   echo "$Aname=$(./alphaxd getaccountaddress $Aname)">>getaccoount.txt
fi



echo "enter your withdrawal address"
read address

echo "balance of $address =$(./alphaxd  getbalance $address)">>checkbalance.txt
balance="$(./alphaxd  getbalance $address)"

echo "bal=$balance"
Fee=0.45


if [ `echo "$balance>$Fee"|bc` -eq 1 ]; 
then
       echo "you can transfer amount=$(($balance-0.45))"
else
       echo "Not Sufficient Amout  to Transfer"


fi











