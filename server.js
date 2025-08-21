const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware pour servir les fichiers statiques
app.use(express.static(path.join(__dirname, '.')));

// Route principale
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

// API endpoints pour la démo
app.get('/api/health', (req, res) => {
    res.json({ status: 'OK', message: 'KA Quest Web App is running!' });
});

app.get('/api/game/demo', (req, res) => {
    res.json({
        hieroglyph: '𓂓',
        name: 'Ka',
        translations: {
            french: 'force vitale',
            english: 'vital force',
            ka_method: 'spiritual essence'
        },
        options: [
            'force vitale',
            'pouvoir sacré',
            'énergie divine',
            'âme immortelle'
        ],
        correct_answer: 'force vitale'
    });
});

app.get('/api/premium/features', (req, res) => {
    res.json({
        free: ['puzzles de base', 'niveaux limités', 'mode apprentissage'],
        premium: ['scan hiéroglyphes', 'niveaux illimités', 'traduction temps réel'],
        pro: ['accès API', 'support prioritaire', 'modèles personnalisés']
    });
});

// Gestion d'erreurs
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something broke!');
});

// Démarrage du serveur
const HOST = '0.0.0.0'; // Écouter sur toutes les interfaces
app.listen(PORT, HOST, () => {
    console.log(`
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║  🚀 KA Quest Web App is running!                            ║
║                                                              ║
║  🌐 Local: http://localhost:${PORT}                         ║
║  🌐 Network: http://0.0.0.0:${PORT}                        ║
║  🌐 External: http://192.168.1.100:${PORT}                 ║
║                                                              ║
║  ✨ Features:                                               ║
║  • Interactive hieroglyph puzzles                           ║
║  • KA method demonstrations                                 ║
║  • Premium feature preview                                  ║
║  • Responsive design                                        ║
║  • Multilingual support (FR/EN/ES/DE)                       ║
║  • Modern UI with Cinzel font                               ║
║                                                              ║
║  🛑 Press Ctrl+C to stop the server                         ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
    `);
});