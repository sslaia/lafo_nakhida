import 'dart:async';
import 'dart:io';
import 'package:lafo_nakhida/src/models/hak.dart';
import 'package:lafo_nakhida/src/models/makanan.dart';
import 'package:lafo_nakhida/src/models/pengguna.dart';
import 'package:lafo_nakhida/src/models/transaksi.dart';
import 'package:lafo_nakhida/src/models/tugas.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class LafoDatabase {
  static final LafoDatabase instance = LafoDatabase._init();

  static Database? _database;

  LafoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _inisialisasiDatabase();
    return _database!;
  }

  final _namaDatabase = 'lafo_db.sql';
  final _versiDatabase = 1;

  _inisialisasiDatabase() async {
    Directory pathDokumen = await getApplicationDocumentsDirectory();
    String pathDatabase = join(pathDokumen.path + _namaDatabase);

    return await openDatabase(pathDatabase,
        version: _versiDatabase, onCreate: membuatTabel);
  }

  // tabel berikut hanya dijalankan pada saat pertama sekali menjalankan aplikasi
  Future membuatTabel(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    // kolom anggota adalah integer 0 atau 1 (bool)
    // kolom namaPengguna adalah daftar: Pengguna pengguna
    await db.execute('''
    CREATE TABLE $tabelTransaksi (
       ${KolomTransaksi.id} $idType,
       ${KolomTransaksi.waktu} $textType,
       ${KolomTransaksi.pengguna} $textType,
       ${KolomTransaksi.makanan} $textType,
       ${KolomTransaksi.jumlah} $integerType,
       ${KolomTransaksi.keanggotaan} $boolType,
       ${KolomTransaksi.total} $textType,
    )
    ''');

    await db.execute('''
    CREATE TABLE $tabelMakanan (
       ${KolomMakanan.id} $idType,
       ${KolomMakanan.nama} $textType,
       ${KolomMakanan.deskripsi} $textType,
       ${KolomMakanan.gambar} $textType,
       ${KolomMakanan.harga} $textType,
       ${KolomMakanan.direkam} $textType,
       ${KolomMakanan.dibaharui} $textType,
    )
    ''');

    // kolom tugas adalah daftar: Tugas tugas
    await db.execute('''
    CREATE TABLE $tabelPengguna (
       ${KolomPengguna.id} $idType,
       ${KolomPengguna.nama} $textType,
       ${KolomPengguna.tugas} $textType,
       ${KolomPengguna.email} $textType,
       ${KolomPengguna.telefon} $textType,
       ${KolomPengguna.direkam} $textType,
       ${KolomPengguna.dibaharui} $textType,
    )
    ''');

    // tabel ini memuat tugas: admin, kasir,
    await db.execute('''
    CREATE TABLE $tabelTugas (
       ${KolomTugas.id} $idType,
       ${KolomTugas.nama} $textType,
       ${KolomTugas.deskripsi} $textType,
       ${KolomTugas.hak} $textType,
       ${KolomTugas.direkam} $textType,
       ${KolomTugas.dibaharui} $textType,
    )
    ''');

    // nilai dari anggota dalam tabel ini adalah integer 0 atau 1 (bool)
    await db.execute('''
    CREATE TABLE $tabelHak (
       ${KolomHak.id} $idType,
       ${KolomHak.nama} $textType,
       ${KolomHak.deskripsi} $textType,
       ${KolomHak.direkam} $textType,
       ${KolomHak.dibaharui} $textType
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
