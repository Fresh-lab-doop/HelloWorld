#!/data/data/com.termux/files/usr/bin/bash
set -e

# === НАЛАШТУВАННЯ (зміни під себе) ===
REPO="HelloWorld"                                                   # назва репо на GitHub
MODS_DIR="/storage/emulated/0/Android/data/com.geode.launcher/files/game/geode/mods"  # куди кидати .geode
# =======================================

echo ">> Пушу зміни в GitHub..."
git add .
git commit -m "update" || echo "(нема змін для коміту)"
git push

echo ">> Чекаю запуск workflow..."
sleep 5
RUN_ID=$(gh run list --limit 1 --json databaseId --jq '.[0].databaseId')
echo "Run ID: $RUN_ID"

echo ">> Чекаю завершення збірки (це займе кілька хвилин)..."
gh run watch "$RUN_ID" --exit-status

echo ">> Завантажую артефакт..."
rm -rf ./_build_download
mkdir -p ./_build_download
gh run download "$RUN_ID" -D ./_build_download

echo ">> Шукаю .geode файл..."
GEODE_FILE=$(find ./_build_download -name "*.geode" | head -n 1)

if [ -z "$GEODE_FILE" ]; then
    echo "!! .geode файл не знайдено. Перевір артефакти вручну: gh run view $RUN_ID"
    exit 1
fi

echo ">> Знайдено: $GEODE_FILE"

mkdir -p "$MODS_DIR"
cp "$GEODE_FILE" "$MODS_DIR/"

echo ">> Готово! Мод скопійовано в: $MODS_DIR"
echo ">> Перезапусти Geometry Dash, щоб мод підхопився."
