pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = "registry.digitalocean.com/flask-app-algotest-ij"
        IMAGE_NAME = "flask-app"
        IMAGE_TAG = "latest"
        DOCKER_CREDENTIALS_ID = "docr-credentials"  // Add in Jenkins credentials
        KUBECONFIG_CREDENTIALS_ID = "kubeconfig-creds"  // Kubeconfig secret file
        NAMESPACE = "default"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Login to DOCR & Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, usernameVariable: 'DO_USERNAME', passwordVariable: 'DO_PASSWORD')]) {
                    sh """
                        echo "$DO_PASSWORD" | docker login ${DOCKER_REGISTRY} -u $DO_USERNAME --password-stdin
                        docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }

        stage('Deployment to DOKS') {
            steps {
                withCredentials([file(credentialsId: env.KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                    sh "kubectl apply -f cluster-deployment/deployment.yaml -n ${NAMESPACE}"
                }
            }
        }


        stage('Verify Deployment') {
            steps {
                script {
                    def serviceIp = sh(
                        script: "kubectl get svc flask-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}'",
                        returnStdout: true
                    ).trim()
                    sh "Service IP: ${serviceIp}"
                    sh "curl -v http://$serviceIp/"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed. Please check logs."
        }
    }
}
