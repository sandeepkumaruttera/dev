#!/bin/bash

userid=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$2 is ....failure"
    exit 1
    else
    echo "$2 is .... success"
fi

}


if [ $userid -ne 0 ]
then
    echo "you are not in superuser"
    exit 1 #manually exit if error occurs
else
    echo "print you are  in superuser"
fi         

for i in $@
do
  echo "installing packages $i"
  dnf list installing $i
  if [ $? -eq 0 ]
  then  
    echo "packages are already installed : $i"
else
    dnf install $i -y
    VALIDATE $? "installing $i"
fi
done