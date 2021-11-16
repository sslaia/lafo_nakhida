import 'package:lafo_nakhida/src/data/lafo_database.dart';
import 'package:lafo_nakhida/src/models/transaksi.dart';

class ManipulasiDataTransaksi {
  Future<Transaksi> menyimpanTransaksi(Transaksi transaksi) async {
    final db = await LafoDatabase.instance.database;
    final id = await db.insert(tabelTransaksi, transaksi.keJson());
    return transaksi.kopi(id: id);
  }

  Future<Transaksi> mengambilSatuTransaksi(int id) async {
    final db = await LafoDatabase.instance.database;
    final maps = await db.query(tabelTransaksi,
        columns: KolomTransaksi.nilai,
        where: '${KolomTransaksi.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Transaksi.dariJson(maps.first);
    } else {
      throw Exception('ID $id tak ditemukan!');
    }
  }

  Future<List<Transaksi>> mengambilSemuaTransaksi(int id) async {
    final db = await LafoDatabase.instance.database;

    final urutanWaktu = '${KolomTransaksi.waktu} ASC';
    final hasil = await db.query(tabelTransaksi, orderBy: urutanWaktu);
    return hasil.map((json) => Transaksi.dariJson(json)).toList();
  }

  Future<int> updateTransaksi(Transaksi transaksi) async {
    final db = await LafoDatabase.instance.database;
    return db.update(
      tabelTransaksi,
      transaksi.keJson(),
      where: '${KolomTransaksi.id} = ?',
      whereArgs: [transaksi.id],
    );
  }

  Future<int> menghapusTransaksi(int id) async {
    final db = await LafoDatabase.instance.database;

    return db.delete(
      tabelTransaksi,
      where: '${KolomTransaksi.id} = ?',
      whereArgs: [id],
    );
  }

}
