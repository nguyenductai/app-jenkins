pipeline {
   
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
            }
        }
         stage('Merge request') {
            steps {
                 sh 'git merge --no-ff origin/main'
                 sh 'echo Merge...'
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
