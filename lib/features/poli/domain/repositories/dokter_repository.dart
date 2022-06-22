import 'package:e_puskesmas/features/poli/domain/entities/dokter_model.dart';

class DokterRepository {
  List<Map<String, dynamic>> getAll() => _dokter;

  getJadwal(String namaDokter) => _dokter
      .map((map) => DokterModel.fromJson(map))
      .where((item) => item.namaDokter == namaDokter)
      .map(
        (item) => item.jadwal,
      )
      .expand((i) => i!.toList())
      .toList();

  List<String?> getDokter(String jenisPoli) => _dokter
      .map((map) => DokterModel.fromJson(map))
      .where((element) => element.jenisPoli == jenisPoli)
      .map(
        (item) => item.namaDokter,
      )
      .toList();

  final _dokter = [
    {
      "jenis_poli": "Poli Anak",
      "nama_dokter": "Lovita Serlianti.SST",
      "jadwal": [
        "Senin (07.30 - 11.00)",
        "Selasa (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli Anak",
      "nama_dokter": "Sutaryah Amd.Keb",
      "jadwal": [
        "Rabu (07.30 - 11.00)",
        "Kamis (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli Anak",
      "nama_dokter": "Eliyawati.SKM",
      "jadwal": [
        "Jumat (07.30 - 11.00)",
        "Sabtu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli Umum",
      "nama_dokter": "dr.M.Tito alvanza",
      "jadwal": [
        "Senin (07.30 - 11.00)",
        "Selasa (07.30 - 11.00)",
        "Rabu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli Umum",
      "nama_dokter": "dr.Ayu Lestari",
      "jadwal": [
        "Kamis (07.30 - 11.00)",
        "Jumat (07.30 - 11.00)",
        "Sabtu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KB",
      "nama_dokter": "eva rosida.SST",
      "jadwal": [
        "Senin (07.30 - 11.00)",
        "Selasa (07.30 - 11.00)",
        "Rabu (07.30 - 11.00)",
        "Kamis (07.30 - 11.00)",
        "Jumat (07.30 - 11.00)",
        "Sabtu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KB",
      "nama_dokter": "salbiyah",
      "jadwal": [
        "Senin (07.30 - 11.00)",
        "Selasa (07.30 - 11.00)",
        "Rabu (07.30 - 11.00)",
        "Kamis (07.30 - 11.00)",
        "Jumat (07.30 - 11.00)",
        "Sabtu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Yusfika",
      "jadwal": [
        "Senin (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Sri Sejati",
      "jadwal": [
        "Senin (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Irma Yanti",
      "jadwal": [
        "Selasa (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Sintikhe Natalia",
      "jadwal": [
        "Selasa (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Ana Susanti",
      "jadwal": [
        "Rabu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Yuli. M",
      "jadwal": [
        "Rabu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Widya",
      "jadwal": [
        "Kamis (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Vivi. P",
      "jadwal": [
        "Kamis (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Kristin",
      "jadwal": [
        "Jumat (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Toten",
      "jadwal": [
        "Jumat (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Lisma",
      "jadwal": [
        "Sabtu (07.30 - 11.00)",
      ]
    },
    {
      "jenis_poli": "Poli KIA",
      "nama_dokter": "Nova",
      "jadwal": [
        "Sabtu (07.30 - 11.00)",
      ]
    },
  ];
}
