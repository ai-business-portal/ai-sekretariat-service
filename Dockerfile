# FRONTEND-BUILD
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend
COPY ./frontend/package*.json ./
RUN npm install
COPY ./frontend .
RUN npm run build

# BACKEND-BUILD
FROM python:3.10-slim AS backend-builder
WORKDIR /app/backend
COPY ./backend .
RUN pip install --upgrade pip
RUN pip install fastapi uvicorn

# FINAL IMAGE (Backend + Frontend)
FROM python:3.10-slim
WORKDIR /app

# Backend kopieren
COPY --from=backend-builder /app/backend ./backend
RUN pip install fastapi uvicorn

# Frontend kopieren
COPY --from=frontend-builder /app/frontend/build ./frontend/build

EXPOSE 8080

# Backend starten und Frontend serven
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8080"]



