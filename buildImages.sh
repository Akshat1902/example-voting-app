echo "Building all Dockerfiles"
cd vote
docker build -t akshat1902/vote-app .
docker login -u "akshat1902" -p "Akshat@2417" docker.io
docker push akshat1902/vote-app
cd ..
cd result
docker build -t akshat1902/result-app .
docker push akshat1902/result-app

cd ..
cd worker
docker build -t akshat1902/worker-app .
docker push akshat1902/worker-app

docker rm -f redis db vote-app result-app worker-app
cd ..
docker logout
