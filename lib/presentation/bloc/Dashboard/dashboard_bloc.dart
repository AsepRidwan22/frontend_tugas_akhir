import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_is_login.dart';
import 'package:frontend_tugas_akhir/domain/usecases/is_dokter.dart';
import 'package:frontend_tugas_akhir/domain/usecases/is_have_profile.dart';
import 'package:frontend_tugas_akhir/domain/usecases/save_is_login.dart';
import 'package:frontend_tugas_akhir/domain/usecases/set_remember_me.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetIsLogIn getIsLogIn;
  final SaveIsLogIn saveIsLogIn;
  final IsDokter isDokter;
  final IsHaveProfile isHaveProfile;
  final SetRememberMe setRememberMe;

  DashboardBloc(
    this.getIsLogIn,
    this.saveIsLogIn,
    this.isDokter,
    this.isHaveProfile,
    this.setRememberMe,
  ) : super(const DashboardInitial()) {
    on<IndexBottomNavChange>((event, emit) async {
      final newValueBottomNav = event.newIndex;

      emit(state.copyWith(
        indexBottomNav: newValueBottomNav,
      ));
    });

    on<OnIsHaveProfile>((event, emit) async {
      final newValue = await isHaveProfile.execute(event.email);

      emit(state.copyWith(
        isHaveProfile: newValue,
      ));
    });

    on<IsLogInSave>((event, emit) async {
      final value = event.value;
      print('is login save: ${event.value}');
      final newValueLogIn = await saveIsLogIn.execute(value);

      if (newValueLogIn) {
        emit(state.copyWith(
          isLogIn: value,
        ));
      } else {
        // print("error");
      }
    });

    on<IsLogInChange>((event, emit) async {
      final newValueLogIn = await getIsLogIn.execute();

      emit(state.copyWith(
        isLogIn: newValueLogIn,
      ));
    });

    // on<OnSaveRemembermeDashboard>((event, emit) async {
    //   final newValue = await isHaveProfile.execute(event.email);
    //   final result = await setRememberMe.execute(false);
    // });

    // on<OnIsHaveProfile>((event, emit) async {
    //   final newValue = await isHaveProfile.execute(event.email);
    //   emit(state.copyWith(
    //     isHaveProfile: event.email,
    //   ));
    // });

    // on<OnIsHaveProfileSave>((event, emit) async {
    //   emit(state.copyWith(
    //     isHaveProfile: event.value,
    //   ));
    // });

    // on<OnIsDokter>((event, emit) async {
    //   final newValue = await isDokter.execute(event.email);

    //   emit(state.copyWith(
    //     isDokter: newValue,
    //   ));
    // });

    on<SingOut>((event, emit) async {
      // final email = await emailSignOut.execute();
      // final google = await googleSignOut.execute();
      // final facebook = await facebookSignOut.execute();

      emit(state.copyWith(
        isLogIn: false,
      ));
    });
  }
}
