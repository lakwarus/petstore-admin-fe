From ubuntu:14.04

RUN sudo apt-get update && apt-get install -y apache2 php5 php5-curl

RUN sudo apt-get install -y openssh-server git vim 
RUN mkdir -p /var/run/sshd
RUN echo 'root:stratos' | chpasswd
RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config
EXPOSE 22

expose 80

RUN rm -fr /var/www/html/*
COPY html /var/www/html/
COPY init.sh /opt/
RUN chmod 755 /opt/init.sh
ENTRYPOINT /opt/init.sh 
