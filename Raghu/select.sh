#!/bin/bash
select var in  prerequisite check_service start_service stop_application exit
do 
case $var in 
    prerequisite)
    yum install mysql-* -y 
    echo "mysql will be installed"
    ;;
   check_service)
   Systemctl status mysqld
   ;;
   start_service)
   Systemc start mysqld
   ;;
   stop_application)
   Systemctl stop mysqld
   echo "service  will be stop "
   ;;
   exit)
   echo "script will be exit"
   sleep 3
   echo "bye"
   break
;;
 *)
  echo "Please try again ( select 1..5)"
 ;;
esac
done

