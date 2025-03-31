from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

app = FastAPI()

# React-Frontend statisch einbinden
app.mount("/", StaticFiles(directory="../frontend/build", html=True), name="frontend")

# CORS Middleware aktivieren (optional für API-Kommunikation später)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api")
def api_root():
    return {"message": "AI-Sekretariat API einsatzbereit!"}




