pipeline {
  
     agent any

    // environment {
    //     FLUTTER_HOME = '/path/to/flutter' // Path to the Flutter SDK
    //     ANDROID_HOME = '/path/to/android/sdk' // Path to the Android SDK
    //     PATH = "$FLUTTER_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
    // }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/nguyenductai/app-jenkins', branch: 'main'
            }
        }

        stage('Setup Flutter Environment') {
              agent {
                        docker {
                            image 'node:20.11.1-alpine3.19'
                            args '-v /var/run/docker.sock:/var/run/docker.sock' // Optional: Additional arguments for the Docker run command
                        }
                     }
            steps {
                 sh 'node --version'
                // sh 'flutter doctor'
                //sh 'flutter upgrade'
            }
        }

        // stage('Install Dependencies') {
        //     steps {
        //         sh 'flutter pub get'
        //     }
        // }

        // stage('Run Tests') {
        //     steps {
        //         sh 'flutter test'
        //     }
        // }

        // stage('Build APK') {
        //     steps {
        //         sh 'flutter build apk --debug' // Use --release for a release build
        //     }
        // }

        // stage('Archive APK') {
        //     steps {
        //         archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-debug.apk', allowEmptyArchive: true
        //     }
        // }
    }

    post {
        always {
            cleanWs()
        }

        success {
            echo 'Build succeeded!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
