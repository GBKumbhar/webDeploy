FROM ubuntu:latest
LABEL "author"="Ganesh K"
RUN apt-get update && apt-get install -y apache2 unzip
# copying website url
ADD https://www.free-css.com/assets/files/free-css-templates/download/page276/safetyfirst.zip .
RUN ls
run unzip safetyfirst.zip
RUN ls
RUN cd security-guard-website-template && ls
run cp -rvf security-guard-website-template/* /var/www/html
WORKDIR /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
