# Portfolio - Architecture Haute Disponibilité (HA)

Ce dépôt contient le code source de mon portfolio, auto-hébergé sur mon infrastructure personnelle (Home Lab) avec un système de basculement automatique vers le cloud pour garantir une disponibilité à 100%.

## Architecture Technique

Le site repose sur une architecture moderne alliant serveur physique et services Edge :

- **Hébergement Primaire** : Serveur physique Acer Aspire X1430 sous Ubuntu Server.
- **Conteneurisation** : Application encapsulée dans un conteneur Docker (site-portfolio).
- **Reverse Proxy** : Nginx Proxy Manager (NPM) gère le routage interne et les certificats SSL.
- **Exposition Sécurisée** : Cloudflare Tunnel (Zero Trust) permet l'accès externe sans ouverture de ports sur la box internet.

## CI/CD & GitOps

Le déploiement est entièrement automatisé pour permettre des mises à jour instantanées :

- **GitHub Actions** : Un workflow se déclenche à chaque `git push` sur la branche `master`.
- **Webhooks Portainer** : GitHub communique directement avec l'instance Portainer de l'Acer pour redéployer la stack automatiquement.
- **GitOps** : Synchronisation entre le dépôt GitHub et les conteneurs Docker en production.

## Résilience & Failover (Haute Disponibilité)

Pour pallier une éventuelle panne du serveur local, un système de Failover a été mis en place :

- **Cloudflare Worker** : Un script Edge agit comme aiguilleur intelligent.
- **Détection de Panne** : Le Worker teste la santé de l'Acer (via `server.edouard-vallet.fr`).
- **Bascule Automatique** : En cas d'indisponibilité de l'Acer (timeout ou erreur 5xx), le trafic est redirigé vers GitHub Pages en moins de 3 secondes.
- **Traçabilité** : Ajout d'un header HTTP personnalisé `X-Served-By` pour identifier la source (Acer ou GitHub) en temps réel.

## Optimisations Spécifiques

- **Gestion des Médias** : Utilisation d'une balise `<video>` avec les attributs `autoplay loop muted` pour le support optimal du format WebM sur tous les navigateurs.
- **Accès Remote** : Configuration d'un accès SSH/SFTP sécurisé pour l'administration distante via mobile.