        pipeline {
            //pipeline ek run wena operating system eka
            //like agent any => run on any available agent
            //agen linux etc ...
            agent any 
            
            stages { 
                stage('SCM Checkout') {  //clone git hub project
                    steps {
                        retry(3) {
                            git branch: 'main', url: 'https://github.com/dvish2003/GITHUB-DOCKER-AND-JENKINS-CI-CD-PIPELINE.git'
                        }
                    }
                }
            stage('Check workspace') {
                steps {
                sh 'ls -R'
    }
}

            stage('Build Docker Image') {
                    steps {  
                        sh 'docker build -t dvish2003/nodeapp:$BUILD_NUMBER .'
                    }
                }
                stage('Login to Docker Hub') {
                    steps {
                    withCredentials([string(credentialsId: 'test-dockerhub-password', variable: 'test-docker-hub-password')]) {
                            script {
                                //if use windows use bat
                                //if use linux use sh
                                sh "docker login -u dvish2003 -p ${test-docker-hub-password}"
                            }
                        }
                    }
                }
                stage('Push Image') {
                    steps {
                        sh 'docker push dvish2003/nodeapp:%BUILD_NUMBER%'
                    }
                }
            }
            post {
                always {
                    sh 'docker logout'
                }
            }
        }
