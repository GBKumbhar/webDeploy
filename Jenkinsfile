def getDockerTag(){
    def tag = sh script: "git rev-parse HEAD", stdout:true  ;
    return tag;
}

pipeline{
    agent any
    environment{
        tag = getDockerTag();
    }
    stages{
        stage("clone"){
            steps{
                sh "git clone https://github.com/GBKumbhar/webDeploy.git"
            }
        }
        stage('create docker image'){
            sh 'docker build -t 00010009/webapp1:${tag} .'
         	    sh 'docker tag my-image 00010009/webapp1:${tag}'
         	    sh 'docker images'
         	
         	    withCredentials([string(credentialsId: 'dockpwd', variable: 'dockpwd')]) {
         		    sh 'docker login -u 00010009 -p $dockpwd '
         		    sh 'docker push 00010009/webapp1:${tag}'
         	    }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}