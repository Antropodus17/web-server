FROM debian:12

RUN apt update && apt install -y apache2 
RUN apt install -y rsyslog
RUN sed  's/^module(load="imklog")/#module(load="imklog")/' /etc/rsyslog.conf

RUN a2enmod ssl

EXPOSE 80
EXPOSE 443

# CMD [ "tail","-f","/dev/null" ]
ENTRYPOINT [ "apachectl" , "-D" , "FOREGROUND" ]
