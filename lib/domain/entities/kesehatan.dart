import 'package:equatable/equatable.dart';

class Kesehatan extends Equatable {
  final int beratBadan;
  final int tinggiBadan;
  final double umur;
  final double bmi;
  final String status;
  final int bbiMin;
  final int bbiMax;
  final double bmiMin;
  final double bmiMax;
  final double kaloriBasal;
  final int kaloriAktivitasRingan;
  final int kaloriAktivitasSedang;
  final int kaloriAktivitasBerat;
  final int tekananDarahSistolik;
  final int tekananDarahDiastolik;
  final String hipertensi;

  const Kesehatan({
    required this.beratBadan,
    required this.tinggiBadan,
    required this.umur,
    required this.bmi,
    required this.status,
    required this.bbiMin,
    required this.bbiMax,
    required this.bmiMin,
    required this.bmiMax,
    required this.kaloriBasal,
    required this.kaloriAktivitasRingan,
    required this.kaloriAktivitasSedang,
    required this.kaloriAktivitasBerat,
    required this.tekananDarahSistolik,
    required this.tekananDarahDiastolik,
    required this.hipertensi,
  });

  factory Kesehatan.fromJson(Map<String, dynamic> json) {
    return Kesehatan(
      beratBadan: json['berat_badan'].toDouble(),
      tinggiBadan: json['tinggi_badan'].toDouble(),
      umur: json['umur'],
      bmi: double.parse(json['bmi']),
      status: json['status'],
      bbiMin: json['bbi_min'].toDouble(),
      bbiMax: json['bbi_max'].toDouble(),
      bmiMin: json['bmi_min'].toDouble(),
      bmiMax: json['bmi_max'].toDouble(),
      kaloriBasal: json['kalori_basal'].toDouble(),
      kaloriAktivitasRingan: json['kalori_aktivitas_ringan'].toInt(),
      kaloriAktivitasSedang: json['kalori_aktivitas_sedang'].toInt(),
      kaloriAktivitasBerat: json['kalori_aktivitas_berat'].toInt(),
      tekananDarahSistolik: json['tekanan_darah_sistolik'].toInt(),
      tekananDarahDiastolik: json['tekanan_darah_diastolik'].toInt(),
      hipertensi: json['hipertensi'],
    );
  }

  @override
  List<Object?> get props => [
        beratBadan,
        tinggiBadan,
        umur,
        bmi,
        status,
        bbiMin,
        bbiMax,
        bmiMin,
        bmiMax,
        kaloriBasal,
        kaloriAktivitasRingan,
        kaloriAktivitasSedang,
        kaloriAktivitasBerat,
        tekananDarahSistolik,
        tekananDarahDiastolik,
        hipertensi,
      ];
}
