pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/dvish2003/GITHUB-DOCKER-AND-JENKINS-CI-CD-PIPELINE.git'
                }
            }
        }

        stage('Check workspace') {
            steps {
                sh 'ls -R'
                sh 'cat nodeapp/package.json || echo "package.json NOT FOUND"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dvish2003/nodeapp:${BUILD_NUMBER} ./nodeapp'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'test-dockerhub-password', variable: 'DOCKER_HUB_PASSWORD')]) {
                    sh "echo ${DOCKER_HUB_PASSWORD} | docker login -u dvish2003 --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push dvish2003/nodeapp:${BUILD_NUMBER}'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
