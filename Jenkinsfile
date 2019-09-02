node('docker') {
    //stage 'clean out any containers and images'
    //    sh "docker rm --force \$(docker ps -aq)"
    //    sh "docker rmi \$(docker images -q)"

    //environment
    //    registry = "docker_hub_account/repository_name"
    //    registryCredential = ‘dockerhub’
    
    stage 'clean docker system environment'
        sh "docker system prune -a -f"

    stage 'Checkout fresh code'
        checkout scm

    stage 'Build & UnitTest'
        //sh "docker build -t mongo:B${BUILD_NUMBER} -f ./mongo/Dockerfile ./mongo/"
        //sh "docker build -t backend:B${BUILD_NUMBER} -f ./backend/Dockerfile ./backend/"
        //sh "docker build -t frontend:B${BUILD_NUMBER} -f ./frontend/Dockerfile ./frontend/"
        def mongoImage = docker.build("danielchoi158/mongo:B${BUILD_NUMBER}","-f ./mongo/Dockerfile ./mongo/")
        def backendImage = docker.build("danielchoi158/backend:B${BUILD_NUMBER}","-f ./backend/Dockerfile ./backend/")
        def frontendImage = docker.build("danielchoi158/frontend:B${BUILD_NUMBER}","-f ./frontend/Dockerfile ./frontend/")
        // add unit test

    stage 'Integration Test'
        sh "docker-compose -f docker-compose.yml up --force-recreate --abort-on-container-exit"
        sh "docker-compose -f docker-compose.yml down -v"

    stage 'send to docker registry'
        withDockerRegistry([url: "",credentialsId: "dockerhub"]) {
            //sh "docker tag mongo:latest danielchoi158/mongo"
            //sh "docker tag backend:latest danielchoi158/backend"
            //sh "docker tag frontend:latest danielchoi158/frontend"
            sh "docker push danielchoi158/mongo"
            sh "docker push danielchoi158/backend"
            sh "docker push danielchoi158/frontend"

            //mongoImage.push('latest')
            //backendImage.push('latest')
            //frontendImage.push('latest')
        }

    stage 'delete image after upload'
        sh "docker rmi danielchoi158/mongo:B${BUILD_NUMBER}"
        sh "docker rmi danielchoi158/backend:B${BUILD_NUMBER}"
        sh "docker rmi danielchoi158/frontend:B${BUILD_NUMBER}"
}