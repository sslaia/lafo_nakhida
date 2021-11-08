import 'package:flutter/material.dart';

class MenginputAnggota extends StatefulWidget {
  const MenginputAnggota({Key? key}) : super(key: key);

  static const routeName = '/anggota';

  @override
  _MenginputAnggotaState createState() => _MenginputAnggotaState();
}

class _MenginputAnggotaState extends State<MenginputAnggota> {
  final _anggotaKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final nomorController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    nomorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memasukkan data anggota baru'),
      ),
      body: Form(
        key: _anggotaKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama lengkap anggota';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama anggota baru",
                  labelText: "Nama",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: nomorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nomor anggota';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nomor anggota baru",
                  labelText: "Nomor",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _anggotaKey.currentState;
                  if (_anggotaKey.currentState!.validate()) {
                    form?.save();
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
