#!/usr/bin/env python3
"""
Inference helper for loan approval model.

Loads a joblib pipeline, returns approval probability + decision band.
"""
from __future__ import annotations
import json, argparse
from typing import Dict, Any
import numpy as np
import pandas as pd
import joblib

def approval_band(p: float) -> str:
    if p >= 0.8: return "Very likely"
    if p >= 0.65: return "Likely"
    if p >= 0.5: return "Possible"
    if p >= 0.35: return "Unlikely"
    return "Very unlikely"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--model", required=True, help="Path to loan_approval_pipeline.joblib")
    ap.add_argument("--input_json", required=True, help="Path to JSON with input features")
    args = ap.parse_args()

    pipe = joblib.load(args.model)
    with open(args.input_json, "r") as f:
        payload: Dict[str, Any] = json.load(f)

    X = pd.DataFrame([payload])
    prob = float(pipe.predict_proba(X)[:, 1][0])

    out = {
        "approval_probability": prob,
        "approval_band": approval_band(prob),
    }
    print(json.dumps(out, indent=2))

if __name__ == "__main__":
    main()
