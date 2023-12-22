import json

class KTPModel:
    def __init__(self, nik, nama, tempatTglLahir, jenisKelamin, golDarah, alamat, rtRw, kelDesa, kecamatan, agama, statusPerkawinan, pekerjaan, kewarganegaraan, berlakuHingga):
        self.nik = nik
        self.nama = nama
        self.tempatTglLahir = tempatTglLahir
        self.jenisKelamin = jenisKelamin
        self.golDarah = golDarah
        self.alamat = alamat
        self.rtRw = rtRw
        self.kelDesa = kelDesa
        self.kecamatan = kecamatan
        self.agama = agama
        self.statusPerkawinan = statusPerkawinan
        self.pekerjaan = pekerjaan
        self.kewarganegaraan = kewarganegaraan
        self.berlakuHingga = berlakuHingga

    def toJson(self):
        return json.dumps(self.__dict__)

    @classmethod
    def fromJson(cls, json_str):
        json_dict = json.loads(json_str)
        return cls(**json_dict)