kind: Pod
apiVersion: v1
metadata:
  name: labels
  labels:
    course: k8
    trainer: sivakumar
spec:
  containers:
  - name: nginx
    image: nginx

so here u need to understand one thing 
 kind about is serive or deployment or pod 
 apiverion is just about version that it
 metedata is about just name and lables that it 
 spec: here we can declare service , port no , and also container name, and aslo image name 
    


     

if interview ask to write kubernetes yaml life


interview question
-----------------------

kubernetes is a container orchestrator | means we know about orchestor a person who play major role he gives instruction to every once

NODE 
-----
runtime environment at node ,will create a pod ,pod inside is multiple container

NODE Port 
------
all the noed inside kubernetes cluster it will open one port , so nodeport forwrding traffic to cluster Ip .

if a created nordport means nothing but cluster Ip

LOAD BALANCER
--------------
load balancer forwarding traffic to nord port forwarding traffic to the cluster ip.

------------------------------------------------------------

cluster ip subset of nordport is subset of load BALANCER

------------------------------------------------------------------------------------------------------

REPLICASET
----------
replicaset it just create multiple pods that it we connot change version also instead use deployment

create replicas of pod if traffic increases we need multiple pods

DEPLOYMENT
----------

version update and image update here without downtime

deployment we have adventage we can change image with out downtime of pod compare with replicaset 


nord port 
------------
to view front end
NORDPORT like 3306 or 8080 what ever u got from nord should be given internet access in the security gorup of any worker NORD 


to create cluster command
------------------------------

eksctl create cluster --config-file=eksctl.yaml

alias k="kubectl -f apply"

