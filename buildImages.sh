cd vote
docker build -t akshat1902/vote-app .
docker push akshat1902/vote-app
cd ..
cd result
docker build -t akshat1902/result-app .
docker push akshat1902/result-app

cd ..