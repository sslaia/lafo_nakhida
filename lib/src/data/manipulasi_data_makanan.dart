import 'package:lafo_nakhida/src/data/lafo_database.dart';
import 'package:lafo_nakhida/src/models/makanan.dart';

class ManipulasiDataMakanan {
  
Future<Makanan> menyimpanMakanan(Makanan makanan) async {
  final db = await LafoDatabase.instance.database;
  final id = await db.insert(tabelMakanan, makanan.keJson());
  return makanan.kopi(id: id);
}

Future<Makanan> mengambilSatuMakanan(int id) async {
  final db = await LafoDatabase.instance.database;
  final maps = await db.query(tabelMakanan,
      columns: KolomMakanan.nilai,
      where: '${KolomMakanan.id} = ?',
      whereArgs: [id]);

  if (maps.isNotEmpty) {
    return Makanan.dariJson(maps.first);
  } else {
    throw Exception('ID $id tak ditemukan!');
  }
}

Future<List<Makanan>> mengambilSemuaMakanan(int id) async {
  final db = await LafoDatabase.instance.database;

  final urutanMakanan = '${KolomMakanan.nama} ASC';
  final hasil = await db.query(tabelMakanan, orderBy: urutanMakanan);
  return hasil.map((json) => Makanan.dariJson(json)).toList();
}

Future<int> updateMakanan(Makanan makanan) async {
  final db = await LafoDatabase.instance.database;
  return db.update(
    tabelMakanan,
    makanan.keJson(),
    where: '${KolomMakanan.id} = ?',
    whereArgs: [makanan.id],
  );
}

Future<int> menghapusMakanan(int id) async {
  final db = await LafoDatabase.instance.database;

  return db.delete(
    tabelMakanan,
    where: '${KolomMakanan.id} = ?',
    whereArgs: [id],
  );
}

}
