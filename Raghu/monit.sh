#!/bin/bash
i=y
while [ $i = $i ] 
   do
   read -p "Please enter your parttion name herer :- " name 
   DF="$(df -h | awk '{print $6}' | egrep -w $name | awk -F "/" '{print $2}')"

if [ $name = $DF ]
then 
      echo "check filesystem" |  sed -e 's/\<filesystem\>/& '$DF' with path/' > /mnt/monit | df -h |grep -w $name | awk '{print $1}'  >> /mnt/monit
else 
  
    echo "Your doing somthing wrong please check!"
fi
   
   cat monit | tr '\n' ' ' > monit.f 
   echo   "every 120 cycles" >> /mnt/monit.f
   echo  "if space usage > 85% for 1 cycles then exec"  >> /mnt/monit.t
    rm -rf /mnt/monit
  
    FIND="$(locate reboot.sh | egrep -w  reboot.sh.? | head -n 1 >  /mnt/find.txt)"
    PA="$(cat /mnt/find.txt)"

if [ -f /mnt/find.txt ]
then
       printf "$PA"  >>  /mnt/monit.t
 cat monit.t |tr '\n' ' '>> monit.f 
  rm -rf /mnt/monit.t /mnt/find.txt
else 
        echo "something going wrong"
fi
       echo "Do you want to continue.?:- " 
read i

if [ $i != "y" ]
then
exit
fi 
done
