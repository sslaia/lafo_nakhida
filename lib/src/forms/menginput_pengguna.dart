import 'package:flutter/material.dart';

class MenginputPengguna extends StatefulWidget {
  const MenginputPengguna({Key? key}) : super(key: key);

  static const routeName = '/pengguna';

  @override
  _MenginputPenggunaState createState() => _MenginputPenggunaState();
}

class _MenginputPenggunaState extends State<MenginputPengguna> {
  final _penggunaKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _tugasController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _telefonController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _tugasController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memasukkan data pengguna baru'),
      ),
      body: Form(
        key: _penggunaKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama lengkap pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nama pengguna baru",
                  labelText: "Nama",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO Mengubah form berikut ke DropdownMenu Tugas
              TextFormField(
                controller: _tugasController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan tugas pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Tugas pengguna baru",
                  labelText: "Tugas",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan email pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Alamat email pengguna",
                  labelText: "Email",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              // TODO Menyesuaikan tempat isian ini untuk password
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan password pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password pengguna baru",
                  labelText: "Password",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _telefonController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nomor telefon pengguna';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Nomor telefon pengguna baru",
                  labelText: "Telefon",
                  hintStyle: const TextStyle(color: Colors.black26),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  final form = _penggunaKey.currentState;
                  if (_penggunaKey.currentState!.validate()) {
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
