#
# Cookbook:: install_jenkins_slave
# Recipe:: inbound_agent
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
    env ['JENKINS_URL=http://172.18.100.71:8080', 'JENKINS_AGENT_NAME=TEST-72', 'JENKINS_AGENT_WORKDIR=/home/jenkins/agents', 'JENKINS_SECRET=5aa06d66c3b580880eed1033687d6b487da599952f91cdc165a21dd0879e1d6e']
    volumes ['jenkins-data:/home/jenkins/agent']

end
