pipeline {
    agent none

    stages {
        stage('build') {
            agent {
                docker {
                    image 'node:14-alpine'
                }
            }
            steps {
                echo 'Compiling worker app'
                dir('worker'){
                  sh 'npm install'
                }
            }
        }
        stage('test') {
            agent {
                docker {
                    image 'node:14-alpine'
                }
            }
            steps {
                echo 'Unit Tests of worker app'
                dir('worker'){
                  sh 'npm test'
                }
            }
        }
        stage('docker-image') {
            agent any
            steps {
                echo 'Packaging app image and publishing..'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerlogin') {
                      def workingImage = docker.build("speedlight/energy:v${env.BUILD_ID}", ".")
                      workingImage.push("latest")
                      workingImage.push("v${env.BUILD_NUMBER}")
                    } 
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
