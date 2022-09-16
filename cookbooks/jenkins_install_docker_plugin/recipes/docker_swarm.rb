#
# Cookbook:: jenkins_install_docker_plugin
# Recipe:: docker_swarm
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#default['jenkins']['master']['jvm_options'] = '-Djenkins.install.runSetupWizard=false'

jenkins_plugin 'docker-plugin' 