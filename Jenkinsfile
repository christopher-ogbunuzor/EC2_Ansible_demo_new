pipeline {
  agent {
     node { 
        label '"slave Server"'
        } 
  }
  stages {
    stage('Checkout Scm') {
      steps {
        git 'https://github.com/chris-cloudreach/Jenkins_project.git'
      }
    }

    stage('Shell script 0') {
      steps {
        sh '''sudo docker container rm -f $(sudo docker ps -a -q)
rm -rf ./Jenkins_project
echo "REMOVED OLD JENKINS GIT PROJECT"
git clone https://github.com/chris-cloudreach/Jenkins_project.git
cat /home/ubuntu/Jenkins_project/Website/index.html
sudo docker build -t chriswebsiteimage ./Jenkins_project/Website
sudo docker container run --name pswebsite -p 80:80 -d --log-driver=awslogs --log-opt awslogs-group=slaveserverDockerLogGroup chriswebsiteimage'''
      }
    }

  }
}