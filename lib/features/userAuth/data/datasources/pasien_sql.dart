import 'package:e_puskesmas/core/utils/sql_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

// [x] Revisi Pasien Field
class PasienSql {
  // Create new Pasien
  static Future<int> createPasien(
    String statusPasien,
    String email,
    String password,
    String noRekamMedis,
    String noBpjs,
    String namaLengkap,
    String namaKK,
    String tanggalLahir,
    String tempatLahir,
    String usia,
    String jenisKelamin,
    String detailAlamat,
    String kkPath,
    String? ktpPath,
    String? bpjsPath,
    String profilePath,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'status_pasien': statusPasien,
      'email': email,
      'password': password,
      'no_rekam_medis': noRekamMedis,
      'no_bpjs': noBpjs,
      'nama_lengkap': namaLengkap,
      'nama_kk': namaKK,
      'tanggal_lahir': tanggalLahir,
      'tempat_lahir':tempatLahir,
      'usia': usia,
      'jenis_kelamin': jenisKelamin,
      'detail_alamat': detailAlamat,
      'kk_path': kkPath,
      'ktp_path': ktpPath,
      'bpjs_path': bpjsPath,
      'foto_profile_path': profilePath,
    };
    final idPasien = await db.insert('pasien', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idPasien;
  }

  // Read all Pasien
  static Future<List<Map<String, dynamic>>> getPasien() async {
    final db = await SQLHelper.db();
    return db.query('pasien', orderBy: "id_pasien");
  }

  // Read a single item
  static Future<List<Map<String, dynamic>>> getSinglePasien(String email, String password) async {
    final db = await SQLHelper.db();
    return db.query('pasien', where: "email = ? AND password = ?", whereArgs: [email, password], limit: 1);
  }

  // Read a item by id
  static Future<List<Map<String, dynamic>>> getSinglePasienById(int pasienId) async {
    final db = await SQLHelper.db();
    return db.query('pasien', where: "id_pasien = ? ", whereArgs: [pasienId], limit: 1);
  }

  // Read a item by name
  static Future<List<Map<String, dynamic>>> getSinglePasienByName(String name, String jenisPasien) async {
    final db = await SQLHelper.db();
    return db.rawQuery("SELECT * FROM pasien WHERE status_pasien = '$jenisPasien' AND nama_lengkap LIKE '%$name%'");
  }

  static Future<List<Map<String, dynamic>>> getPasienByJenis(String jenisPasien) async {
    final db = await SQLHelper.db();
    return db.query('pasien', where: "status_pasien = ? ", whereArgs: [jenisPasien]);
  }

  // Update an item by nim
  static Future<int> updatePasien(
    int idPasien,
    String statusPasien,
    String email,
    String password,
    String noRekamMedis,
    String noBpjs,
    String namaLengkap,
    String namaKK,
    String tanggalLahir,
    String tempatLahir,
    String usia,
    String jenisKelamin,
    String detailAlamat,
    String kkPath,
    String? ktpPath,
    String? bpjsPath,
    String profilePath,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'status_pasien': statusPasien,
      'email': email,
      'password': password,
      'no_rekam_medis': noRekamMedis,
      'no_bpjs': noBpjs,
      'nama_lengkap': namaLengkap,
      'nama_kk': namaKK,
      'tanggal_lahir': tanggalLahir,
      'tempat_lahir':tempatLahir,
      'usia': usia,
      'jenis_kelamin': jenisKelamin,
      'detail_alamat': detailAlamat,
      'kk_path': kkPath,
      'ktp_path': ktpPath,
      'bpjs_path': bpjsPath,
      'foto_profile_path': profilePath,
    };

    final result = await db.update('pasien', data, where: "id_pasien = ?", whereArgs: [idPasien]);
    return result;
  }

  // Delete
  static Future<void> deletePasien(int idPasien) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("pasien", where: "id_pasien = ?", whereArgs: [idPasien]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
