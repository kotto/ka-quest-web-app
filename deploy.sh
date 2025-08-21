#!/bin/bash

# Script de déploiement KA Quest Web App
# Supporte Vercel, Render.com et Heroku

echo "🚀 KA Quest Web App - Déploiement"
echo "================================="

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier les prérequis
check_prerequisites() {
    log_info "Vérification des prérequis..."

    if ! command -v node &> /dev/null; then
        log_error "Node.js n'est pas installé. Veuillez l'installer depuis https://nodejs.org/"
        exit 1
    fi

    if ! command -v npm &> /dev/null; then
        log_error "npm n'est pas installé. Veuillez l'installer avec Node.js"
        exit 1
    fi

    log_success "Prérequis OK"
}

# Menu de sélection de plateforme
select_platform() {
    echo ""
    echo "Choisissez votre plateforme de déploiement :"
    echo "1) Vercel (recommandé)"
    echo "2) Render.com"
    echo "3) Heroku"
    echo "4) Netlify"
    echo "5) Annuler"
    echo ""

    read -p "Votre choix (1-5) : " choice

    case $choice in
        1) deploy_vercel ;;
        2) deploy_render ;;
        3) deploy_heroku ;;
        4) deploy_netlify ;;
        5) exit 0 ;;
        *) log_error "Choix invalide"; select_platform ;;
    esac
}

# Déploiement Vercel
deploy_vercel() {
    log_info "Déploiement sur Vercel..."

    if ! command -v vercel &> /dev/null; then
        log_info "Installation de Vercel CLI..."
        npm install -g vercel
    fi

    log_info "Connexion à Vercel..."
    vercel login

    log_info "Déploiement..."
    cd web_app
    vercel --prod

    log_success "Application déployée sur Vercel !"
    log_info "Vous pouvez maintenant accéder à votre app via l'URL fournie par Vercel"
}

# Déploiement Render.com
deploy_render() {
    log_info "Configuration pour Render.com..."

    log_warning "Pour déployer sur Render.com :"
    echo ""
    echo "1. Allez sur https://render.com"
    echo "2. Créez un compte (si nécessaire)"
    echo "3. Cliquez sur 'New' > 'Web Service'"
    echo "4. Connectez votre repository GitHub ou téléchargez le code"
    echo "5. Configurez les paramètres suivants :"
    echo "   - Runtime: Node.js"
    echo "   - Build Command: npm install"
    echo "   - Start Command: npm start"
    echo "   - Root Directory: web_app"
    echo "   - Environment Variables: NODE_ENV=production"
    echo ""

    log_info "Le fichier render.yaml est déjà configuré pour vous"
    read -p "Appuyez sur Entrée quand vous êtes prêt à continuer..."
}

# Déploiement Heroku
deploy_heroku() {
    log_info "Déploiement sur Heroku..."

    if ! command -v heroku &> /dev/null; then
        log_info "Installation de Heroku CLI..."
        npm install -g heroku
    fi

    log_info "Connexion à Heroku..."
    heroku login

    log_info "Création de l'application..."
    heroku create ka-quest-web --stack=heroku-20

    log_info "Déploiement..."
    git add .
    git commit -m "Deploy to Heroku"
    git push heroku main

    log_success "Application déployée sur Heroku !"
    log_info "Ouvrez https://ka-quest-web.herokuapp.com pour voir votre app"
}

# Déploiement Netlify
deploy_netlify() {
    log_info "Déploiement sur Netlify..."

    if ! command -v netlify &> /dev/null; then
        log_info "Installation de Netlify CLI..."
        npm install -g netlify-cli
    fi

    log_info "Connexion à Netlify..."
    netlify login

    log_info "Déploiement..."
    cd web_app
    netlify deploy --prod --dir=.

    log_success "Application déployée sur Netlify !"
}

# Vérifier le déploiement local
test_local() {
    log_info "Test du serveur local..."

    cd web_app
    npm install
    npm start &

    sleep 3

    if curl -s http://localhost:3000/api/health > /dev/null; then
        log_success "Serveur local fonctionnel !"
        log_info "Accédez à http://localhost:3000"
    else
        log_error "Problème avec le serveur local"
    fi
}

# Fonction principale
main() {
    echo "🌟 Bienvenue dans le déploiement KA Quest ! 🌟"
    echo ""

    check_prerequisites

    echo ""
    echo "Que souhaitez-vous faire ?"
    echo "1) Tester localement"
    echo "2) Déployer en ligne"
    echo "3) Annuler"
    echo ""

    read -p "Votre choix (1-3) : " choice

    case $choice in
        1) test_local ;;
        2) select_platform ;;
        3) exit 0 ;;
        *) log_error "Choix invalide"; main ;;
    esac
}

# Lancer le script
main