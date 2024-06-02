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
                sh 'flutter doctor -v'
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
            }
        }
    }
    post {
        always {
            emailext(
                to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
                subject: "Build Notification: ${currentBuild.fullDisplayName}",
                body: """<p>Build <b>${currentBuild.fullDisplayName}</b> finished with status: ${currentBuild.currentResult}</p>
                         <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
            )
        }
        success {
            emailext(
                to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
                subject: "SUCCESS: Build ${currentBuild.fullDisplayName}",
                body: """<p>Build <b>${currentBuild.fullDisplayName}</b> was successful.</p>
                         <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
            )
        }
        aborted {
            emailext(
                to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
                subject: "ABORTED: Build ${currentBuild.fullDisplayName}",
                body: """<p>Build <b>${currentBuild.fullDisplayName}</b> was aborted.</p>
                         <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
            )
        }
        failure {
            emailext(
                to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
                subject: "FAILED: Build ${currentBuild.fullDisplayName}",
                body: """<p>Build <b>${currentBuild.fullDisplayName}</b> failed.</p>
                         <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
            )
        }
    }
}
