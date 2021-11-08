import 'package:flutter/material.dart';

class MenginputTransaksi extends StatefulWidget {
  const MenginputTransaksi({Key? key}) : super(key: key);

  static const routeName = '/transaksi';

  @override
  _MenginputTransaksiState createState() => _MenginputTransaksiState();
}

class _MenginputTransaksiState extends State<MenginputTransaksi> {
  final _transaksiKey = GlobalKey<FormState>();

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
        title: const Text('Memasukkan data transaksi baru'),
      ),
      body: Form(
        key: _transaksiKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama kasir';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama kasir",
                  labelText: "Kasir",
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
                    return 'Masukkan nama item makanan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama item makanan",
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
                    return 'Masukkan jumlah item';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Jumlah item",
                  labelText: "Jumlah",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _transaksiKey.currentState;
                  if (_transaksiKey.currentState!.validate()) {
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
