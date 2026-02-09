# Image de base : Nginx ultra-léger (Alpine)
FROM nginx:alpine

# Nettoyage du dossier par défaut
RUN rm -rf /usr/share/nginx/html/*

# Copie de tes fichiers locaux vers le serveur web du conteneur
COPY . /usr/share/nginx/html

# Le port interne est le 80
EXPOSE 80

# Lancement du serveur
CMD ["nginx", "-g", "daemon off;"]