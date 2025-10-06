pipeline {
    agent any

    environment {
        JFROG_URL = 'https://triali5hfv3.jfrog.io/artifactory'
        JFROG_REPO = 'docker-local'
        IMAGE_NAME = 'demo-image'
        IMAGE_TAG = '1.0'
        CREDENTIALS_ID = 'jfrog-creds'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/kmcdevops/test-jfrog.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('Tag Docker Image for JFrog') {
            steps {
                script {
                    sh 'docker tag $IMAGE_NAME:$IMAGE_TAG triali5hfv3.jfrog.io/$JFROG_REPO/$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }

        stage('Login to JFrog and Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD triali5hfv3.jfrog.io'
                    sh 'docker push triali5hfv3.jfrog.io/$JFROG_REPO/$IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }
}
