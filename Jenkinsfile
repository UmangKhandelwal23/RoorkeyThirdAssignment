pipeline {
    agent {
        label 'K8Agent'
    }
     environment {
         DOCKERHUB_CREDENTIALS = credentials('docker')
     }
    stages {
        stage('git') {
            steps {
                git branch: 'main' , url: 'https://github.com/UmangKhandelwal23/RoorkeyThirdAssignment'
            }
        }
        stage('docker build') {
            steps {
                sh'sudo docker build -t umangkhandelwal/roorkeythird:v2 .'
            }
        }
        stage('Docker Push') {
            steps {
                sh '''
                echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin
                docker push umangkhandelwal/roorkeythird:v2
                '''
            }
        }
        stage('K8 Deploy') {
            steps {
                sh 'kubectl delete -f deployment.yml || true'
                sh 'kubectl delete -f service.yml || true'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl apply -f service.yml'
            }
        }
    }
}
