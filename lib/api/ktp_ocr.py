import re
import cv2
import pytesseract
import numpy as np

from ktp_model import KTPModel

# Set path to Tesseract OCR executable (update path sesuai dengan instalasi Anda)
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

def perform_ocr(file):
    # Read the image using OpenCV
    image = cv2.imdecode(np.fromstring(file.read(), np.uint8), cv2.IMREAD_COLOR)

    # Convert the image to grayscale
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Apply thresholding to the grayscale image
    _, thresholded_image = cv2.threshold(gray_image, thresh=130, maxval=255, type=cv2.THRESH_TRUNC)

    # Perform OCR using Tesseract on the thresholded image
    result = pytesseract.image_to_string(thresholded_image, lang="ind")

    return result

def main(image):
    result = perform_ocr(image)
    print("OCR Result:")
    print(result)

    # Initialize fields
    nik = ""
    nama = ""
    tempatTglLahir = ""
    jenisKelamin = ""
    golDarah = ""
    alamat = ""
    rtRw = ""
    kelDesa = ""
    kecamatan = ""
    agama = ""
    statusPerkawinan = ""
    pekerjaan = ""
    kewarganegaraan = ""
    berlakuHingga = ""

    # Extract information based on patterns in OCR result
    nik_match = re.search(r"NIK : (.+)", result) or re.search(r"NIK — : (.+)", result)
    if nik_match:
        nik = nik_match.group(1)

    nama_match = re.search(r"Nama - (.+)", result) or re.search(r"Nama : (.+)", result)
    if nama_match:
        nama = nama_match.group(1)

    ttl_match = re.search(r"TemparTgiLahir - (.+)", result) or re.search(r"TempatTgi Lahir (.+)", result)
    if ttl_match:
        tempatTglLahir = ttl_match.group(1).strip()

    jk_match = re.search(r"Jenis kelamin :(.+?)\s*Gol\. Darah", result) or re.search(r"Jenis kelamun :(.+?)\s*Gol\b", result)
    if jk_match:
        jenisKelamin = jk_match.group(1).strip()
    
    gd_match = re.search(r"Gol\. Darah :(.+)", result) or re.search(r"Gol. Darah '(.+)", result)
    if gd_match:
        golDarah = gd_match.group(1).strip()

    alamat_match = re.search(r"Alamat : (.+)", result)
    if alamat_match:
        alamat = alamat_match.group(1).strip()

    rtrw_match = re.search(r"RT/RW : (.+)", result)
    if rtrw_match:
        rtRw = rtrw_match.group(1).strip()

    kel_desa_match = re.search(r"Kel/Desa - (.+)", result) or re.search(r"KeWWesa : (.+)", result)
    if kel_desa_match:
        kelDesa = kel_desa_match.group(1).strip()

    kecamatan_match = re.search(r"Kecamatan . (.+)", result) or re.search(r"Kecamatan — :(.+)", result)
    if kecamatan_match:
        kecamatan = kecamatan_match.group(1).strip()

    agama_match = re.search(r"Agama : (.+)", result) or re.search(r"Agama “ (.+)", result)
    if agama_match:
        agama = agama_match.group(1).strip()

    status_kawin_match = re.search(r"Status Perkawinan: (.+)", result) or re.search(r"Status Perkawman . (.+)", result)
    if status_kawin_match:
        statusPerkawinan = status_kawin_match.group(1).strip()

    pekerjaan_match = re.search(r"Pekerjaan (.+)", result) or re.search(r"Pekerjaan : (.+)", result)
    if pekerjaan_match:
        pekerjaan = pekerjaan_match.group(1).strip()

    kewarganegaraan_match = re.search(r"Kewarganegaraan: (.+)", result) or re.search(r"Kewarganegaraan . (.+)", result)
    if kewarganegaraan_match:
        kewarganegaraan = kewarganegaraan_match.group(1).strip()

    berlaku_hingga_match = re.search(r"Berlaku Hingga (.+)", result) or re.search(r"Berlaku Hingga : (.+)", result)
    if berlaku_hingga_match:
        berlakuHingga = berlaku_hingga_match.group(1).strip()

    return KTPModel(nik, nama, tempatTglLahir, jenisKelamin, golDarah, alamat, rtRw, kelDesa, kecamatan, agama, statusPerkawinan, pekerjaan, kewarganegaraan, berlakuHingga)