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
               ///sh 'git merge --no-ff origin/main'
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
    post {
        failure {
              mail to: 'nguyenductaiqn97@gmail.com',
                 cc : 'khenhnguyenqn@gamil.com'
                subject: "FAILED: Build ${env.JOB_NAME}", 
                body: "Build failed ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}.\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}"
        }
    
    success {
              mail to: 'nguyenductaiqn97@gmail.com',
                 cc : 'khenhnguyenqn@gamil.com'
                subject: "FAILED: Build ${env.JOB_NAME}", 
                body: "Build Success ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}.\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}"
        }
        
        aborted{
              mail to: 'nguyenductaiqn97@gmail.com',
                 cc : 'khenhnguyenqn@gamil.com'
                subject: "FAILED: Build ${env.JOB_NAME}", 
                body: "Build aborted ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}.\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}"
        }
    }
}