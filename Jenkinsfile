pipeline {
    agent {
        docker {
            image 'node:14-alpine'
        }
    }

    stages {
        stage('build') {
            steps {
                echo 'Compiling worker app'
                dir('worker'){
                  sh 'npm install'
                }
            }
        }
        stage('test') {
            steps {
                echo 'Unit Tests of worker app'
                dir('worker'){
                  sh 'npm test'
                }
            }
        }
    }
    post {
      always {
        echo 'Pipeline completed'
      }
    }
}
