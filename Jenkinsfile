// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
//             }
//         }
//         stage('Merge request') {
//             steps {
//                 echo "PATH: $PATH"
//                 sh 'echo Merge...'
//             }
//         }
//         stage('Build') {
//             steps {
//                 sh 'echo Building...'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh 'echo Testing...'
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 sh 'echo Deploying...'
//             }
//         }
//     }
//     // post {
//     //     always {
//     //         emailext(
//     //             to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
//     //             subject: "Build Notification: ${currentBuild.fullDisplayName}",
//     //             body: """<p>Build <b>${currentBuild.fullDisplayName}</b> finished with status: ${currentBuild.currentResult}</p>
//     //                      <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
//     //         )
//     //     }
//     //     success {
//     //         emailext(
//     //             to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
//     //             subject: "SUCCESS: Build ${currentBuild.fullDisplayName}",
//     //             body: """<p>Build <b>${currentBuild.fullDisplayName}</b> was successful.</p>
//     //                      <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
//     //         )
//     //     }
//     //     aborted {
//     //         emailext(
//     //             to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
//     //             subject: "ABORTED: Build ${currentBuild.fullDisplayName}",
//     //             body: """<p>Build <b>${currentBuild.fullDisplayName}</b> was aborted.</p>
//     //                      <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
//     //         )
//     //     }
//     //     failure {
//     //         emailext(
//     //             to: 'nguyenductaiqn97@gmail.com, khenhnguyenqn@gmail.com',
//     //             subject: "FAILED: Build ${currentBuild.fullDisplayName}",
//     //             body: """<p>Build <b>${currentBuild.fullDisplayName}</b> failed.</p>
//     //                      <p>View details at: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>"""
//     //         )
//     //     }
//     // }
// }

// pipeline {
//     agent any

//     environment {
//         DOCKER_IMAGE = 'my-flutter-jenkins-build'
//         DOCKER_TAG = 'latest'
//     }

//     stages {
//         stage('Clone Repository') {
//             steps {
//                 git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
//             }
//         }

//         // stage('Build Docker Image') {
//         //     steps {
//         //         sh 'builddd'
//         //         // script {
//         //         //     // Executes the Maven build command inside the Docker container
//         //         //     docker.image('maven:latest').inside {
//         //         //         sh 'mvn clean install'
//         //         //     }
//         //         // }
//         //     }
//         //     // steps {
//         //     //     // script {
//         //     //     //     // Build Docker image
//         //     //     //     sh 'docker build -t ${DOCKER_IMAGE} .'
//         //     //     // }
//         //     // }
//         // }

//         stage('Run Docker Container') {
//              steps{
//                 script {
//                         sh "docker --version"
//                      }
//                 }
//         }

//         stage('Archive APK') {
//             steps {
//                  sh 'echo Deploying...'
//                 // script {
//                 //     // Archive the APK file for download
//                 //     archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', allowEmptyArchive: true
//                 // }
//             }
//         }
//     }

//     post {
//         success {
//             archiveArtifacts artifacts: 'lib/main.dart', allowEmptyArchive: true
//             echo 'Build completed successfully'
//         }
//         failure {
//             echo 'Build failed'
//         }
//     }
// }

pipeline {
    agent any
    environment {
        SSH_CREDENTIALS_ID = 'ssh-app'
        REMOTE_HOST = '192.168.9.6'
        SSH_USER = 'macbookprom1'
    }

    stages {
        stage ("SSH Server"){
            steps {
     sshagent(credentials: [SSH_CREDENTIALS_ID]) {
 sh """
        ssh -o StrictHostKeyChecking=no ${SSH_USER}@${REMOTE_HOST} \\
        'echo "Running multiple commands"; \\
        whoami; \\
        cd Desktop/app-ci-cd/appcicd && docker --version'
    """
}


               // sh 'docker build -t flutter-app-v1 .'
                // sh 'chmod +x start_build.sh'
                // sh './start_build.sh'
                
            //      sshagent(['testv1']) {
            //        sh "sshpass -p '1234' ssh user@host 'your-command'"

            //     //     sh 'chmod +x start_build.sh'
            //     //     // Run the Bash script
            //     //    sh './start_build.sh'
            //   }
            //  script {
            //         // Chạy lệnh SSH
            //         //sshCommand remote: 'macbookprom1@172.20.10.5', command: 'your-command'
            //     }
            }
        }
    }
}
