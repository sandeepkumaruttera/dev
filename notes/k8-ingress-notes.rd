Ingress Controller
------------------
ALB --> rules, listeners, target groups, etc.
Classic --> old generation, AWS recommends to use ALB not classic LB.

ALB
-----------
intelligent load balancer
create multiple listeners, create multiple rules

backend.alb-url --> backend target groups
user.alb-url --> user target group
m.facebook.com --> this is redirecting to mobile based website
facebook.com --> redirected to desktop based site

host based routing
context based routing

daws78s.online

host based
-------------
backend.daws78s.online
user.daws78s.online

context based or path based
-----------------
daws78s.online/backend --> Backend TG
daws78s.online/user --> User TG

joindevops --> EKS
expense
roboshop
amazon
flipkart

https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.8/

1. create OIDC

eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster expense-1 \
    --approve
	
2. curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.8.1/docs/install/iam_policy.json

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

eksctl create iamserviceaccount \
--cluster=expense-1 \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::315069654700:policy/AWSLoadBalancerControllerIAMPolicy \
--override-existing-serviceaccounts \
--region us-east-1 \
--approve

1. templatize the manifest files
2. package manager

yum --> install packages in rhel os

1. building image
2. run/configuring image

opensource images are always available in internet.
	jenkins is stateful
	
	statefulset
	service LB
	configmap
	secrets
	pv
	pvc
	sc



helm repo add eks https://aws.github.io/eks-charts

	
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=expense-1 --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller


apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-wildcard-host
spec:
  rules:
  - host: "backend.daws78s.online"
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: backend
            port:
              number: 80


ALB --> Listener --> rule --> TG

ALB/Ingress Controller --> Ingress --> Service --> Pod

2 applications -> app1 and app2

app1.daws78s.online --> response should come from APP1
app2.daws78s.online --> response should come from APP2


app1.daws78s.online --> R53 --> that should point to ALB

HDFC --> Ingresscontroller
IDFC --> Ingresscontroller

Configuring network policies