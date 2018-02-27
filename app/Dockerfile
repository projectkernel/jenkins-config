FROM jenkins/jenkins:lts

COPY log.properties ./log.properties

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false \
    -Djava.util.logging.config.file=log.properties"

# COPY https.pem /var/lib/jenkins/cert
# COPY https.key /var/lib/jenkins/pk
# ENV JENKINS_OPTS --httpPort=8080 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
 
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

EXPOSE 8080