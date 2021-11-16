final String tabelMakanan = 'makanan';

class KolomMakanan {
  static final List<String> nilai = [
    id,
    nama,
    deskripsi,
    gambar,
    harga,
    direkam,
    dibaharui
  ];
  static final String id = '_id';
  static final String nama = 'nama';
  static final String deskripsi = 'deskripsi';
  static final String gambar = 'gambar';
  static final String harga = 'harga';
  static final String direkam = 'direkam';
  static final String dibaharui = 'dibaharui';
}

class Makanan {
  final int? id;
  final String nama;
  final String deskripsi;
  final String? gambar;
  final double harga;
  final DateTime direkam;
  final DateTime? dibaharui;

  const Makanan(
      {this.id,
      required this.nama,
      required this.deskripsi,
      this.gambar,
      required this.harga,
      required this.direkam,
      this.dibaharui});

  static Makanan dariJson(Map<String, Object?> json) => Makanan(
        id: json[KolomMakanan.id] as int?,
        nama: json[KolomMakanan.nama] as String,
        deskripsi: json[KolomMakanan.deskripsi] as String,
        gambar: json[KolomMakanan.gambar] as String,
        harga: double.parse(json['harga'] as String),
        direkam: DateTime.parse(json[KolomMakanan.direkam] as String),
        dibaharui: DateTime.parse(json[KolomMakanan.dibaharui] as String),
      );

  Map<String, Object?> keJson() => {
        KolomMakanan.id: id,
        KolomMakanan.nama: nama,
        KolomMakanan.deskripsi: deskripsi,
        KolomMakanan.gambar: gambar,
        KolomMakanan.harga: harga.toString(),
        KolomMakanan.direkam: direkam.toIso8601String(),
        KolomMakanan.dibaharui: dibaharui?.toIso8601String()
      };

  Makanan kopi(
          {int? id,
          String? nama,
          String? deskripsi,
          String? gambar,
          double? harga,
          DateTime? direkam,
          DateTime? dibaharui}) =>
      Makanan(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        deskripsi: deskripsi ?? this.deskripsi,
        gambar: gambar ?? this.gambar,
        harga: harga ?? this.harga,
        direkam: direkam ?? this.direkam,
        dibaharui: dibaharui ?? this.dibaharui,
      );
}
