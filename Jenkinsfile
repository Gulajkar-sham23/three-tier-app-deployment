groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/user/ci-cd-pipeline-project.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t mywebapp:latest .'
            }
        }
        stage('Unit Test') {
            steps {
                sh './scripts/run_tests.sh'
            }
        }
        stage('Upload Artifact to S3') {
            steps {
                sh 'aws s3 cp mywebapp:latest s3://my-artifact-bucket/mywebapp:latest'
            }
        }
        stage('Deploy to AWS EC2') {
            steps {
                sh 'scp -i key.pem mywebapp:latest ec2-user@EC2_IP:/home/ec2-user/'
            }
        }
        stage('Integration Test') {
            steps {
                sh './scripts/run_tests.sh'
            }
        }
    }
    post {
        failure {
            echo 'Build failed. Initiating rollback.'
            sh './scripts/rollback.sh'
        }
    }
}
