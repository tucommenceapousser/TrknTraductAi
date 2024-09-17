#!/bin/bash

function check_api_key() {
    echo "🛠️ Vérification de la clé API en cours..."

    TEST_BODY='{
      "model": "'$MODEL'",
      "messages": [{"role": "user", "content": "Test de vérification de clé"}]
    }'

    VALIDITY_CHECK=$(curl -s -X POST $URL \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $API_KEY" \
      -d "$TEST_BODY")

    if echo "$VALIDITY_CHECK" | grep -q '"error"'; then
        echo "❌ Clé API invalide ou indisponible. Veuillez vérifier votre clé API."
        exit 1
    fi

    echo "😈 Clé API valide. Traduction en cours..."
}

function read_file_content() {
    if [ ! -f "$FILENAME" ]; then
        echo "👿 Oups ! Le fichier $FILENAME n'existe pas. Vérifiez et réessayez."
        exit 1
    fi

    FILE_CONTENT=$(cat "$FILENAME" | head -c 4000)

    if [ -z "$FILE_CONTENT" ]; then
        echo "👾 Le fichier est vide ou trop petit pour être lu."
        exit 1
    fi
}

function detect_language() {
    echo "🔍 Détection de la langue du fichier..."

    read -r -d '' DETECT_LANGUAGE_BODY <<EOF
{
  "model": "$MODEL",
  "messages": [
    {"role": "system", "content": "Vous êtes un détecteur de langue."},
    {"role": "user", "content": "Quelle est la langue du texte suivant : $FILE_CONTENT"}
  ]
}
EOF

    LANG_DETECTION_RESPONSE=$(curl -s -X POST $URL \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $API_KEY" \
      -d "$DETECT_LANGUAGE_BODY")

    DETECTED_LANGUAGE=$(echo "$LANG_DETECTION_RESPONSE" | jq -r '.choices[0].message.content' 2>/dev/null)

    if [ -z "$DETECTED_LANGUAGE" ] || [ "$DETECTED_LANGUAGE" == "null" ]; then
        echo "⚠️ Erreur dans la détection de la langue. Essayons une autre méthode."
        read -p "Veuillez entrer manuellement la langue source (ex: anglais, birman) : " DETECTED_LANGUAGE
    fi

    echo "🕵️‍♂️ Langue détectée ou saisie : $DETECTED_LANGUAGE"
}

function translate_text() {
    echo "🔄 Traduction du texte en cours..."

    read -r -d '' TRANSLATE_BODY <<EOF
{
  "model": "$MODEL",
  "messages": [
    {"role": "system", "content": "Vous êtes un traducteur professionnel."},
    {"role": "user", "content": "Traduisez ce texte du $DETECTED_LANGUAGE en français : $FILE_CONTENT"}
  ]
}
EOF

    TRANSLATION_RESPONSE=$(curl -s -X POST $URL \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $API_KEY" \
      -d "$TRANSLATE_BODY")

    TRANSLATION=$(echo "$TRANSLATION_RESPONSE" | jq -r '.choices[0].message.content' 2>/dev/null)

    if [ -z "$TRANSLATION" ] || [ "$TRANSLATION" == "null" ]; then
        echo "❌ Erreur : Impossible de récupérer la traduction. Voici la réponse brute pour le diagnostic :"
        echo "$TRANSLATION_RESPONSE"
        exit 1
    fi

    echo "😈 Traduction réussie !😈 Voici le résultat :" > "$OUTPUT_FILE"

    echo "$TRANSLATION" >> "$OUTPUT_FILE"
    echo "PS: Texte traduit a l'aide de l'outil de traduction developpé par ✩░▒▓▆▅▃▂▁𝐓𝐑𝐇𝐀𝐂𝐊𝐍𝐎𝐍▁▂▃▅▆▓▒░✩" >> "$OUTPUT_FILE"


    echo "😈 Traduction réussie !😈 Voici le résultat :"
    echo "$TRANSLATION"
    echo "📁 La traduction a été enregistrée dans : $OUTPUT_FILE"
}

echo "😈 Bienvenue dans le traducteur de fichiers par ✩░▒▓▆▅▃▂▁𝐓𝐑𝐇𝐀𝐂𝐊𝐍𝐎𝐍▁▂▃▅▆▓▒░✩ ! 😈"
echo "Si vous ne fournissez pas de fichier, vous serez invité à en entrer un manuellement."

API_KEY="yourAPIKEY"

MODEL="gpt-4"
URL="https://api.openai.com/v1/chat/completions"
TARGET_LANGUAGE="français"

check_api_key

if [ $# -eq 0 ]; then
    read -p "Veuillez entrer le nom du fichier à traduire : " FILENAME
else
    FILENAME=$1
fi

OUTPUT_FILE="traduction_${FILENAME}"

read_file_content
detect_language
translate_text
