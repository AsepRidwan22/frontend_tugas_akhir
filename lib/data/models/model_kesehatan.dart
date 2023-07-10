import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';

class ModelKesehatan extends Equatable {
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
  final String? message;

  const ModelKesehatan({
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
    this.message,
  });

  factory ModelKesehatan.fromJson(Map<String, dynamic> json) {
    return ModelKesehatan(
      beratBadan: json['berat_badan']?.toInt(),
      tinggiBadan: json['tinggi_badan']?.toInt(),
      umur: json['umur'].toDouble(),
      bmi: json['bmi'],
      status: json['status'],
      bbiMin: json['bbi_min']?.toInt(),
      bbiMax: json['bbi_max']?.toInt(),
      bmiMin: json['bmi_min']?.toDouble(),
      bmiMax: json['bmi_max']?.toDouble(),
      kaloriBasal: json['kalori_basal']?.toDouble(),
      kaloriAktivitasRingan: json['kalori_aktivitas_ringan']?.toInt(),
      kaloriAktivitasSedang: json['kalori_aktivitas_sedang']?.toInt(),
      kaloriAktivitasBerat: json['kalori_aktivitas_berat']?.toInt(),
      tekananDarahSistolik: json['tekanan_darah_sistolik']?.toInt(),
      tekananDarahDiastolik: json['tekanan_darah_diastolik']?.toInt(),
      hipertensi: json['hipertensi'],
      message: json['message'],
    );
  }

  Kesehatan toEntity() {
    return Kesehatan(
      beratBadan: beratBadan,
      tinggiBadan: tinggiBadan,
      umur: umur,
      bmi: bmi,
      status: status,
      bbiMin: bbiMin,
      bbiMax: bbiMax,
      bmiMin: bmiMin,
      bmiMax: bmiMax,
      kaloriBasal: kaloriBasal,
      kaloriAktivitasRingan: kaloriAktivitasRingan,
      kaloriAktivitasSedang: kaloriAktivitasSedang,
      kaloriAktivitasBerat: kaloriAktivitasBerat,
      tekananDarahSistolik: tekananDarahSistolik,
      tekananDarahDiastolik: tekananDarahDiastolik,
      hipertensi: hipertensi,
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
        message,
      ];
}
