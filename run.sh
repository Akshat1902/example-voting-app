
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

git clone https://github.com/prabhavagrawal/example-voting-app.git


cd example-voting-app
cd vote
docker build -t akshatchopra/vote-app .
cd ..
cd result
docker build -t akshatchopra/result-app .
cd ..
cd worker
docker build -t akshatchopra/worker-app .

docker rm -f redis db vote result worker

docker run -d --name=redis redis
docker run -d --name=db -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker run -d --name=vote -p 5000:80 --link redis:redis prabhavagrawal/vote-app
docker run -d --name=result -p 5001:80 --link redis:redis --link db:db prabhavagrawal/result-app
docker run -d --name=worker --link redis:redis --link db:db prabhavagrawal/worker-app

docker ps
