import 'package:lafo_nakhida/src/data/lafo_database.dart';
import 'package:lafo_nakhida/src/models/pengguna.dart';

class ManipulasiDataPengguna {

  Future<Pengguna> menyimpanPengguna(Pengguna pengguna) async {
    final db = await LafoDatabase.instance.database;
    final id = await db.insert(tabelPengguna, pengguna.keJson());
    return pengguna.kopi(id: id);
  }

  Future<Pengguna> mengambilSatuPengguna(int id) async {
    final db = await LafoDatabase.instance.database;
    final maps = await db.query(tabelPengguna,
        columns: KolomPengguna.nilai,
        where: '${KolomPengguna.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Pengguna.dariJson(maps.first);
    } else {
      throw Exception('ID $id tak ditemukan!');
    }
  }

  Future<List<Pengguna>> mengambilSemuaPengguna(int id) async {
    final db = await LafoDatabase.instance.database;

    final urutanNama = '${KolomPengguna.nama} ASC';
    final hasil = await db.query(tabelPengguna, orderBy: urutanNama);
    return hasil.map((json) => Pengguna.dariJson(json)).toList();
  }

  Future<int> updatePengguna(Pengguna pengguna) async {
    final db = await LafoDatabase.instance.database;
    return db.update(
      tabelPengguna,
      pengguna.keJson(),
      where: '${KolomPengguna.id} = ?',
      whereArgs: [pengguna.id],
    );
  }

  Future<int> menghapusPengguna(int id) async {
    final db = await LafoDatabase.instance.database;

    return db.delete(
      tabelPengguna,
      where: '${KolomPengguna.id} = ?',
      whereArgs: [id],
    );
  }

}
