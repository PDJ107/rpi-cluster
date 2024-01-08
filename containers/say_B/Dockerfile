FROM nginx:mainline-alpine3.18-slim

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80/tcp
EXPOSE 443/tcp
CMD ["nginx", "-g", "daemon off;"]