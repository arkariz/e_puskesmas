class DokterModel {
  String? jenisPoli;
  String? namaDokter;
  List<String>? jadwal;

  DokterModel({this.jenisPoli, this.namaDokter, this.jadwal});

  DokterModel.fromJson(Map<String, dynamic> json) {
    jenisPoli = json['jenis_poli'];
    namaDokter = json['nama_dokter'];
    jadwal = json['jadwal'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jenis_poli'] = jenisPoli;
    data['nama_dokter'] = namaDokter;
    data['jadwal'] = jadwal;
    return data;
  }
}
