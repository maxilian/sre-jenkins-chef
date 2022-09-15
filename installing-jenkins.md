# INSTALL JENKINS ON UBUNTU 20.04

1. Add jenkins repo to source list
    ```
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt update
    ```
2. Install jenkins package from repo
    ```
    sudo apt install openjdk-11-jre
    sudo apt install jenkins
    ```
3. Open required port in firewall that used by jenkins
    ```
    sudo ufw allow 8080
    ```
4. Get required key (initial password) before go to installation wizard
    ```
    cat /var/lib/jenkins/secrets/initialAdminPassword
    ```
5. Access jenkins from url: http://ipserver:8080 and enter initial password to start installation wizard
