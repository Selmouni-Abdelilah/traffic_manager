pipeline {
    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['development', 'preprod', 'prod'],
            description: 'Select the target environment for deployment'
        )
    }
    agent any
    tools {
        terraform "terraform"
    }
    environment {
        ARM_ACCESS_KEY = credentials('ARM_ACCESS_KEY')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHubcredentials', url: 'https://github.com/Selmouni-Abdelilah/traffic_manager.git ']])
                }
            }
        }
        stage('Azure login'){
            steps{
                withCredentials([azureServicePrincipal('Azure_credentials')]) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                }
            }
        }
        stage('Terraform ') {
            steps {
                script {
                    dir('Terraform') {
                    sh 'terraform init -upgrade'
                    sh "terraform apply --auto-approve -var 'environment=${params.ENVIRONMENT}'"
                    }
                }
            }    
        }   

    }

}