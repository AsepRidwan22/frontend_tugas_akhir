import 'package:equatable/equatable.dart';

class Kesehatan extends Equatable {
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

  const Kesehatan({
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
    required this.message,
  });

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
