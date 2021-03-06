FROM node:12.13.1

RUN apt-get update \
    && apt-get install -y nginx

WORKDIR /app

COPY . /app/

EXPOSE 80

RUN npm install \
    && npm run build \ 
    && cp -r dist/* /var/www/html

CMD ["nginx","-g","daemon off;"]