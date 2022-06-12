import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE pasien(
        id_pasien INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        status_pasien TEXT
        nama_lengkap TEXT,
        email TEXT,
        password TEXT,
        nama_kk TEXT,
                jenis_kelamin TEXT,
        provinsi TEXT,
        kabupaten TEXT,
        kode_Pos TEXT,
        detail_alamat TEXT,
        foto_profile_path TEXT,
        kk_path TEXT,
        ktp_path TEXT,
        bpjs_path TEXT,
      )
      """);

    await database.execute("""CREATE TABLE poli(
        id_poli INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        jenis_poli TEXT,
        nama_pasien TEXT,
        jenis_pasien TEXT,
        dokter TEXT,
        waktu TEXT,
        tanggal TEXT,
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'puskesmas.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
}