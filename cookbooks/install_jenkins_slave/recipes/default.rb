#
# Cookbook:: install_jenkins_slave
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

## pull the jenkins image
# docker_image 'jenkins/ssh-agent' do
#     tag 'latest'
#     action :pull
#     notifies :redeploy, 'docker_container[jenkins_agent]'
# end

# ## create volume
# docker_volume 'jenkins-data' do
#   action :create
# end

# ## create container
# docker_container 'jenkins_agent' do
#   repo 'jenkins/ssh-agent'
#   detach true
#   #user 'administrator'
#   port ['222:22']
#   env 'JENKINS_AGENT_SSH_PUBKEY=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD4dhQLg2iO/2Stix/acfJ8f8SqqGS0bz4FpXh5TcGAKrufZ/8TM7LvFtzX2+oICwNW0ZD0wLnykSS0qKkVUndNHLEeUxRN+nAvrx9Ln3djceDYLxQrPv9lByZBCIVaSqYd9uU2zkUKnlPA5GjQ8J4JiQJqcS9yoKeVxE9xQ8YD97GhBGiYS6IweYEgRNzh7g2MWRvbiEywNNy1B9qS04UvBrQp4LrIV6NPDT+S9k1torUULnKeHWEZ1soULotNSgih9kIeLjuVudnotNDtGw721B5gcQvveJF/fGdlWVb6uYdEghpuXu+UeMxWjZKgXHTl6zfX2txu62EgX3Qdmv/hk+ivisawnjxbqT9Lp1IFCl+9eQVkuVJtpxK75IPLs03/JPoJFBux4yhFkoDGBLV89gCg+0HvGOfrO75YvZEgkANC7TZWuCgiajai2uVjRJ0YRRhe/E98Iy3DN93e4mmIZiSzWYOD5A18zY/S9otGLaWEMPKbW5sMTzCq7eur3nU= Jenkins agent key'
#   #volumes 'jenkins-data:/home/jenkins/agent'

# end

