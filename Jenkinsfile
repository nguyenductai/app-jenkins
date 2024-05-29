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
                 cc : 'khenhnguyenqn@gamil.com',
                subject: "FAILED: Build", 
                body: "Build failed  build no: .\n\nView the log at:\n\n\nBlue Ocean:\n"
        }
    }
    
    success {
              mail to: 'nguyenductaiqn97@gmail.com',
                 cc : 'khenhnguyenqn@gamil.com',
                subject: "success: Build", 
                body: "Build success  build no: .\n\nView the log at:\n\n\nBlue Ocean:\n"
        }
        
        aborted{{
              mail to: 'nguyenductaiqn97@gmail.com',
                 cc : 'khenhnguyenqn@gamil.com',
                subject: "FAILED: aborted", 
                body: "Build aborted  build no: .\n\nView the log at:\n\n\nBlue Ocean:\n"
        }
    }
}