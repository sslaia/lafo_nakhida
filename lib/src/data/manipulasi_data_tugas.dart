import 'package:lafo_nakhida/src/data/lafo_database.dart';
import 'package:lafo_nakhida/src/models/tugas.dart';

class ManipulasiDataTugas {

  Future<Tugas> menyimpanTugas(Tugas tugas) async {
    final db = await LafoDatabase.instance.database;
    final id = await db.insert(tabelTugas, tugas.keJson());
    return tugas.kopi(id: id);
  }

  Future<Tugas> mengambilSatuTugas(int id) async {
    final db = await LafoDatabase.instance.database;
    final maps = await db.query(tabelTugas,
        columns: KolomTugas.nilai,
        where: '${KolomTugas.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Tugas.dariJson(maps.first);
    } else {
      throw Exception('ID $id tak ditemukan!');
    }
  }

  Future<List<Tugas>> mengambilSemuaTugas(int id) async {
    final db = await LafoDatabase.instance.database;

    final urutanNama = '${KolomTugas.nama} ASC';
    final hasil = await db.query(tabelTugas, orderBy: urutanNama);
    return hasil.map((json) => Tugas.dariJson(json)).toList();
  }

  Future<int> updateTugas(Tugas tugas) async {
    final db = await LafoDatabase.instance.database;
    return db.update(
      tabelTugas,
      tugas.keJson(),
      where: '${KolomTugas.id} = ?',
      whereArgs: [tugas.id],
    );
  }

  Future<int> menghapusTugas(int id) async {
    final db = await LafoDatabase.instance.database;

    return db.delete(
      tabelTugas,
      where: '${KolomTugas.id} = ?',
      whereArgs: [id],
    );
  }

}
