# HelloWorld — приклад мода для Geode

Показує плашку "Hello World!" з кнопкою OK при вході в головне меню GD.

## Структура

```
HelloWorld/
├── mod.json                     # метадані мода
├── CMakeLists.txt                # конфіг збірки
├── src/main.cpp                  # код мода
├── .github/workflows/build.yml   # авто-збірка через GitHub Actions
└── .gitignore
```

## Як зібрати через GitHub Actions (з телефону, Termux)

1. **Онови файли під себе** (через nano або Acode):
   - у `mod.json` заміни `"id"` на щось унікальне, напр. `"com.твойнік.helloworld"`
   - заміни `"developer": "YourName"` на своє ім'я

2. **Встанови gh і залогінься** (якщо ще ні):
   ```bash
   pkg install gh
   gh auth login
   ```

3. **Створи репозиторій і запуш код**:
   ```bash
   cd HelloWorld
   git init
   git add .
   git commit -m "Initial commit: HelloWorld mod"
   gh repo create HelloWorld --public --source=. --remote=origin --push
   ```

4. **Дочекайся збірки**:
   - GitHub Actions автоматично запуститься після push (workflow `build.yml`)
   - Прогрес можна дивитись командою:
     ```bash
     gh run watch
     ```
   - або на сайті: `https://github.com/ТВІЙ_НІК/HelloWorld/actions`

5. **Завантаж готовий .geode файл**:
   ```bash
   gh run list
   gh run download <RUN_ID>
   ```
   Або просто зайди в Actions → відкрий останній запуск → секція **Artifacts** внизу сторінки → завантаж zip з `.geode` файлом.

6. **Встанови мод**:
   - Перекинь `.geode` файл на телефон з GD
   - Постав його в папку `Android/data/com.geode.launcher/files/game/geode/mods/` (для Geode Launcher на Android)
   - Або відкрий файл через сам Geode Launcher, якщо є така опція

## Тестування без телефону з GD

Локально на Termux зібрати нативно не вийде (потрібен NDK/тулчейн для Android, або компілятор під Windows/Mac для десктопу) — тому весь білд робиться через GitHub Actions, де вже все налаштовано.
