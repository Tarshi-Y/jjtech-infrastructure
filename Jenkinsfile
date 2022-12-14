

    
pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                echo 'cloning project codebase.....'
                git branch: 'main', url: ' https://github.com/Tarshi-Y/jjtech-infrastructure.git'
                sh "ls"
            }
        }
         stage('Verify Terraform Version') {
            steps {
                echo 'Verying Terraform Version....'
                sh "terraform --version"
            }
        }
         stage('Terraform init') {
            steps {
                echo 'initialising terraform project....'
                sh "terraform init"
            }
        }
        stage('Terraform plan') {
            steps {
                echo 'planning terraform project....'
                sh "terraform plan"
            }
        }
        stage('checkour-scan') {
            steps {
           sh """
           sudo pip3 install checkov
           checkov -d . --skip-check CKV2_AWS_41
           """
            }
        }
                stage('manual approval') {
            steps {
            input 'approval required for deployment'
            }
        }
         stage('Terraform validate') {
            steps {
                echo 'validating terraform....'
                sh "terraform validate"
            }
        }

        stage('Terraform apply ') {
            steps {
                echo 'applying terraform project....'
                sh "sudo terraform apply --auto-approve"
            }
        }
                 stage('Terraform fmt ') {
            steps {
                echo 'structuring terraform....'
                sh "terraform fmt"
            }
        }
              stage('slack') {
            steps {
                echo 'Hello World'
                slackSend channel: '#cicd-demo-eddy', message: 'deployment success'
                slackSend channel: '#cicd-demo-eddy', color: 'blue', message: 'hello'
            }
        }
    }
}
