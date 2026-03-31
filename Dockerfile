# Zvolíme ľahký a super-rýchly Nginx webserver
FROM nginx:alpine

# Pridanie author meta údajov
LABEL maintainer="Benjamín Baliak"

# Google Cloud Run požaduje defaultne port 8080 (nie 80, aby Nginx nepadol bez custom configu). 
# Týmto ho zmeníme priamo v konfigu obrazu:
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Nakopírujeme naše lokálne zdrojové kódy (html, css, grafiku) do public priečinka Nginx-u
COPY . /usr/share/nginx/html

# Expozícia portu pre sieťovanie (Cloud Run)
EXPOSE 8080

# Zapnutie Nginx-u
CMD ["nginx", "-g", "daemon off;"]
