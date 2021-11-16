import 'package:flutter/material.dart';

class MenginputHak extends StatefulWidget {
  const MenginputHak({Key? key}) : super(key: key);

  static const routeName = '/hak';

  @override
  _MenginputHakState createState() => _MenginputHakState();
}

class _MenginputHakState extends State<MenginputHak> {
  final _hakKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memasukkan data hak baru'),
      ),
      body: Form(
        key: _hakKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama hak';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama hak baru",
                  labelText: "Hak",
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
                    return 'Masukkan deskripsi hak';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Deskripsi hak",
                  labelText: "Deskripsi",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _hakKey.currentState;
                  if (_hakKey.currentState!.validate()) {
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
