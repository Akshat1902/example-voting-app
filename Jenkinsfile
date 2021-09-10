pipeline{
    agent any
    stages{
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
                echo "Removing old containers if any"
                sh 'docker rm -f redis db vote worker result'
            }
        }
        
        stage('Run Docker Compose'){
            steps{
                echo "Running Job: ${env.JOB_NAME}\n build: ${env.BUILD_ID}"
                sh 'docker-compose up -d'
                sh 'docker ps -a'
            }
        }
    }
}