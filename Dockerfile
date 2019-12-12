FROM node:12.13.1

RUN yum install -y nginx

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN npm install \
    && npm run build \ 
    && cp -r dist/* /var/www/html \
    && rm -rf /app

CMD ["nginx","-g","daemon off;"]