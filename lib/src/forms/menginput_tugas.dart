import 'package:flutter/material.dart';

class MenginputTugas extends StatefulWidget {
  const MenginputTugas({Key? key}) : super(key: key);

  static const routeName = '/tugas';

  @override
  _MenginputTugasState createState() => _MenginputTugasState();
}

class _MenginputTugasState extends State<MenginputTugas> {
  final _tugasKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _hakController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    _hakController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memasukkan data tugas baru'),
      ),
      body: Form(
        key: _tugasKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan tugas';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama tugas baru",
                  labelText: "Tugas",
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
                    return 'Masukkan deskripsi';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nomor tugas baru",
                  labelText: "Nomor",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO Ganti kode berikut dengan DropdownMenu Hak
              TextFormField(
                controller: _deskripsiController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih hak yang sesuai';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Hak tugas ini",
                  labelText: "Hak",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _tugasKey.currentState;
                  if (_tugasKey.currentState!.validate()) {
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
