FROM python:3.10-slim

WORKDIR /app

# Backend-Abhängigkeiten installieren
COPY ./backend /app/backend
RUN pip install --upgrade pip
RUN pip install fastapi uvicorn python-multipart

# Frontend einfügen
COPY ./frontend/build /app/frontend/build

EXPOSE 8080

CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]









