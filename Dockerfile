# Utilisation d'un serveur web ultra-léger pour l'Acer
FROM nginx:stable-alpine

# On copie tout ton code HTML et tes images dans le serveur
COPY . /usr/share/nginx/html

# Le serveur écoutera sur le port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
