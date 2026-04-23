FROM ubuntu
RUN apt udate -y && apt install nginx -y
COPY . /var/www/html
ENTRYPOINT ["nginx","-G","daemon off;"]
