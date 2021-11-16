// tugas
import 'hak.dart';

final String tabelTugas = 'tugas';

class KolomTugas {
  static final List<String> nilai = [
    id,
    nama,
    deskripsi,
    hak,
    direkam,
    dibaharui
  ];
  static final String id = '_id';
  static final String nama = 'nama';
  static final String deskripsi = 'deskripsi';
  static final String hak = 'hak';
  static final String direkam = 'direkam';
  static final String dibaharui = 'dibaharui';
}

class Tugas {
  final int? id;
  final String nama;
  final String deskripsi;
  final List<Hak> hak;
  final DateTime direkam;
  final DateTime? dibaharui;

  const Tugas(
      {this.id,
      required this.nama,
      required this.deskripsi,
      required this.hak,
      required this.direkam,
      this.dibaharui});

  static Tugas dariJson(Map<String, Object?> json) => Tugas(
        id: json[KolomTugas.id] as int?,
        nama: json[KolomTugas.nama] as String,
        deskripsi: json[KolomTugas.deskripsi] as String,
        hak: json[KolomTugas.hak] as List<Hak>,
        direkam: DateTime.parse(json[KolomTugas.direkam] as String),
        dibaharui: DateTime.parse(json[KolomTugas.dibaharui] as String),
      );

  Map<String, Object?> keJson() => {
        KolomTugas.id: id,
        KolomTugas.nama: nama,
        KolomTugas.deskripsi: deskripsi,
        KolomTugas.hak: hak,
        KolomTugas.direkam: direkam.toIso8601String(),
        KolomTugas.dibaharui: dibaharui?.toIso8601String()
      };

  Tugas kopi(
      {int? id,
        String? nama,
        String? deskripsi,
        List<Hak>? hak,
        DateTime? direkam,
        DateTime? dibaharui,}) =>
      Tugas(
          id: id ?? this.id,
          nama: nama ?? this.nama,
          deskripsi: deskripsi ?? this.deskripsi,
          hak: hak ?? this.hak,
          direkam: direkam ?? this.direkam,
          dibaharui: dibaharui ?? this.dibaharui);



}
