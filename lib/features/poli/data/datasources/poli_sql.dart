import 'package:e_puskesmas/core/utils/sql_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class PoliSql {
  // Create new poli
  static Future<int> createpoli(
    String kodeAntrian,
    String jenisPoli,
    String namaPasien,
    String jenisPasien,
    String dokter,
    String jadwal,
    int idPasien,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'kode_antrian': kodeAntrian,
      'jenis_poli': jenisPoli,
      'nama_pasien': namaPasien,
      'jenis_pasien': jenisPasien,
      'dokter': dokter,
      'jadwal': jadwal,
      'id_pasien': idPasien,
    };
    final idpoli = await db.insert('poli', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return idpoli;
  }

  // Read all poli
  static Future<List<Map<String, dynamic>>> getpoli() async {
    final db = await SQLHelper.db();
    return db.query('poli', orderBy: "id_poli");
  }

  // Read poli by jenis pasien
  static Future<List<Map<String, dynamic>>> getPoliByJenisPasien(String jenisPasien) async {
    final db = await SQLHelper.db();
    return db.query('poli', where: "jenis_pasien = ?", whereArgs: [jenisPasien], orderBy: "jadwal");
  }

  static Future<List<Map<String, dynamic>>> getPoliByPasienId(int idPasien) async {
    final db = await SQLHelper.db();
    return db.query('poli', where: "id_pasien = ?", whereArgs: [idPasien]);
  }

  // Read a single item by nim
  static Future<List<Map<String, dynamic>>> getSinglepoli(int idPoli) async {
    final db = await SQLHelper.db();
    return db.query('poli', where: "id_poli = ?", whereArgs: [idPoli], limit: 1);
  }

  // Update an item by nim
  static Future<int> updatepoli(
    int idpoli,
    String kodeAntrian,
    String jenisPoli,
    String namaPasien,
    String jenisPasien,
    String dokter,
    String jadwal,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'kode_antrian': kodeAntrian,
      'jenis_poli': jenisPoli,
      'nama_lengkap': namaPasien,
      'jenis_pasien': jenisPasien,
      'dokter': dokter,
      'jadwal': jadwal,
    };

    final result = await db.update('poli', data, where: "id_poli = ?", whereArgs: [idpoli]);
    return result;
  }

  // Delete
  static Future<void> deletepoli(int idpoli) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("poli", where: "id_poli = ?", whereArgs: [idpoli]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
