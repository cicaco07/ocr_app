import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  File? _image;
  String _result = "";

  Future<void> _uploadImage() async {
    if (_image == null) {
      return Future.value(); // Added return statement here
    }

    String apiUrl = "http://192.168.209.85:5000/result";
    var uri = Uri.parse(apiUrl);

    var request = http.MultipartRequest("POST", uri);
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var result = json.decode(responseBody);

        setState(() {
          _result = jsonEncode(result);
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hasil OCR"),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildField("NIK", result['nik']),
                    buildField("Nama", result['nama']),
                    buildField("Tempat/Tgl Lahir", result['tempatTglLahir']),
                    buildField("Jenis Kelamin", result['jenisKelamin']),
                    buildField("Gol. Darah", result['golDarah']),
                    buildField("Alamat", result['alamat']),
                    buildField("RT/RW", result['rtRw']),
                    buildField("Kel/Desa", result['kelDesa']),
                    buildField("Kecamatan", result['kecamatan']),
                    buildField("Agama", result['agama']),
                    buildField("Status Perkawinan", result['statusPerkawinan']),
                    buildField("Pekerjaan", result['pekerjaan']),
                    buildField("Kewarganegaraan", result['kewarganegaraan']),
                    buildField("Berlaku Hingga", result['berlakuHingga']),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (error) {
      print("Error: $error");
    }

    // Add the following return statement to address the warning
    return Future.value();
  }

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
          children: [
            TextSpan(
              text: "$label: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KTP OCR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Text("Pilih gambar KTP terlebih dahulu")
                : Image.file(_image!),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _image == null
                ? null
                : () async {
                    await _uploadImage();
                  },
            tooltip: 'Unggah dan Proses OCR',
            child: const Icon(Icons.upload),
            backgroundColor: _image == null ? Colors.grey : null,
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _getImage,
            tooltip: 'Pilih Gambar KTP',
            child: Icon(LineIcons.plus),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
