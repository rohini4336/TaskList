#!/bin/bash

echo "enter account name"
read Aname 


if grep -qF "$Aname=" getaccoount.txt;
then
   echo "account already exist"
else
   echo "$Aname=$(./CypertsCoind getaccountaddress $Aname)">>getaccoount.txt
fi

 yes="y"
  no="n"

if grep -qF "$Aname=" getaccoount.txt;
then
   echo "do you want to check your balance?y/n"
   read response
 
if [ "$response" == "$yes" ];
then
echo "enter your account"
read account

echo "balance of $account =$(./CypertsCoind  getbalance $account)">>checkbalance.txt
balance="$(./CypertsCoind  getbalance $account)"

echo "bal=$balance"
 Fee=0.45
elif [ "$response" == "$no" ];
then
echo   "ok"
else
echo "sorry wrong choice....y/n"
fi 
fi 



echo "do you want to transfer ur balance ?y/n"
   read resp
if [ "$resp" == "$yes" ];
then

 if [ `echo "$balance>$Fee"|bc` -eq 1 ]; 
then
       echo "transferable amount=((`expr $balance` ))"
#val=`echo expr $balance - $Fee`
#echo "balance - Fee : $val"
else
       echo "Not Sufficient Amout  to Transfer"
#elif [ "$resp" == "$no" ]
#echo "ok"
#else
#echo "wrong choice"
fi
fi

 echo "enter your address to transfer"
  read addr
 echo "enter amount"
  read amount

if [ `echo "$balance>$Fee"|bc` -eq 1 ]; 
then 
echo "$(./CypertsCoind sendfrom ""$account"" ""$addr"" "$amount")"
    echo "done"
fi
