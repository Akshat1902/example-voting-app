pipeline{
    agent any
    stages{
        stage('Checkout SCM'){
            steps{
                git url: 'https://github.com/Akshat1902/example-voting-app.git'
            }
        }

        stage('SonarQube analysis') {
         steps {
            script {
              // requires SonarQube Scanner 2.8+
              scannerHome = tool 'sonarqube'
            }
            withSonarQubeEnv('sonarqube') {
             sh "${scannerHome}/bin/sonar-scanner \
             -D sonar.login=admin \
             -D sonar.password=password123 \
             -D sonar.projectKey=sonarqube"
            }
          }
        }
        stage('Build images by dockerfiles'){
            steps{
                sh './buildImages.sh'
            }
        }

        stage('Remove old containers if any'){
            steps{
                sh 'docker rm redis db vote worker result'
            }
        }
        
        stage('Run Docker Compose'){
            steps{
                echo "Running Job: ${env.JOB_NAME}\n build: ${env.BUILD_ID}"
                // sh 'docker-compose --version'
                // sh 'docker info'
                sh 'docker-compose up -d'
                sh 'docker ps -a'
                // sh 'chmod +x run.sh'
                // sh './run.sh'
            }
        }
    }
}