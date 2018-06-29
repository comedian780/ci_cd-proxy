node {
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/comedian780/ci_cd-proxy.git'

   }
     stage('Build') { // for display purposes
      // run gradle build -> happens while docker builds

      if (isUnix()) {
          /* build docker image */
          IMAGE_EXISTS = sh(
          script: "docker images -q parcel-proxy",
            returnStatus : true)
          /* Remove the previous build image */
          if(IMAGE_EXISTS!=""){
            sh 'docker rmi -f "asset.allgaeu-parcel-service.com:443/parcel-proxy"'
          }
          sh 'docker build -t "asset.allgaeu-parcel-service.com:443/parcel-proxy" .'
          sh 'docker image prune -f'

      } else {
          /* build docker image */

          bat 'docker rmi -f asset.allgaeu-parcel-service.com:443/parcel-proxy'
          bat 'docker build -t asset.allgaeu-parcel-service.com:443/parcel-proxy .'
          bat 'docker image prune -f'
      }

   }
   stage('Deploy to registry'){
    if (isUnix()) {
      sh 'docker push "asset.allgaeu-parcel-service.com:443/parcel-proxy"'
    } else {
      bat 'docker push "asset.allgaeu-parcel-service.com:443/parcel-proxy"'
    }
   }
}
