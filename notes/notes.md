useradd Vish-->addin user
userdel vish-->deleting user 
id vish--> to check primary and secondary groups 
In Linux when you create user ,by default a group will be created with th same username


adding groups 
groupadd devops-->command-->primary group
groupadd testing--->secondary group
usermod -g devops vish----->adding vish to devops group as a primary group
usermod -aG testing vish -->adding vish to testing group as a secondary group 
gpasswd -d vish testing---->deleting vish user from testing group 

[root@ip-172-31-86-219 home]# id vish
uid=1001(vish) gid=1002(devops) groups=1002(devops),1003(testing)

devops---> primary 
testing --> secondary

when employee is leaving ?

remove all his secondary groups--->example:gpasswd -d vish testing
change primary group to his own group--->example:usermod -g vish vish
then delete the user--> example:userdel vish

-----------------------------------------------------------------------------------------------------------------
example live:

[root@ip-172-31-86-219 home]# useradd sandeep
[root@ip-172-31-86-219 home]# id sandeep
uid=1002(sandeep) gid=1002(sandeep) groups=1002(sandeep)
[root@ip-172-31-86-219 home]# getent group
root:x:0:
bin:x:1:
daemon:x:2:
sys:x:3:
adm:x:4:ec2-user
tty:x:5:
disk:x:6:
lp:x:7:
mem:x:8:
kmem:x:9:
wheel:x:10:ec2-user
cdrom:x:11:
mail:x:12:postfix
man:x:15:
dialout:x:18:
floppy:x:19:
games:x:20:
tape:x:33:
video:x:39:
ftp:x:50:
lock:x:54:
audio:x:63:
nobody:x:99:
users:x:100:
utmp:x:22:
utempter:x:35:
input:x:999:
systemd-journal:x:190:ec2-user
systemd-network:x:192:
dbus:x:81:
ssh_keys:x:998:
rpc:x:32:
libstoragemgmt:x:997:
sshd:x:74:
rngd:x:996:
rpcuser:x:29:
nfsnobody:x:65534:
ec2-instance-connect:x:995:
slocate:x:21:
postdrop:x:90:
postfix:x:89:
chrony:x:994:
stapusr:x:156:
stapsys:x:157:
stapdev:x:158:
screen:x:84:
tcpdump:x:72:
ec2-user:x:1000:
vish:x:1001:
sandeep:x:1002:
[root@ip-172-31-86-219 home]# groupadd devops
[root@ip-172-31-86-219 home]# groupadd testing
[root@ip-172-31-86-219 home]# usermod -g devops sandeep
[root@ip-172-31-86-219 home]# usermod -aG testing sandeep
[root@ip-172-31-86-219 home]# id sandeep
uid=1002(sandeep) gid=1003(devops) groups=1003(devops),1004(testing)
[root@ip-172-31-86-219 home]# gpasswd -d sandeep testing  --------------->deleting first secondary group 
Removing user sandeep from group testing
[root@ip-172-31-86-219 home]# id sandeep
uid=1002(sandeep) gid=1003(devops) groups=1003(devops)
[root@ip-172-31-86-219 home]# usermod -g sandeep Sandeep -------------->change primary group to secondary group 
[root@ip-172-31-86-219 home]# id sandeep
uid=1002(sandeep) gid=1002(sandeep) groups=1002(sandeep)
[root@ip-172-31-86-219 home]#userdel Sandeep

-----------------------------------------------------------------------------------------------------------------
if a new user have to login with his private key?

swathi --->useradd swathi
 cd /home/swathi/----------->need to create directory mkdir .ssh--->.ssh file should have 700 permission
inside .ssh need to create a file -->touch authorized_keys---> must have 600 permission-----> whatever presnt in ec2-user/.ssh just copy that in to swathi user that it you can use same private key without creating new


* in that authorized_keys file we need to fill the public key whatever we generated (or) whatever presnt in ec2-user/.ssh just copy that in to swathi user that it you can use same private key without creating new



**when u trying to login with swathi if it shown password means you need to change the ownership to swathi in the .ssh directory---> cd /home/swathi/.ssh 
 

after that changing ownership
chown <user>:<group> .ssh---> chown swathi:swathi .ssh


------------------------------------------------------------------------------------------------------------------
giving sudo acces to swathi 
**vim   /etc/sudoers in that file edited lines shown on th below with example ** marks


-------

Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin

## Next comes the main part: which users can run what software on
## which machines (the sudoers file can be shared between multiple
## systems).
## Syntax:
##
##      user    MACHINE=COMMANDS
##
## The COMMANDS section may have other options added to it.
##
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL

## Allows members of the 'sys' group to run networking, software,
## service management apps and more.
# %sys ALL = NETWORKING, SOFTWARE, SERVICES, STORAGE, DELEGATING, PROCESSES, LOCATE, DRIVERS

## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL

## Same thing without a password
 wheel ALL=(ALL)       NOPASSWD: ALL    ------------------>we need to uncommand this line 

## Allows members of the users group to mount and unmount the
## cdrom as root
# %users  ALL=/sbin/mount /mnt/cdrom, /sbin/umount /mnt/cdrom

## Allows members of the users group to shutdown this system
# %users  localhost=/sbin/shutdown -h now


after that we need to adding secondary group "wheel" to username 

usermod -aG wheel swathi


then login with swathi and and also u will have sudo su access also ... 

-----------------------------------------------------------
HTML --> Text Format
CSS --> Colors, fonts
JS --> Validations..


Web/Frontend tier --> LB,HTML, CSS, JS, Angular Js, reactjs, etc, nodejs --> Nginx/Apache servers --> http servers
API/APP/Backend tier --> Java, .NET,Python, pHp, etc. --> Jboss/weblogic/websphere --> inbuilt servers like tomcat
DB tier --> MySQL,MSSQL, Oracle, etc. --> MongoDB, Mysql, Kafka, redis

