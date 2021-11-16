// permission levels

final String tabelHak = 'hak';

class KolomHak {
  static final List<String> nilai = [id, nama, deskripsi, direkam, dibaharui];
  static final String id = '_id';
  static final String nama = 'nama';
  static final String deskripsi = 'deskripsi';
  static final String direkam = 'direkam';
  static final String dibaharui = 'dibaharui';
}

class Hak {
  final int? id;
  final String nama;
  final String deskripsi;
  final DateTime direkam;
  final DateTime? dibaharui;

  const Hak(
      {this.id,
      required this.nama,
      required this.deskripsi,
      required this.direkam,
      this.dibaharui});

  static Hak dariJson(Map<String, Object?> json) => Hak(
      id: json[KolomHak.id] as int,
      nama: json[KolomHak.nama] as String,
      deskripsi: json[KolomHak.deskripsi] as String,
      direkam: DateTime.parse(json[KolomHak.direkam] as String),
      dibaharui: DateTime.parse(json[KolomHak.dibaharui] as String));

  Map<String, Object?> keJson() => {
        KolomHak.id: id,
        KolomHak.nama: nama,
        KolomHak.deskripsi: deskripsi,
        KolomHak.direkam: direkam.toIso8601String(),
        KolomHak.dibaharui: dibaharui?.toIso8601String()
      };

  Hak kopi(
          {int? id,
          String? nama,
          String? deskripsi,
          DateTime? direkam,
          DateTime? dibaharui}) =>
      Hak(
          id: id ?? this.id,
          nama: nama ?? this.nama,
          deskripsi: deskripsi ?? this.deskripsi,
          direkam: direkam ?? this.direkam,
          dibaharui: dibaharui ?? this.dibaharui);
}
