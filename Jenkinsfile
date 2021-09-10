pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/Akshat1902/example-voting-app.git'
            }
        }

        stage('Build images by dockerfiles'){
            steps{
                // sh 'cd vote'
                // sh 'docker build -t akshat1711/vote-app .'
                // sh 'cd ..'
                // sh 'cd result'
                // sh 'docker build -t akshat1711/result-app .'
                // sh 'cd ..'
                dir("${env.WORKSPACE}/vote"){
                   sh "pwd"
                }
                sh 'docker build -t akshat1711/vote-app .'
                sh 'docker images'
            }
        }

//         stage('Remove old containers if any'){
//             steps{
//                 sh 'docker rm redis db vote worker result'
//             }
//         }

//         stage('Run Docker Compose'){
//             steps{
//                 echo "Running Job: ${env.JOB_NAME}\n build: ${env.BUILD_ID}"
//                 // sh 'docker-compose --version'
//                 // sh 'docker info'
//                 sh 'docker-compose up -d'
//                 sh 'docker ps -a'
//                 // sh 'chmod +x run.sh'
//                 // sh './run.sh'
//             }
//         }
//     }
}