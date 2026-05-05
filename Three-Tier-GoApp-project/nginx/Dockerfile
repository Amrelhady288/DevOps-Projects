FROM nginx:latest

WORKDIR /proxy

COPY generate-ssl.sh .

RUN chmod +x generate-ssl.sh && ./generate-ssl.sh
RUN mkdir -p /etc/nginx/certs/ && mv *.pem /etc/nginx/certs/

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
