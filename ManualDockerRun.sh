#Install Docker
#sudo apt-get remove docker docker-engine docker.io containerd runc
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh

#Clone Repository
#git clone https://github.com/Akshat1902/example-voting-app

#Build Images
#cd example-voting-app
cd vote
docker build -t akshat1711/vote-app .
cd ..
cd result
docker build -t akshat1711/result-app .
cd ..
#cd worker
#docker build -t akshat1711/worker-app .

#Remove containers if any
docker rm -f redis db vote result worker

docker run -d --name=redis redis
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker run -d --name=vote -p 5000:80 --link redis:redis akshat1711/vote-app
docker run -d --name=result -p 5001:80 --link redis:redis --link db:db akshat1711/result-app
docker run -d --name=worker --link redis:redis --link db:db prabhavagrawal/worker-app

#Check running containers
docker ps

#Allow security group with port 5000 - 5001

#check if the application is running by browsing IP:PORT
