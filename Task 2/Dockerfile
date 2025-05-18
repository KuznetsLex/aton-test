FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl/nginx.crt /etc/ssl/certs/nginx.crt
COPY ssl/nginx.key /etc/ssl/private/nginx.key

EXPOSE 80 443