# Refactored ML (CreditWise)

This folder contains **production-style** training & inference code for:
- Credit score simulation (actually a default-risk probability model)
- Loan approval likelihood

## Files
- `credit_score_pipeline_v1.joblib` — preprocessing + model artifact
- `loan_approval_pipeline_v1.joblib` — preprocessing + model artifact
- `train_credit_score.py` / `predict_credit_score.py`
- `train_loan_approval.py` / `predict_loan_approval.py`
- `app.py` — FastAPI skeleton exposing two endpoints
- `MODEL_METADATA_v1.json` — feature lists + notes

## How Serverpod should use this
1) Serverpod validates & normalizes user "preferences" into a JSON payload.
2) Serverpod calls ML service:
   - POST `/credit-score` with `{ "data": {...features...} }`
   - POST `/loan-approval` with `{ "data": {...features...} }`
3) Serverpod maps results to your Flutter UI models.

## Notes
- The credit model outputs **default risk probability**. The simulated score/band is a simple monotonic mapping.
- Do not present loan approval as guaranteed. Use "Estimated likelihood" wording in the UI.
