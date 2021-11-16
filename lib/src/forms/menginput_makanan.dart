import 'package:flutter/material.dart';

class MenginputMakanan extends StatefulWidget {
  const MenginputMakanan({Key? key}) : super(key: key);

  static const routeName = '/makanan';

  @override
  _MenginputMakananState createState() => _MenginputMakananState();
}

class _MenginputMakananState extends State<MenginputMakanan> {
  final _makananKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _gambarController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _gambarController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memasukkan data makanan baru'),
      ),
      body: Form(
        key: _makananKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama item makanan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama item makanan baru",
                  labelText: "Nama",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _deskripsiController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan deskripsi item makanan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Deskripsi item makanan",
                  labelText: "Deskripsi",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _gambarController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan alamat url foto';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Alamat url foto",
                  labelText: "Alamat url",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _hargaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan harga item makanan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Harga item makanan",
                  labelText: "Harga",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _makananKey.currentState;
                  if (_makananKey.currentState!.validate()) {
                    form?.save();
                    // TODO 1. Mencatat waktu input data
                    // TODO 2. Mencatat waktu dibaharui kalau ada
                    // TODO 3. Menyimpan data baru ke database
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data telah disimpan!'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
