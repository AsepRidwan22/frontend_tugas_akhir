import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/domain/usecases/get_remember_me.dart';
import 'package:frontend_tugas_akhir/domain/usecases/login_user.dart';
import 'package:frontend_tugas_akhir/domain/usecases/set_remember_me.dart';

part 'login_pasien_event.dart';
part 'login_pasien_state.dart';

class LoginPasienBloc extends Bloc<LoginPasienEvent, LoginPasienState> {
  final LoginUsers loginUsers;
  final SetRememberMe setRememberMe;
  final GetRememberMe getRememberMe;
  LoginPasienBloc(this.loginUsers, this.setRememberMe, this.getRememberMe)
      : super(const LoginPasienInitial()) {
    on<LoginFormEmailChanged>((event, emit) async {
      final newEmail = event.email;

      emit(state.copyWith(
        email: newEmail,
      ));
    });

    on<LoginFormPasswordChanged>((event, emit) async {
      final newPassword = event.password;

      emit(state.copyWith(
        email: newPassword,
      ));
    });

    on<LoginPasienRememberMeChanged>((event, emit) async {
      final newRememberMe = event.rememberMe;

      emit(state.copyWith(
        rememberMe: newRememberMe,
      ));
    });

    on<OnSaveRememberme>((event, emit) async {
      final result = await setRememberMe.execute(state.rememberMe);

      if (result) {
        emit(state.copyWith(
          rememberMe: state.rememberMe,
        ));
      }
    });
  }
}
