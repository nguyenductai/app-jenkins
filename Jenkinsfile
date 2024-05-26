pipeline {
    environment {
        flutter = "/Library/Flutter/bin/flutter"
    }


    agent {
        docker { image 'mobiledevops/flutter-sdk-image' }
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
            }
        }
         stage('check version') {
            steps {
               sh 'flutter doctor -v'
            }
        }

        stage('Build') {
            steps {
                sh 'echo Building...'
               
            
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