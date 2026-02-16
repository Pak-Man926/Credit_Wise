#!/usr/bin/env python3
"""
Train loan approval model.

Input: loan_prediction.csv
Output: joblib pipeline containing preprocessing + model.
"""
from __future__ import annotations
import argparse, json, datetime
import pandas as pd
import joblib

from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.linear_model import LogisticRegression

def build_pipeline(num_cols: list[str], cat_cols: list[str]) -> Pipeline:
    preprocessor = ColumnTransformer(
        transformers=[
            ("num", Pipeline([
                ("imputer", SimpleImputer(strategy="median")),
                ("scaler", StandardScaler()),
            ]), num_cols),
            ("cat", Pipeline([
                ("imputer", SimpleImputer(strategy="most_frequent")),
                ("onehot", OneHotEncoder(handle_unknown="ignore")),
            ]), cat_cols),
        ],
        remainder="drop",
        verbose_feature_names_out=False,
    )

    model = LogisticRegression(max_iter=4000, class_weight="balanced")
    return Pipeline([("prep", preprocessor), ("model", model)])

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--train_csv", required=True, help="Path to loan_prediction.csv")
    ap.add_argument("--out_model", required=True, help="Where to write .joblib artifact")
    ap.add_argument("--out_metadata", required=True, help="Where to write metadata json")
    args = ap.parse_args()

    df = pd.read_csv(args.train_csv)
    y = (df["Loan_Status"] == "Y").astype(int)
    X = df.drop(columns=["Loan_Status"])

    # Drop pure identifier columns
    if "Loan_ID" in X.columns:
        X = X.drop(columns=["Loan_ID"])

    cat_cols = X.select_dtypes(include=["object"]).columns.tolist()
    num_cols = X.select_dtypes(exclude=["object"]).columns.tolist()

    pipe = build_pipeline(num_cols, cat_cols)
    pipe.fit(X, y)

    joblib.dump(pipe, args.out_model)

    metadata = {
        "created_at": datetime.datetime.utcnow().isoformat() + "Z",
        "artifact": args.out_model,
        "target": "Loan_Status(Y=1)",
        "numeric_features": num_cols,
        "categorical_features": cat_cols,
        "output_meaning": "approval_probability",
        "note": "This estimates approval likelihood; don't present as guaranteed approval.",
    }
    with open(args.out_metadata, "w") as f:
        json.dump(metadata, f, indent=2)

if __name__ == "__main__":
    main()
