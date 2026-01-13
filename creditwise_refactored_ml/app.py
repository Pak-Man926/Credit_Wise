"""
FastAPI model serving skeleton (two endpoints).

Run:
  uvicorn app:app --host 0.0.0.0 --port 8000

Endpoints:
  POST /credit-score
  POST /loan-approval
"""
from __future__ import annotations
from typing import Any, Dict
import numpy as np
import pandas as pd
import joblib
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

CREDIT_MODEL_PATH = "credit_score_pipeline_v1.joblib"
LOAN_MODEL_PATH = "loan_approval_pipeline_v1.joblib"

credit_pipe = joblib.load(CREDIT_MODEL_PATH)
loan_pipe = joblib.load(LOAN_MODEL_PATH)

app = FastAPI(title="CreditWise ML Service", version="1.0")

def prob_to_score(prob: float, min_score: int = 300, max_score: int = 850) -> int:
    prob = float(np.clip(prob, 0.0, 1.0))
    score = max_score - prob * (max_score - min_score)
    return int(round(score))

def score_band(score: int) -> str:
    if score >= 750: return "A"
    if score >= 700: return "B"
    if score >= 650: return "C"
    if score >= 600: return "D"
    return "E"

def approval_band(p: float) -> str:
    if p >= 0.8: return "Very likely"
    if p >= 0.65: return "Likely"
    if p >= 0.5: return "Possible"
    if p >= 0.35: return "Unlikely"
    return "Very unlikely"

class AnyPayload(BaseModel):
    # Keep it flexible for now; enforce strict schema later in Serverpod.
    data: Dict[str, Any]

@app.get("/")
def root():
    return {"status": "ok", "service": "CreditWise ML Service"}


@app.post("/credit-score")
def credit_score(payload: AnyPayload):
    try:
        X = pd.DataFrame([payload.data])
        prob = float(credit_pipe.predict_proba(X)[:, 1][0])
        score = prob_to_score(prob)
        return {
            "default_risk_probability": prob,
            "simulated_score": score,
            "score_band": score_band(score),
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.post("/loan-approval")
def loan_approval(payload: AnyPayload):
    try:
        X = pd.DataFrame([payload.data])
        prob = float(loan_pipe.predict_proba(X)[:, 1][0])
        return {
            "approval_probability": prob,
            "approval_band": approval_band(prob),
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
