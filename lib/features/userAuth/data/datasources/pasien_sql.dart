import 'package:e_puskesmas/core/utils/sql_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class PasienSql {
  // Create new Pasien
  static Future<int> createPasien(
    String statusPasien,
    String namaLengkap,
    String email,
    String password,
    String namaKK,
    String jenisKelamin,
    String provinsi,
    String kabupaten,
    String kodePos,
    String detailAlamat,
    String profilePath,
    String kkPath,
    String? ktpPath,
    String? bpjsPath,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'status_pasien': statusPasien,
      'nama_lengkap': namaLengkap,
      'email': email,
      'password': password,
      'nama_kk': namaKK,
      'jenis_kelamin': jenisKelamin,
      'provinsi': provinsi,
      'kabupaten': kabupaten,
      'kode_pos': kodePos,
      'detail_alamat': detailAlamat,
      'foto_profile_path': profilePath,
      'kk_path': kkPath,
      'ktp_path': ktpPath,
      'bpjs_path': bpjsPath,
    };
    final idPasien = await db.insert('pasien', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idPasien;
  }

  // Read all Pasien
  static Future<List<Map<String, dynamic>>> getPasien() async {
    final db = await SQLHelper.db();
    return db.query('pasien', orderBy: "id_pasien");
  }

  // Read a single item by nim
  static Future<List<Map<String, dynamic>>> getSinglePasien(String email, String password) async {
    final db = await SQLHelper.db();
    return db.query('pasien', where: "email = ? AND password = ?", whereArgs: [email, password], limit: 1);
  }

  // Read a single item by id
  static Future<List<Map<String, dynamic>>> getSinglePasienById(int pasienId) async {
    final db = await SQLHelper.db();
    return db.query('pasien', where: "id_pasien = ? ", whereArgs: [pasienId], limit: 1);
  }

  // Update an item by nim
  static Future<int> updatePasien(
    int idPasien,
    String statusPasien,
    String namaLengkap,
    String email,
    String password,
    String namaKK,
    String jenisKelamin,
    String provinsi,
    String kabupaten,
    String kodePos,
    String detailAlamat,
    String profilePath,
    String kkPath,
    String? ktpPath,
    String? bpjsPath,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'status_pasien': statusPasien,
      'nama_lengkap': namaLengkap,
      'email': email,
      'password': password,
      'nama_kk': namaKK,
      'jenis_kelamin': jenisKelamin,
      'provinsi': provinsi,
      'kabupaten': kabupaten,
      'kode_pos': kodePos,
      'detail_alamat': detailAlamat,
      'foto_profile_path': profilePath,
      'kk_path': kkPath,
      'ktp_path': ktpPath,
      'bpjs_path': bpjsPath,
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
