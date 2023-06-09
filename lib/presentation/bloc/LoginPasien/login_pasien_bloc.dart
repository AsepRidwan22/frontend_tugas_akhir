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

    on<OnEmailSignIn>((event, emit) async {
      emit(state.copyWith(
        formStatus: FormStatusEnum.submittingForm,
      ));

      try {
        final result = await loginUsers.execute(
          state.email,
          state.password,
        );

        result.fold(
          (failure) {
            emit(state.copyWith(
              formStatus: FormStatusEnum.failedSubmission,
              message: failure.message,
            ));
          },
          (data) {
            emit(state.copyWith(
              formStatus: FormStatusEnum.successSubmission,
              message: data,
            ));
          },
        );
      } catch (e) {
        final errorMessage = e.toString().replaceAll('Exception:', '').trim();
        emit(state.copyWith(
          formStatus: FormStatusEnum.failedSubmission,
          message: errorMessage,
        ));
      }
    });

    on<LoginFormObsecurePasswordChanged>((event, emit) {
      final newObsecure = event.obsecure;
      emit(state.copyWith(
        obsecurePassword: newObsecure,
      ));
    });

    // on<LoginFailure>((event, emit) {
    //   final newMessage = event.errorMessage;

    //   emit(state.copyWith(
    //     formStatus: FormStatusEnum.failedSubmission,
    //     message: newMessage,
    //   ));
    //   // Mengirim kejadian LoginFailureEvent
    //   // add(LoginFailure(newMessage));
    // });

    // on<OnSaveRememberme>((event, emit) async {
    //   final result = await setRememberMe.execute(state.rememberMe);

    //   if (result) {
    //     emit(state.copyWith(
    //       rememberMe: state.rememberMe,
    //     ));
    //   }
    // });
  }
}
