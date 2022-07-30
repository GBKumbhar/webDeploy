FROM ubuntu:latest
LABEL "author"="Ganesh K"
RUN apt-get update && apt-get install -y apache2 unzip
# copying website url
ADD https://www.free-css.com/assets/files/free-css-templates/download/page281/nurgo.zip .
run unzip nurgo.zip
run cp -rvf html/* /var/www/html
WORKDIR /var/www/html
#RUN unzip nurgo.zip && cp -rvf nurgo/* . && rm -rf nurgo nurgo.zip
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
