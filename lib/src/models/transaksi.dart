import 'package:lafo_nakhida/src/models/makanan.dart';
import 'package:lafo_nakhida/src/models/pengguna.dart';

final String tabelTransaksi = 'transaksi';

class KolomTransaksi {
  static final List<String> nilai = [
    id,
    waktu,
    pengguna,
    makanan,
    jumlah,
    keanggotaan,
    total
  ];

  static final String id = '_id';
  static final String waktu = 'waktu';
  static final String pengguna = 'pengguna';
  static final String makanan = 'makanan';
  static final String jumlah = 'jumlah';
  static final String keanggotaan = 'keanggotaan';
  static final String total = 'total';
}

class Transaksi {
  final int? id;
  final DateTime waktu;
  final List<Pengguna> pengguna;
  final List<Makanan> makanan;
  final int jumlah;
  final bool keanggotaan;
  final double total;

  const Transaksi(
      {this.id,
      required this.waktu,
      required this.pengguna,
      required this.makanan,
      required this.jumlah,
      required this.keanggotaan,
      required this.total});

  static Transaksi dariJson(Map<String, Object?> json) => Transaksi(
        id: json[KolomTransaksi.id] as int?,
        waktu: DateTime.parse(json[KolomTransaksi.waktu] as String),
        pengguna: json[KolomTransaksi.pengguna] as List<Pengguna>,
        makanan: json[KolomTransaksi.makanan] as List<Makanan>,
        jumlah: json[KolomTransaksi.jumlah] as int,
        keanggotaan: json[KolomTransaksi.keanggotaan] == 1,
        total: double.parse(json[KolomTransaksi.total] as String),
      );

  Map<String, Object?> keJson() => {
        KolomTransaksi.id: id,
        KolomTransaksi.waktu: waktu.toIso8601String(),
        KolomTransaksi.pengguna: pengguna,
        KolomTransaksi.makanan: makanan,
        KolomTransaksi.jumlah: jumlah,
        KolomTransaksi.keanggotaan: keanggotaan ? 1 : 0,
        KolomTransaksi.total: total.toString()
      };

  Transaksi kopi(
          {int? id,
          DateTime? waktu,
          List<Pengguna>? pengguna,
          List<Makanan>? makanan,
          int? jumlah,
          bool? keanggotaan,
          double? total}) =>
      Transaksi(
          id: id ?? this.id,
          waktu: waktu ?? this.waktu,
          pengguna: pengguna ?? this.pengguna,
          makanan: makanan ?? this.makanan,
          jumlah: jumlah ?? this.jumlah,
          keanggotaan: keanggotaan ?? this.keanggotaan,
          total: total ?? this.total);
}
