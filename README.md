# bedrock-express-churn-prediction
Serving code for churn prediction with bedrock express

Using [Bedrock Express](https://github.com/basisai/bedrock-express), compared to original [churn prediction repo](https://github.com/basisai/churn_prediction) we have the following benefits:

- Image is performance optimised for a specific server and ML framework (see [`bedrock.hcl`](https://github.com/basisai/bedrock-express-churn-prediction/blob/master/bedrock.hcl))
- Prediction logging and metrics tracking are built in, no instrumentation required from user.
- Reduced boilerplate and abstract away web framework and web server (Flask/FastAPI and Gunicorn) (compare [bedrock express serve.py](https://github.com/basisai/bedrock-express-churn-prediction/blob/master/serve.py) and [original](https://github.com/basisai/churn_prediction/blob/master/serve_http.py)

# Test your server
```
curl -X POST \
  <MODEL_ENDPOINT_URL> \
  -H 'Content-Type: application/json' \
  -H 'X-Bedrock-Api-Token: <MODEL_ENDPOINT_TOKEN>' \
  -d '{"State": "ME", "Area_Code": 408, "Intl_Plan": 1, "VMail_Plan": 1, "VMail_Message": 21, "CustServ_Calls": 4, "Day_Mins": 156.5, "Day_Calls": 122, "Eve_Mins": 209.2, "Eve_Calls": 125, "Night_Mins": 158.7, "Night_Calls": 81, "Intl_Mins": 11.1, "Intl_Calls": 3}'
```
