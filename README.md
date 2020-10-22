# bedrock-express-churn-prediction
Serving code for churn prediction with bedrock express

Using [Bedrock Express](https://github.com/basisai/bedrock-express), compared to original [churn prediction repo](https://github.com/basisai/churn_prediction) we have the following benefits:

- Image is performance optimised for a specific server and ML framework (see [`bedrock.hcl`](https://github.com/basisai/bedrock-express-churn-prediction/blob/master/bedrock.hcl))
- Prediction logging and metrics tracking are built in, no instrumentation required from user.
- Reduced boilerplate and abstract away web framework and web server (Flask/FastAPI and Gunicorn) (compare [bedrock express serve.py](https://github.com/basisai/bedrock-express-churn-prediction/blob/master/serve.py) and [original](https://github.com/basisai/churn_prediction/blob/master/serve_http.py)
