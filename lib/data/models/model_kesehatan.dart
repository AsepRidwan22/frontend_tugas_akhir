import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';

class ModelKesehatan extends Equatable {
  final double bmi;
  final String status;
  final double bbiMin;
  final double bbiMax;
  final int beratIdealMinimum;
  final int beratIdealMaksimum;
  final double kaloriBasal;
  final double kaloriUmur;
  final double kaloriJenisKelamin;
  final double kaloriBeratBadan;
  final double kaloriAktivitas;
  final double kaloriDitambah;
  final double kaloriDikurangi;
  final double kaloriTotal;
  final String hipertensi;
  final String diabetes;
  final String presentaseLemakTubuh;
  final String statusTekananDarah;
  final String resikoJantung;
  final String kolesterol;
  final String? message;

  const ModelKesehatan({
    required this.bmi,
    required this.status,
    required this.bbiMin,
    required this.bbiMax,
    required this.beratIdealMinimum,
    required this.beratIdealMaksimum,
    required this.kaloriBasal,
    required this.kaloriUmur,
    required this.kaloriJenisKelamin,
    required this.kaloriBeratBadan,
    required this.kaloriAktivitas,
    required this.kaloriDitambah,
    required this.kaloriDikurangi,
    required this.kaloriTotal,
    required this.hipertensi,
    required this.diabetes,
    required this.presentaseLemakTubuh,
    required this.statusTekananDarah,
    required this.resikoJantung,
    required this.kolesterol,
    this.message,
  });

  factory ModelKesehatan.fromJson(Map<String, dynamic> json) {
    return ModelKesehatan(
      bmi: json['bmi']?.toDouble(),
      status: json['status'],
      bbiMin: json['bbi_min']?.toDouble(),
      bbiMax: json['bbi_max']?.toDouble(),
      beratIdealMinimum: json['berat_ideal_minimum']?.toInt(),
      beratIdealMaksimum: json['berat_ideal_maksimum']?.toInt(),
      kaloriBasal: json['kalori_basal']?.toDouble(),
      kaloriUmur: json['kalori_umur']?.toDouble(),
      kaloriJenisKelamin: json['kalori_jenis_kelamin']?.toDouble(),
      kaloriBeratBadan: json['kalori_berat_badan']?.toDouble(),
      kaloriAktivitas: json['kalori_aktivitas']?.toDouble(),
      kaloriDitambah: json['kalori_ditambah']?.toDouble(),
      kaloriDikurangi: json['kalori_dikurangi']?.toDouble(),
      kaloriTotal: json['kalori_total']?.toDouble(),
      hipertensi: json['hipertensi'],
      diabetes: json['diabetes'],
      presentaseLemakTubuh: json['presentase_lemak_tubuh'],
      statusTekananDarah: json['status_tekanan_darah'],
      resikoJantung: json['resiko_jantung'],
      kolesterol: json['kolesterol'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "bmi": bmi,
      "status": status,
      "bbi_min": bbiMin,
      "bbi_max": bbiMax,
      "berat_ideal_minimum": beratIdealMinimum,
      "berat_ideal_maksimum": beratIdealMaksimum,
      "kalori_basal": kaloriBasal,
      "kalori_umur": kaloriUmur,
      "kalori_jenis_kelamin": kaloriJenisKelamin,
      "kalori_berat_badan": kaloriBeratBadan,
      "kalori_aktivitas": kaloriAktivitas,
      "kalori_ditambah": kaloriDitambah,
      "kalori_dikurangi": kaloriDikurangi,
      "kalori_total": kaloriTotal,
      "hipertensi": hipertensi,
      "diabetes": diabetes,
      "presentase_lemak_tubuh": presentaseLemakTubuh,
      "status_tekanan_darah": statusTekananDarah,
      "resiko_jantung": resikoJantung,
      "kolesterol": kolesterol,
      "message": message,
    };
  }

  Kesehatan toEntity() {
    return Kesehatan(
      bmi: bmi,
      status: status,
      bbiMin: bbiMin,
      bbiMax: bbiMax,
      beratIdealMinimum: beratIdealMinimum,
      beratIdealMaksimum: beratIdealMaksimum,
      kaloriBasal: kaloriBasal,
      kaloriUmur: kaloriUmur,
      kaloriJenisKelamin: kaloriJenisKelamin,
      kaloriBeratBadan: kaloriBeratBadan,
      kaloriAktivitas: kaloriAktivitas,
      kaloriDitambah: kaloriDitambah,
      kaloriDikurangi: kaloriDikurangi,
      kaloriTotal: kaloriTotal,
      hipertensi: hipertensi,
      diabetes: diabetes,
      presentaseLemakTubuh: presentaseLemakTubuh,
      statusTekananDarah: statusTekananDarah,
      resikoJantung: resikoJantung,
      kolesterol: kolesterol,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        bmi,
        status,
        bbiMin,
        bbiMax,
        beratIdealMinimum,
        beratIdealMaksimum,
        kaloriBasal,
        kaloriUmur,
        kaloriJenisKelamin,
        kaloriBeratBadan,
        kaloriAktivitas,
        kaloriDitambah,
        kaloriDikurangi,
        kaloriTotal,
        hipertensi,
        diabetes,
        presentaseLemakTubuh,
        statusTekananDarah,
        resikoJantung,
        kolesterol,
        message,
      ];
}
