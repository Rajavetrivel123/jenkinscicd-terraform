
pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        string(name: 'region', defaultValue: 'ap-south-1', description: 'select region to deployment')
        string(name: 'env', defaultValue: 'prod', description: 'select environment to deployment')
        string(name: 'service', defaultValue: 'apache', description: 'please provide service name')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
        options {
                timestamps ()
                ansiColor('xterm')
            }
    stages {
        stage('checkout') {
            steps {
                  git branch: "main", url: "https://github.com/Rajavetrivel123/jenkinscicd-terraform"
                  }
            }

        stages {
        stage('Terraform Init') {
            steps {
                script {
                    sh "terraform init -backend-config \"bucket=terraform.s3.22-04-24\" \
                      -backend-config \"key=terraform-\${params.region}/${params.service}.tfstate\" \
                      -backend-config \"region=\${params.region}\" \
                      -backend-config \"dynamodb_table=terraform\" \
                      -lock=true"
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                }
            }
        }
        }
        stage('Approval') {
          when {
              not {
                  equals expected: true, actual: params.autoApprove
              }
          }

          steps {
              script {
                    def plan = readFile 'jenkinscicd-terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
              }
          }
      }

        stage('Apply') {
            steps {
                sh " terraform apply -input=false tfplan "
            }
        }
      
    }

  }
