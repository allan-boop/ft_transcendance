# Utilise l'image officielle de Python comme base
FROM python:3.10-slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie les fichiers de ton projet dans le conteneur
COPY . /app/

# Installe les dépendances système nécessaires
RUN apt-get update \
    && apt-get install -y libpq-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

# Crée et active un environnement virtuel
RUN python3 -m venv venv
RUN . venv/bin/activate

# Installe les dépendances Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose le port de l'application
EXPOSE 8000

# Commande pour démarrer Django en mode développement
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]