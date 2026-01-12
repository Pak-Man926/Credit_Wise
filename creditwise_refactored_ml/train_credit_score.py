#!/usr/bin/env python3
"""
Train credit score (risk) model.

Input: Give Me Some Credit dataset (cs-training.csv).
Output: joblib pipeline containing preprocessing + model.
"""
from __future__ import annotations
import argparse, json, datetime
import pandas as pd
import joblib

from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import SGDClassifier

def build_pipeline(feature_cols: list[str]) -> Pipeline:
    preprocessor = ColumnTransformer(
        transformers=[
            ("num", Pipeline([
                ("imputer", SimpleImputer(strategy="median")),
                ("scaler", StandardScaler()),
            ]), feature_cols),
        ],
        remainder="drop",
        verbose_feature_names_out=False,
    )

    model = SGDClassifier(
        loss="log_loss",
        class_weight="balanced",
        max_iter=200,
        tol=1e-3,
        random_state=42,
    )

    return Pipeline([("prep", preprocessor), ("model", model)])

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--train_csv", required=True, help="Path to cs-training.csv")
    ap.add_argument("--out_model", required=True, help="Where to write .joblib artifact")
    ap.add_argument("--out_metadata", required=True, help="Where to write metadata json")
    args = ap.parse_args()

    df = pd.read_csv(args.train_csv)
    y = df["SeriousDlqin2yrs"].astype(int)
    X = df.drop(columns=["SeriousDlqin2yrs"])

    if "Unnamed: 0" in X.columns:
        X = X.drop(columns=["Unnamed: 0"])

    feature_cols = X.columns.tolist()
    pipe = build_pipeline(feature_cols)
    pipe.fit(X, y)

    joblib.dump(pipe, args.out_model)

    metadata = {
        "created_at": datetime.datetime.utcnow().isoformat() + "Z",
        "artifact": args.out_model,
        "target": "SeriousDlqin2yrs",
        "features": feature_cols,
        "output_meaning": "default_risk_probability",
        "note": "This is a risk model; map probability to a simulated score/band in your backend.",
    }
    with open(args.out_metadata, "w") as f:
        json.dump(metadata, f, indent=2)

if __name__ == "__main__":
    main()
