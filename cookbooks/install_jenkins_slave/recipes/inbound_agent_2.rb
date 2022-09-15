#
# Cookbook:: install_jenkins_slave
# Recipe:: inbound_agent_2
#
# Copyright:: 2022, The Authors, All Rights Reserved.

## pull the jenkins image
docker_image 'jenkins/inbound-agent' do
    tag 'latest'
    action :pull
    notifies :redeploy, 'docker_container[jenkins_inbound_agent]'
end

# ## create volume
docker_volume 'jenkins-data' do
  action :create
end

## create container
docker_container 'jenkins_inbound_agent' do

    repo 'jenkins/inbound-agent'
    detach true
    env ['JENKINS_URL=http://172.18.100.71:8080', 'JENKINS_AGENT_NAME=TEST-73', 'JENKINS_AGENT_WORKDIR=/home/jenkins/agents', 'JENKINS_SECRET=61448a0dddcfa464fc2e9759d52242368afabb75b1851dc6c8252ea745d3d4bf']
    volumes ['jenkins-data:/home/jenkins/agent']

end
