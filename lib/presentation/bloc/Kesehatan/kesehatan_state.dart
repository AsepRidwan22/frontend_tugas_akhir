part of 'kesehatan_bloc.dart';

class KesehatanState extends Equatable {
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
  final int kaloriDitambah;
  final int kaloriDikurangi;
  final double kaloriTotal;
  final String hipertensi;
  final String diabetes;
  final String presentaseLemakTubuh;
  final String statusTekananDarah;
  final String resikoJantung;
  final String kolesterol;
  final RequestState requestState;
  final String message;
  final Kesehatan? kesehatan;

  const KesehatanState({
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
    required this.requestState,
    required this.message,
    required this.kesehatan,
  });

  KesehatanState copyWith({
    double? bmi,
    String? status,
    double? bbiMin,
    double? bbiMax,
    int? beratIdealMinimum,
    int? beratIdealMaksimum,
    double? kaloriBasal,
    double? kaloriUmur,
    double? kaloriJenisKelamin,
    double? kaloriBeratBadan,
    double? kaloriAktivitas,
    int? kaloriDitambah,
    int? kaloriDikurangi,
    double? kaloriTotal,
    String? hipertensi,
    String? diabetes,
    String? presentaseLemakTubuh,
    String? statusTekananDarah,
    String? resikoJantung,
    String? kolesterol,
    RequestState? requestState,
    String? message,
    Kesehatan? kesehatan,
  }) {
    return KesehatanState(
      bmi: bmi ?? this.bmi,
      status: status ?? this.status,
      bbiMin: bbiMin ?? this.bbiMin,
      bbiMax: bbiMax ?? this.bbiMax,
      beratIdealMinimum: beratIdealMinimum ?? this.beratIdealMinimum,
      beratIdealMaksimum: beratIdealMaksimum ?? this.beratIdealMaksimum,
      kaloriBasal: kaloriBasal ?? this.kaloriBasal,
      kaloriUmur: kaloriUmur ?? this.kaloriUmur,
      kaloriJenisKelamin: kaloriJenisKelamin ?? this.kaloriJenisKelamin,
      kaloriBeratBadan: kaloriBeratBadan ?? this.kaloriBeratBadan,
      kaloriAktivitas: kaloriAktivitas ?? this.kaloriAktivitas,
      kaloriDitambah: kaloriDitambah ?? this.kaloriDitambah,
      kaloriDikurangi: kaloriDikurangi ?? this.kaloriDikurangi,
      kaloriTotal: kaloriTotal ?? this.kaloriTotal,
      hipertensi: hipertensi ?? this.hipertensi,
      diabetes: diabetes ?? this.diabetes,
      presentaseLemakTubuh: presentaseLemakTubuh ?? this.presentaseLemakTubuh,
      statusTekananDarah: statusTekananDarah ?? this.statusTekananDarah,
      kolesterol: '',
      resikoJantung: '',
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
      kesehatan: kesehatan ?? this.kesehatan,
    );
  }

  factory KesehatanState.initial() {
    return const KesehatanState(
      bmi: 0,
      status: '',
      bbiMin: 0,
      bbiMax: 0,
      beratIdealMinimum: 0,
      beratIdealMaksimum: 0,
      kaloriBasal: 0,
      kaloriUmur: 0,
      kaloriJenisKelamin: 0,
      kaloriBeratBadan: 0,
      kaloriAktivitas: 0,
      kaloriDitambah: 0,
      kaloriDikurangi: 0,
      kaloriTotal: 0,
      hipertensi: '',
      diabetes: '',
      presentaseLemakTubuh: '',
      statusTekananDarah: '',
      resikoJantung: '',
      kolesterol: '',
      requestState: RequestState.empty,
      message: '',
      kesehatan: null,
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
        requestState,
        message,
        kesehatan,
      ];
}
