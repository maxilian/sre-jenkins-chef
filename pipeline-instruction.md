# JENKINS PIPELINE

## What is jenkins pipeline?

Pipeline is a collection of jobs or squences to brings software from Git repository into user hands by using automation process as soon as the code is commited to the repository. The pipeline can be used for build, testing, or deploying the software with certain scenario. In order to do automation process a jenkinsfile needs to be present at the project's root repository.

## Setting up jenkins pipeline to deploy apps within docker cluster
1. Install Docker swarm plugin from jenkins and then restart the service
2. Setting up Docker swarm on master node
    ```
    docker swarm init
    ```
3. Joining slave node to master node
    ```
    docker swarm join --token SWMTKN-1-4eefnsaiqlz22qkggon0yhbufal51igek5lh3jtulc7jfntdfe-e56pzqo79fv03m7wvm7zh6gc4 172.18.100.71:2377
    ```
4. Edit file /etc/docker/daemon.json and restart docker service on all
    * daemon.json for master node
    ```
    {
        "insecure-registries" : ["localhost:5000", "127.0.0.1:5000", "172.18.100.71:5000"]

    }
    ```
5. Add jenkins user to docker group and restart jenkins
    ```
    sudo usermod -a -G docker jenkins
    sudo systemctl restart jenkins
    ```
6. Deploy registry2 to hold docker image repository
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
4. Fork repo from https://github.com/docker-archive/swarm-microservice-demo-v1
5. Update some files in order to avoid deprecated dependencies
    * vote-worker/Dockerfile
    ```
    FROM openjdk:11

    RUN apt-get update -qq && apt-get install -y maven && apt-get clean

    WORKDIR /code

    ADD pom.xml /code/pom.xml
    RUN ["mvn", "dependency:resolve"]
    RUN ["mvn", "verify"]

    # Adding source, compile and package into a fat jar
    ADD src /code/src
    RUN ["mvn", "package"]

    CMD ["/usr/lib/jvm/java-11-openjdk-amd64/bin/java", "-jar", "target/worker-jar-with-dependencies.jar"]
    ```
6. Create new docker-compose to deploy the apps [link](deploy-voting-apps.yml)
