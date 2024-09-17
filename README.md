# 🎩 **TrknTraductAi** - Votre Traducteur intelligent

![Image Preview](https://c.top4top.io/p_3182aujx80.jpg)

Bienvenue dans **TrknTraductAi** ! Transformez vos fichiers en une variété de langues en utilisant la puissance de l'intelligence artificielle. Ce traducteur, développé par **Trhacknon**, est conçu pour être simple et puissant, vous permettant de traduire facilement des fichiers dans la langue de votre choix.

## 🌟 **Présentation de l'Outil**

**TrknTraductAi** est un outil de traduction automatique basé sur l'API OpenAI. Il prend en charge une grande variété de langues et utilise le modèle GPT-4 pour offrir des traductions précises et contextuelles.

### Fonctionnalités :
- Traduction de fichiers en français.
- Détection automatique de la langue source.
- Support interactif avec des messages d'erreur détaillés.
- Option pour entrer manuellement la langue source si nécessaire.

## 🚀 **Installation**

1. **Clonez le dépôt :**

    ```bash
    git clone https://github.com/tucommenceapousser/TrknTraductAi.git
    ```

2. **Accédez au répertoire :**

    ```bash
    cd TrknTraductAi
    ```

3. **Rendez le script exécutable :**

    ```bash
    chmod +x traduct.sh
    ```

## 🛠️ **Utilisation**

### Exécution de base

Pour traduire un fichier, exécutez le script avec le nom du fichier comme argument :

```bash
./traduct.sh nom_du_fichier.txt
```

Si vous ne fournissez pas de fichier en argument, le script vous demandera de saisir le nom du fichier manuellement.

### Options :

- **Vérification de la clé API** : Le script vérifie automatiquement la validité de votre clé API OpenAI avant d'effectuer la traduction.
- **Détection de la langue** : Si la langue source n'est pas détectée correctement, vous pouvez entrer manuellement la langue source.
- **Résultat** : Le texte traduit est enregistré dans un fichier nommé `traduction_nom_du_fichier.txt`.

## 📜 **Détails de l'Implémentation**

1. **Vérification de la clé API** : Assure que la clé API est valide avant de procéder.
2. **Lecture du fichier** : Lit le contenu du fichier et le prépare pour la traduction.
3. **Détection de la langue** : Utilise GPT-4 pour détecter la langue du texte ou demande une saisie manuelle.
4. **Traduction** : Traduit le texte en français et enregistre le résultat.

## 🔧 **Configuration**

Avant d'exécuter le script, vous devez remplacer `YOUR_API_KEY` par votre propre clé API OpenAI dans le fichier `traduct.sh`.

```bash
API_KEY="YOUR_API_KEY"
```

## 📄 **Contribuer**

Les contributions sont les bienvenues ! Pour contribuer à ce projet, veuillez suivre les étapes suivantes :

1. **Forkez le dépôt**.
2. **Créez une branche** (`git checkout -b feature-branch`).
3. **Faites vos modifications**.
4. **Committez vos modifications** (`git commit -am 'Add new feature'`).
5. **Poussez la branche** (`git push origin feature-branch`).
6. **Ouvrez une Pull Request**.

## 🏷️ **Licence**

Ce projet est sous la [MIT License](LICENSE).

## 📢 **Contact**

Pour toute question ou suggestion, n'hésitez pas à nous contacter :

- **GitHub**: [tucommenceapousser/TrknTraductAi](https://github.com/tucommenceapousser/TrknTraductAi)
- **Email**: contact@trhacknon.com

