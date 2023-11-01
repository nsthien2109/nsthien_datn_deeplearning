from flask import Flask, request, jsonify
from keras.models import load_model
from PIL import Image
import requests
from io import BytesIO
import numpy as np
from shared.utils.bird_class import bird_classes

app = Flask(__name__)
model = None


def load_custom_model():
    global model
    model = load_model("./Mobinet.h5")


def prepare_image(url):
    response = requests.get(url)
    img = Image.open(BytesIO(response.content))
    img = img.resize((224, 224))
    img_array = np.array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array = img_array / 255.0
    return img_array


@app.route("/")
def hello_world():
    return "<p>API for prediction bird !</p>"


@app.route("/predict", methods=["POST"])
def predict():
    global model

    if model is None:
        load_custom_model()

    data = request.get_json()
    url = data["url"]
    try:
        image = prepare_image(url)
        prediction = model.predict(image)
        predicted_class = np.argmax(prediction, axis=1)
        confidence = round(100 * prediction[0][predicted_class[0]], 2)

        response = {
            "predicted_class": int(predicted_class[0] + 1),
            "confidence": confidence,
            "class_name": bird_classes[predicted_class[0]],
        }
        return jsonify(response)
    except Exception as e:
        return jsonify(error=str(e))


if __name__ == "__main__":
    app.run(debug=True)
