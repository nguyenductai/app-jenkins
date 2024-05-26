pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'echo Building...'
                archiveArtifacts '**/*.apk'
            
            }
        }

        stage('Test') {
            steps {
                sh 'echo Testing...'
               
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deploying...'
                // Add your deployment steps here
            }
        }
    }
}