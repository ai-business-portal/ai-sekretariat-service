FROM python:3.10-slim

# Arbeitsverzeichnis festlegen
WORKDIR /app

# Backend installieren
COPY ./backend /app/backend
COPY ./requirements.txt /app
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Frontend statische Dateien kopieren
COPY ./frontend/build /app/frontend/build

# Port freigeben
EXPOSE 8080

# Backend-Server starten
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]










