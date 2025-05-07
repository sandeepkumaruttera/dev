terraform download process 
---------------------------------------------
download terraform -->download at D-drive place 
provide the path in env variables --> if it is installed need to check at command line prompt 
download aws cli ---> terraform will take aws cli help for authentication



module development
------------------

module develop means need to do everything 

module user means as per requirement need to change



module development -->terraform-aws-ec2 ---->creation of instance
module user -----> terraform-ec2-test --->as per requirement

-----------------------------------------------------------------------
module development -->terraform-aws-vpc ---->creation of vpc
module user -----> terraform-vpc-test --->as per requirement


-------------------------------------------------------------------------

module development ----> terrafrom-aws-securitygroup-moduledevelopment
module user ----------->expense-terraform-dev-module-user ---->02 security group



for i in 01.vpc/ 02.securrity-group/ 03.bastion/ 05.eks/ ; do cd $i; terraform init -reconfigure;terraform apply -auto-approve; cd .. ; done