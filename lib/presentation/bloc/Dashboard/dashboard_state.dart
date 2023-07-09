part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final int indexBottomNav;
  final bool isLogIn;
  final bool idDokter;
  final bool isHaveProfile;
  final bool isHaveKesehatanAwal;

  const DashboardState({
    required this.indexBottomNav,
    required this.isLogIn,
    required this.idDokter,
    required this.isHaveProfile,
    required this.isHaveKesehatanAwal,
  });

  DashboardState copyWith({
    int? indexBottomNav,
    bool? isLogIn,
    bool? idDokter,
    bool? isHaveProfile,
    bool? isHaveKesehatanAwal,
  }) {
    return DashboardState(
      indexBottomNav: indexBottomNav ?? this.indexBottomNav,
      isLogIn: isLogIn ?? this.isLogIn,
      idDokter: idDokter ?? this.idDokter,
      isHaveProfile: isHaveProfile ?? this.isHaveProfile,
      isHaveKesehatanAwal: isHaveProfile ?? this.isHaveKesehatanAwal,
    );
  }

  @override
  List<Object> get props => [
        indexBottomNav,
        isLogIn,
        idDokter,
        isHaveProfile,
        isHaveKesehatanAwal,
      ];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial()
      : super(
          indexBottomNav: 0,
          isLogIn: false,
          idDokter: false,
          isHaveProfile: false,
          isHaveKesehatanAwal: false,
        );
}
