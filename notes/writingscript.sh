#!/bin/bash

userid=$(id -u)


if[ $userid -ne 0 ]
then
    echo "you are not in superuser"
    exit 1 #manually exit if error occurs
else
    echo "print you are  in superuser"
fi         

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "installtion is failure"
    exit 1
else    
    echo "installation is success"
fi
