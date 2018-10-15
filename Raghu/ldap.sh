#!/bin/bash
read -p "Please Enter your frist name here:- " name 
read -p "please Enter your last name  here:- " last
read -p "Please Enter your telephone namber here:-" num
id -u -n  > ldap.txt
echo "$name " >> ldap.txt
echo "$last" >> ldap.txt
echo  "$num" >> ldap.txt
cat ldap.txt  > ldap.tt
cat /mnt/ldap.tt |xargs | awk -F. '{ print "dn: uid="$1", dc=example, dc=com" > "/mnt/ldap.f" }' ; cat ldap.tt | xargs | awk '{print "cn:"  $2,  $3 >> "/mnt/ldap.f" }';cat ldap.tt | xargs | awk '{print "TelephoneNumber:" $4 >> "/mnt/ldap.f" }'

