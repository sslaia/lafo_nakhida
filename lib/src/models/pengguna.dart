import 'tugas.dart';

final String tabelPengguna = 'pengguna';

class KolomPengguna {
  static final List<String> nilai = [
    id,
    nama,
    tugas,
    email,
    password,
    telefon,
    direkam,
    dibaharui
  ];
  static final String id = '_id';
  static final String nama = 'nama';
  static final String tugas = 'tugas';
  static final String email = 'email';
  static final String password = 'password';
  static final String telefon = 'telepon';
  static final String direkam = 'direkam';
  static final String dibaharui = 'dibaharui';
}

class Pengguna {
  final int? id;
  final String nama;
  final List<Tugas> tugas;
  final String email;
  final String password;
  final String telefon;
  final DateTime direkam;
  final DateTime? dibaharui;

  const Pengguna(
      {this.id,
      required this.nama,
      required this.tugas,
      required this.email,
      required this.password,
      required this.telefon,
      required this.direkam,
      this.dibaharui});

  static Pengguna dariJson(Map<String, Object?> json) => Pengguna(
        id: json[KolomPengguna.id] as int?,
        nama: json[KolomPengguna.nama] as String,
        tugas: json[KolomPengguna.tugas] as List<Tugas>,
        email: json[KolomPengguna.email] as String,
        password: json[KolomPengguna.password] as String,
        telefon: json[KolomPengguna.telefon] as String,
        direkam: DateTime.parse(json[KolomPengguna.direkam] as String),
        dibaharui: DateTime.parse(json[KolomPengguna.dibaharui] as String),
      );

  Map<String, Object?> keJson() => {
        KolomPengguna.id: id,
        KolomPengguna.nama: nama,
        KolomPengguna.tugas: tugas,
        KolomPengguna.email: email,
        KolomPengguna.password: password,
        KolomPengguna.telefon: telefon,
        KolomPengguna.direkam: direkam.toIso8601String(),
        KolomPengguna.dibaharui: dibaharui?.toIso8601String()
      };

  Pengguna kopi(
          {int? id,
          String? nama,
          List<Tugas>? tugas,
          String? email,
          String? password,
          String? telefon,
          DateTime? direkam,
          DateTime? dibaharui}) =>
      Pengguna(
          id: id ?? this.id,
          nama: nama ?? this.nama,
          tugas: tugas ?? this.tugas,
          email: email ?? this.email,
          password: password ?? this.password,
          telefon: telefon ?? this.telefon,
          direkam: direkam ?? this.direkam,
          dibaharui: dibaharui ?? this.dibaharui);
}
