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

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-flutter-jenkins-build'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
            }
        }

        // stage('Build Docker Image') {
        //     steps {
        //         sh 'builddd'
        //         // script {
        //         //     // Executes the Maven build command inside the Docker container
        //         //     docker.image('maven:latest').inside {
        //         //         sh 'mvn clean install'
        //         //     }
        //         // }
        //     }
        //     // steps {
        //     //     // script {
        //     //     //     // Build Docker image
        //     //     //     sh 'docker build -t ${DOCKER_IMAGE} .'
        //     //     // }
        //     // }
        // }

        stage('Run Docker Container') {
            steps {
                  sh 'echo Deploying...'
                // script {
                //     // Run Docker container
                //     sh 'docker run --rm -v $WORKSPACE/build/app/outputs/flutter-apk:/app/build/app/outputs/flutter-apk ${DOCKER_IMAGE}'
                // }
            }
        }

        stage('Archive APK') {
            steps {
                 sh 'echo Deploying...'
                // script {
                //     // Archive the APK file for download
                //     archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', allowEmptyArchive: true
                // }
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully'
        }
        failure {
            echo 'Build failed'
        }
    }
}
