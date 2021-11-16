import 'package:lafo_nakhida/src/data/lafo_database.dart';
import 'package:lafo_nakhida/src/models/hak.dart';

class ManipulasiDataHak {

  Future<Hak> menyimpanHak(Hak hak) async {
    final db = await LafoDatabase.instance.database;
    final id = await db.insert(tabelHak, hak.keJson());
    return hak.kopi(id: id);
  }

  Future<Hak> mengambilSatuHak(int id) async {
    final db = await LafoDatabase.instance.database;
    final maps = await db.query(tabelHak,
        columns: KolomHak.nilai,
        where: '${KolomHak.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Hak.dariJson(maps.first);
    } else {
      throw Exception('ID $id tak ditemukan!');
    }
  }

  Future<List<Hak>> mengambilSemuaHak(int id) async {
    final db = await LafoDatabase.instance.database;

    final urutanNama = '${KolomHak.nama} ASC';
    final hasil = await db.query(tabelHak, orderBy: urutanNama);
    return hasil.map((json) => Hak.dariJson(json)).toList();
  }

  Future<int> updateHak(Hak hak) async {
    final db = await LafoDatabase.instance.database;
    return db.update(
      tabelHak,
      hak.keJson(),
      where: '${KolomHak.id} = ?',
      whereArgs: [hak.id],
    );
  }

  Future<int> menghapusHak(int id) async {
    final db = await LafoDatabase.instance.database;

    return db.delete(
      tabelHak,
      where: '${KolomHak.id} = ?',
      whereArgs: [id],
    );
  }

}
