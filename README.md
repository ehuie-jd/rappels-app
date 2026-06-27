# 📅 Rappels App

Application de rappels PWA avec base de données Supabase, notifications, sonnerie et synchronisation en temps réel.

---

## 🚀 Déploiement en 4 étapes

### Étape 1 — Créer la base de données Supabase (gratuit)

1. Allez sur **[supabase.com](https://supabase.com)** → **Start for free**
2. Créez un compte (Google ou email)
3. Cliquez **New project** → donnez un nom (ex: `rappels`) → choisissez un mot de passe fort → **Create project**
4. Attendez ~2 minutes que le projet se crée
5. Dans le menu gauche, allez dans **SQL Editor**
6. Copiez tout le contenu du fichier `schema.sql` et collez-le → cliquez **Run**
7. Récupérez vos identifiants :
   - Menu gauche → **Settings** → **API**
   - Copiez **Project URL** (ex: `https://abcxyz.supabase.co`)
   - Copiez **anon public key** (longue clé commençant par `eyJ...`)

---

### Étape 2 — Mettre le code sur GitHub

1. Créez un compte sur **[github.com](https://github.com)** si vous n'en avez pas
2. Cliquez le **+** en haut à droite → **New repository**
3. Nom du dépôt : `rappels` (ou ce que vous voulez)
4. Cochez **Public** ✅ (obligatoire pour GitHub Pages gratuit)
5. Cliquez **Create repository**
6. Sur la page suivante, cliquez **uploading an existing file**
7. Glissez-déposez tous les fichiers du projet :
   - `index.html`
   - `style.css`
   - `app.js`
   - `manifest.json`
   - `sw.js`
   - `schema.sql` (optionnel, juste pour référence)
8. Cliquez **Commit changes**

---

### Étape 3 — Activer GitHub Pages

1. Dans votre dépôt GitHub, cliquez **Settings** (onglet en haut)
2. Dans le menu gauche, cliquez **Pages**
3. Sous **Source**, choisissez **Deploy from a branch**
4. Branch : **main** / Folder : **/ (root)** → **Save**
5. Attendez ~2 minutes
6. GitHub vous donne une URL : `https://VOTRE_PSEUDO.github.io/rappels`

---

### Étape 4 — Utiliser sur Android

1. Ouvrez l'URL GitHub Pages dans **Chrome sur Android**
2. L'app vous demande vos identifiants Supabase → collez l'URL et la clé anon
3. Cliquez **Connecter** — vos rappels s'affichent !
4. Pour installer comme une vraie app :
   - Chrome → **⋮ (3 points)** → **Ajouter à l'écran d'accueil**
   - L'icône apparaît sur votre bureau Android
5. Appuyez sur **Notifs** dans l'app → **Autoriser** sur Android

---

## 📱 Fonctionnalités

| Fonctionnalité | Description |
|---|---|
| ➕ Ajouter un rappel | Titre + catégorie + priorité + date/heure |
| ✅ Marquer comme fait | Appuyer sur le cercle |
| 🗑️ Supprimer | Icône corbeille |
| 🔊 Tester la sonnerie | Icône volume |
| 🔔 Notifications | Alerte même quand l'écran est verrouillé |
| 🎯 Filtres | Par catégorie, urgence, retard |
| 🌙 Mode sombre | Automatique selon Android |
| 📶 Hors ligne | L'app fonctionne sans internet (données locales) |
| 🔄 Temps réel | Synchronisation entre plusieurs appareils |

---

## 🗄️ Structure de la base de données

```
reminders
├── id          (auto-incrémenté)
├── title       (texte du rappel)
├── cat         (perso / travail / sante / autre)
├── prio        (haute / normale / basse)
├── time        (date et heure du rappel)
├── done        (true / false)
└── created_at  (date de création)
```

---

## 🔒 Sécurité

Par défaut, la base est accessible à quiconque connaît votre clé anon.
Pour un usage strictement personnel, c'est suffisant car la clé n'est connue que de vous.

Pour sécuriser davantage (multi-utilisateurs), ajoutez l'authentification Supabase Auth.

---

## ❓ Problèmes courants

**"Erreur de connexion"** → Vérifiez que l'URL commence bien par `https://` et que la clé est la clé `anon`, pas la `service_role`.

**Sonnerie ne fonctionne pas** → Le navigateur doit avoir le focus la première fois. Testez en appuyant sur l'icône 🔊.

**Notifications pas reçues** → Vérifiez que Chrome a la permission dans Paramètres Android → Applications → Chrome → Notifications.

**App ne s'installe pas** → L'URL doit être en HTTPS (GitHub Pages le fait automatiquement).
