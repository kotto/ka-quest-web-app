# KA Quest Web App

Application web de démonstration pour KA Quest - l'application mobile d'apprentissage des hiéroglyphes avec la méthode KA.

## 🌟 Fonctionnalités

- 🏛️ **Interface moderne** avec design égyptien antique
- 🌍 **Support multilingue** (Français, Anglais, Espagnol, Allemand)
- 🎮 **Puzzles interactifs** avec hiéroglyphes
- 💎 **Aperçu des fonctionnalités premium**
- 📱 **Design responsive** pour mobile et desktop

## 🚀 Déploiement

### Option 1: Vercel (Recommandé)

1. **Installer Vercel CLI** :
   ```bash
   npm install -g vercel
   ```

2. **Déployer** :
   ```bash
   cd web_app
   vercel --prod
   ```

3. **Configuration automatique** via `vercel.json`

### Option 2: Render.com

1. **Créer un compte** sur [Render.com](https://render.com)
2. **Nouveau service Web** :
   - **Runtime** : Node.js
   - **Build Command** : `npm install`
   - **Start Command** : `npm start`
   - **Root Directory** : `web_app`

### Option 3: Heroku

1. **Créer un compte** sur [Heroku](https://heroku.com)
2. **Via Heroku CLI** :
   ```bash
   heroku create ka-quest-web
   git push heroku main
   ```

## 🛠️ Développement Local

### Prérequis
- Node.js >= 14.0.0
- npm ou yarn

### Installation
```bash
cd web_app
npm install
```

### Démarrage
```bash
npm start
```

L'application sera accessible sur `http://localhost:3000`

### Structure du Projet
```
web_app/
├── index.html          # Page principale
├── server.js           # Serveur Express
├── package.json        # Configuration npm
├── vercel.json         # Configuration Vercel
├── css/               # Styles CSS
├── js/                # Scripts JavaScript
└── assets/            # Images et ressources
```

## 🌐 API Endpoints

- `GET /` - Page principale
- `GET /api/health` - Statut du serveur
- `GET /api/game/demo` - Données de démonstration
- `GET /api/premium/features` - Fonctionnalités premium

## 🎨 Personnalisation

### Changer la police des titres
Modifiez le fichier `index.html` :
```css
.cinzel-title {
    font-family: 'VotrePolice', serif;
}
```

### Ajouter une nouvelle langue
1. Ajoutez le contenu dans `index.html` avec la classe `.content-{lang}`
2. Ajoutez un bouton dans le sélecteur de langue
3. Mettez à jour la fonction `setLanguage()` dans JavaScript

### Modifier les couleurs
Les couleurs principales sont définies dans les classes Tailwind :
- **Primaire** : `yellow-400`, `yellow-800`
- **Fond** : `gray-900`, `black`
- **Texte** : `yellow-100`, `gray-300`

## 📱 Fonctionnalités

### Version Gratuite
- Puzzles de traduction KA de base
- Interface 3D avec pyramides
- Mode apprentissage
- Collection de hiéroglyphes

### Version Premium (Aperçu)
- Scan de hiéroglyphes
- Niveaux avancés
- Traduction temps réel
- Mode hors ligne

## 🤝 Contribution

1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add some AmazingFeature'`)
4. Push la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 📞 Support

Pour toute question ou support :
- 📧 Email : support@ka-quest.com
- 🐛 Issues : [GitHub Issues](https://github.com/ka-quest/web-app/issues)
- 📖 Documentation : [Wiki](https://github.com/ka-quest/web-app/wiki)

---

**KA Quest** - L'application ultime pour apprendre les hiéroglyphes avec la méthode KA !