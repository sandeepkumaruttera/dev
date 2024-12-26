to check memory 

df -hT 

it will show all ,but we need to take only xfs thing 
df -hT | grep xfs

df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1

it will show all storage things with out %

df -hT | grep xfs | awk -F " " '{print $NF}'

it will the folder of every usage 

we need to write script using this things available at sheel-script -->disk_usage.sh -->check once

