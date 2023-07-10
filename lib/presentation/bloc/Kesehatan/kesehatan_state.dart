part of 'kesehatan_bloc.dart';

class KesehatanState extends Equatable {
  final double beratBadan;
  final double tinggiBadan;
  final double umur;
  final String bmi;
  final String status;
  final double bbiMin;
  final double bbiMax;
  final double bmiMin;
  final double bmiMax;
  final double kaloriBasal;
  final int kaloriAktivitasRingan;
  final int kaloriAktivitasSedang;
  final int kaloriAktivitasBerat;
  final int tekDarahSistolik;
  final int tekDarahDiastolik;
  final String hipertensi;
  final RequestState requestState;
  final String message;
  final Kesehatan? kesehatan;

  const KesehatanState({
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
    required this.tekDarahSistolik,
    required this.tekDarahDiastolik,
    required this.hipertensi,
    required this.requestState,
    required this.message,
    required this.kesehatan,
  });

  KesehatanState copyWith({
    double? beratBadan,
    double? tinggiBadan,
    double? umur,
    String? bmi,
    String? status,
    double? bbiMin,
    double? bbiMax,
    double? bmiMin,
    double? bmiMax,
    double? kaloriBasal,
    int? kaloriAktivitasRingan,
    int? kaloriAktivitasSedang,
    int? kaloriAktivitasBerat,
    int? tekDarahSistolik,
    int? tekDarahDiastolik,
    String? hipertensi,
    RequestState? requestState,
    String? message,
    Kesehatan? kesehatan,
  }) {
    return KesehatanState(
      beratBadan: beratBadan ?? this.beratBadan,
      tinggiBadan: tinggiBadan ?? this.tinggiBadan,
      umur: umur ?? this.umur,
      bmi: bmi ?? this.bmi,
      status: status ?? this.status,
      bbiMin: bbiMin ?? this.bbiMin,
      bbiMax: bbiMax ?? this.bbiMax,
      bmiMin: bmiMin ?? this.bmiMin,
      bmiMax: bmiMax ?? this.bmiMax,
      kaloriBasal: kaloriBasal ?? this.kaloriBasal,
      kaloriAktivitasRingan:
          kaloriAktivitasRingan ?? this.kaloriAktivitasRingan,
      kaloriAktivitasSedang:
          kaloriAktivitasSedang ?? this.kaloriAktivitasSedang,
      kaloriAktivitasBerat: kaloriAktivitasBerat ?? this.kaloriAktivitasBerat,
      tekDarahSistolik: tekDarahSistolik ?? this.tekDarahSistolik,
      tekDarahDiastolik: tekDarahDiastolik ?? this.tekDarahDiastolik,
      hipertensi: hipertensi ?? this.hipertensi,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      kesehatan: kesehatan ?? this.kesehatan,
    );
  }

  factory KesehatanState.initial() {
    return const KesehatanState(
      beratBadan: 0,
      tinggiBadan: 0,
      umur: 0,
      bmi: '',
      status: '',
      bbiMin: 0,
      bbiMax: 0,
      bmiMin: 0,
      bmiMax: 0,
      kaloriBasal: 0,
      kaloriAktivitasRingan: 0,
      kaloriAktivitasSedang: 0,
      kaloriAktivitasBerat: 0,
      tekDarahSistolik: 0,
      tekDarahDiastolik: 0,
      hipertensi: '',
      requestState: RequestState.empty,
      message: '',
      kesehatan: null,
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
        tekDarahSistolik,
        tekDarahDiastolik,
        hipertensi,
        requestState,
        message,
        kesehatan,
      ];
}
