#!/bin/bash
echo "enter account name"
read Aname
echo "balance of $Aname=$(./alphaxd  getbalance $Aname)">>checkbalance.txt






