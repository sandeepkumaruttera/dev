we need to write deleting.sh for deleting logs file at /tmp/app-log

why we are using while loop
becuase it may have infinate logs and also whatever file is there while loop must read that #while IFS= read -r line


crontab
---------
*shedule the shell script  commands inside linux server

crontab -l -->listing 
crontab -e -->editing crontab means at what time it should delete wheather 2second 0r 1 day or 6 days 0r 10 days go search in goggle crontab guru 

what we need to insert inside "crontab -e"
---------------------
i want delete log files every 2 min

* /2 * * * sh  /home/ec2-user/sheel-script/<file.sh>
---------------------------------------------------------------------------------------


you want to check logs of cron tab
-----------

cd /var/log
ls -la 
cron
use below command to view logs
tail -f cron
