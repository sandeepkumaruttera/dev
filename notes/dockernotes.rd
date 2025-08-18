docker ps --> to check running containers
docker ps -a ---> to check all containers
docker images --> running images
docker logs backend --> to check logs

build command 
 docker build -t imagename:portno
 ex:- docker build -t nginx:1.0 .

docker run
docker logs container id
docker run -d -p <host-port>:<container-port> --name <need to give container name as per our requirement> --network expense nginx:1.0
ex:- docker run -d -p 8080:8080 --name backend nginx:1.0

docker run -d -p 8080:8080 --name backend --network expense backend:1.0


docker inspect backend -->to check the network


docker rmi `docker images -a -q`   --> to delete all Images
docker rm `docker ps -a -q`  -->to delete all containers


docker system prune --> deleting all containers


