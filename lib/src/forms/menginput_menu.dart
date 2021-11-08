import 'package:flutter/material.dart';

class MenginputMenu extends StatefulWidget {
  const MenginputMenu({Key? key}) : super(key: key);

  static const routeName = '/menu';

  @override
  _MenginputMenuState createState() => _MenginputMenuState();
}

class _MenginputMenuState extends State<MenginputMenu> {
  final _menuKey = GlobalKey<FormState>();

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
        title: const Text('Memasukkan data menu baru'),
      ),
      body: Form(
        key: _menuKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextFormField(
                controller: namaController,
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
                controller: nomorController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan harga item';
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
                  final form = _menuKey.currentState;
                  if (_menuKey.currentState!.validate()) {
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
