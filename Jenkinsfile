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
            sh 'docker rmi -f "193.174.205.28:443/parcel-proxy"'
          }
          sh 'docker build -t "193.174.205.28:443/parcel-proxy" .'
          sh 'docker image prune -f'

      } else {
          /* build docker image */

          bat 'docker rmi -f 193.174.205.28:443/parcel-proxy'
          bat 'docker build -t 193.174.205.28:443/parcel-proxy .'
          bat 'docker image prune -f'
      }

   }
   stage('Deploy to registry'){
    if (isUnix()) {
      sh 'docker push "193.174.205.28:443/parcel-proxy"'
    } else {
      bat 'docker push "193.174.205.28:443/parcel-proxy"'
    }
   }
}
