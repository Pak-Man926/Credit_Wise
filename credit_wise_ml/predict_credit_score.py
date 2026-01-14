#!/usr/bin/env python3
"""
Inference helper for credit score (risk) model.

Loads a joblib pipeline, validates inputs, returns probability + simulated score.
"""
from __future__ import annotations
import json, argparse
from typing import Dict, Any
import numpy as np
import pandas as pd
import joblib

def prob_to_score(prob: float, min_score: int = 300, max_score: int = 850) -> int:
    """
    Simple monotonic mapping: higher default risk => lower score.
    You can calibrate this later (e.g., with Platt scaling + percentile mapping).
    """
    prob = float(np.clip(prob, 0.0, 1.0))
    score = max_score - prob * (max_score - min_score)
    return int(round(score))

def score_band(score: int) -> str:
    if score >= 750: return "A"
    if score >= 700: return "B"
    if score >= 650: return "C"
    if score >= 600: return "D"
    return "E"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True, help="Path to credit_score_pipeline.joblib")
    ap.add_argument("--input_json", required=True, help="Path to JSON with input features")
    args = ap.parse_args()

    pipe = joblib.load(args.model)
    with open(args.input_json, "r") as f:
        payload: Dict[str, Any] = json.load(f)

    # Pipeline expects a DataFrame with the exact feature columns used in training.
    X = pd.DataFrame([payload])
    prob = float(pipe.predict_proba(X)[:, 1][0])

    sim_score = prob_to_score(prob)
    out = {
        "default_risk_probability": prob,
        "simulated_score": sim_score,
        "score_band": score_band(sim_score),
    }
    print(json.dumps(out, indent=2))

if __name__ == "__main__":
    main()
