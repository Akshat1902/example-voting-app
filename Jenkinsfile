pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/Akshat1902/example-voting-app.git'
            }
        }
        stage('Run Docker Compose'){
            steps{
                echo "Running Job: ${env.JOB_NAME}\n build: ${env.BUILD_ID}"
                sh 'docker-compose up'
            }
        }
    }
}