from flask import Flask, render_template, request, jsonify, json
from ktp_ocr import perform_ocr

import ktp_ocr

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/result', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'})

    file = request.files['file']

    if file.filename == '':
        return jsonify({'error': 'No selected file'})

    if file:
        # Perform OCR using ktp_ocr module
        ktp_model = ktp_ocr.main(file)

        json_content = json.loads(ktp_model.toJson())

    python2json = json.dumps(json_content)
    return app.response_class(python2json, content_type='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)