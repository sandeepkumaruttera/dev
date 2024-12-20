#!/bin/bash




userid=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$2 is ..failure"
    exit 1
    else
    echo "$2 is ..success"
fi
    

}

if [ $userid -ne 0 ]
then
    echo "you are not in superuser"
    exit 1
    else 
    echo "you are in superuser"
fi

for i in $@
do
  echo "package to install :$i"
  dnf list installed $i &>>LOGFILE
  if [ $? -eq 0 ]
  then
      echo "package is already installed :$i ... skipping"
  else 
      dnf install $i -y &>>LOGFILE
      VALIDATE &? "installing $i"       #validate $1 "validate $?" $2 "is installing $i"
   fi
done


#how to check in linux is command exit status ;


#[ ec2-user@ip-172-31-94-96 ~/sheel-script ]$ sudo dnf list installed mysql
#Installed Packages
#mysql.x86_64                                                                    8.0.36-1.el9_3                                                                    @rhel-9-appstream-rhui-rpms


#[ ec2-user@ip-172-31-94-96 ~/sheel-script ]$ echo $?
#0

#packages is not installed


#[ ec2-user@ip-172-31-94-96 ~/sheel-script ]$ sudo dnf list installed mysql
#Error: No matching Packages to list


#[ ec2-user@ip-172-31-94-96 ~/sheel-script ]$ echo $?
#1









