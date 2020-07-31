"""
Script for serving.
"""
import json
import pickle

import numpy as np

from constants import AREA_CODES, STATES, SUBSCRIBER_FEATURES

OUTPUT_MODEL_NAME = "/artefact/lgb_model.pkl"


def pre_process(http_body, files=None):
    """Predict churn probability given subscriber_features.
    Args:
        subscriber_features (dict)
        model
    Returns:
        churn_prob (float): churn probability
    """
    subscriber_features = json.loads(http_body)
    row_feats = list()
    for col in SUBSCRIBER_FEATURES:
        row_feats.append(subscriber_features[col])

    for area_code in AREA_CODES:
        if subscriber_features["Area_Code"] == area_code:
            row_feats.append(1)
        else:
            row_feats.append(0)

    for state in STATES:
        if subscriber_features["State"] == state:
            row_feats.append(1)
        else:
            row_feats.append(0)

    return np.array(row_feats).reshape(1, -1)


class Model:
    def __init__(self):
        with open(OUTPUT_MODEL_NAME, "rb") as f:
            self.model = pickle.load(f)

    def predict(self, features):
        return self.model.predict_proba(features)[:, 1].item()
