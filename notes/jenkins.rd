pipeline{
	agent{
		label 'java-agent'
	}
	options{
		timeout(time: 30, unit: 'MINUTES')
	}
	environment{
		Greeting = 'Hello World'
	}
	parameters{
	
	}
	stages{
		stage('Build'){
			steps{
				sh 'echo this is build'
			}
		}
		stage('Test'){
			steps{
				sh 'echo this is build'
			}
		}
		stage('deploy'){
			steps{
				sh 'echo this is deploy'
			}
		}
	}
	post{
		always{
		
		}
		success{
		
		}
		failure{
		
		}
	}
}

this is important pipeline should learn interview question

master - agent artitecture
-------------------------------------------------------

manage-jenkins --> nodes ---> create AGENT-1
configure monitors ---.don't show offline
create agent instance ,instance type should be t3.small
sudo dnf install fontconfig java-17-openjdk ---> install these command 
and in jenkins go to node create label=AGENT-1 
there give directory /home/ec2-user/jenkins-agent need to give in jenkins-agent
and need to give only private ip address and also add credentials ex: ec2-user and DevOps321
that it build agent-1 



in master node write 
------------------------------
pipeline{
	agent{
		label 'AGENT-1'
	}
