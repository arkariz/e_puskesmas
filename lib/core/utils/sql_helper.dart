import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE pasien(
        id_pasien INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        status_pasien TEXT,
        email TEXT,
        password TEXT,
        no_bpjs TEXT,
        nama_lengkap TEXT,
        tanggal_lahir TEXT,
        tempat_lahir TEXT,
        usia TEXT,
        jenis_kelamin TEXT,
        detail_alamat TEXT,
        kk_path TEXT,
        ktp_path TEXT,
        bpjs_path TEXT,
        foto_profile_path TEXT
      )
      """);

    await database.execute("""CREATE TABLE poli(
        id_poli INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        kode_antrian TEXT,
        jenis_poli TEXT,
        nama_pasien TEXT,
        jenis_pasien TEXT,
        dokter TEXT,
        jadwal TEXT,
        id_pasien INTEGER
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'puskesmas.db',
      version: 7,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
}
