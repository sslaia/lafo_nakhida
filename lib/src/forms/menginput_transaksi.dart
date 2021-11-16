import 'package:flutter/material.dart';

class MenginputTransaksi extends StatefulWidget {
  const MenginputTransaksi({Key? key}) : super(key: key);

  static const routeName = '/transaksi';

  @override
  _MenginputTransaksiState createState() => _MenginputTransaksiState();
}

class _MenginputTransaksiState extends State<MenginputTransaksi> {
  final _transaksiKey = GlobalKey<FormState>();

  final _penggunaController = TextEditingController();
  final _makananController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _keanggotaanController = TextEditingController();
  final _totalController = TextEditingController();

  @override
  void dispose() {
    _penggunaController.dispose();
    _makananController.dispose();
    _jumlahController.dispose();
    _keanggotaanController.dispose();
    _totalController.dispose();
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
              // TODO Ganti form berikut dengan DropdownMenu Pengguna
              TextFormField(
                controller: _penggunaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama pengguna",
                  labelText: "Pengguna",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO Ganti form berikut dengan DropdownMenu Makanan
              TextFormField(
                controller: _makananController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama item makanan';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama item makanan",
                  labelText: "Makanan",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO Sesuaikan form berikut untuk default 1
              TextFormField(
                controller: _jumlahController,
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
              // TODO Sesuaikan form berikut untuk checkbox
              // Tidak perlu validasi. Default adalah False
              TextFormField(
                controller: _keanggotaanController,
                decoration: InputDecoration(
                  hintText: "Pelanggan ini anggota?",
                  labelText: "Keanggotaan",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO: Sesuaikan form ini untuk perkalian jumlah dan harga
              // TODO: Buat supaya harga total otomatis ditampilkan/tidak diisi
              TextFormField(
                controller: _totalController,
                decoration: InputDecoration(
                  hintText: "Jumlah total harga",
                  labelText: "Harga total",
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
                    // TODO 1. Mencatat waktu input data
                    // TODO 2. Menyimpan data baru ke database
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
