import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:frontend_tugas_akhir/common/failure.dart';
import 'package:frontend_tugas_akhir/common/form_enum.dart';
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
      : super(LoginPasienInitial()) {
    on<LoginFormEmailChanged>((event, emit) async {
      final newEmail = event.email;
      emit(state.copyWith(
        email: newEmail,
      ));
    });

    on<LoginFormPasswordChanged>((event, emit) async {
      final newPassword = event.password;
      emit(state.copyWith(
        password: newPassword,
      ));
    });

    on<LoginPasienRememberMeChanged>((event, emit) {
      final newRememberMe = event.rememberMe;

      emit(state.copyWith(
        rememberMe: newRememberMe,
      ));
    });

    on<LoginFormIsLoading>((event, emit) {
      final newRememberMe = event.isLoading;

      emit(state.copyWith(
        isLoading: newRememberMe,
      ));
    });

    on<OnEmailSignIn>((event, emit) async {
      emit(state.copyWith(
          formStatus: FormStatusEnum.submittingForm, isLoading: true));

      final result = await loginUsers.execute(
        state.email,
        state.password,
      );

      result.fold(
        (failure) {
          print('Failure: gagal');
          emit(state.copyWith(
            formStatus: FormStatusEnum.failedSubmission,
            message: failure.message,
            isLoading: false,
          ));
        },
        (data) {
          print('Success: berhasil');
          emit(state.copyWith(
            formStatus: FormStatusEnum.successSubmission,
            message: data,
            isLoading: false,
          ));
        },
      );
    });

    on<LoginFormObsecurePasswordChanged>((event, emit) {
      final newObsecure = event.obsecure;
      emit(state.copyWith(
        obsecurePassword: newObsecure,
      ));
    });
  }
}
