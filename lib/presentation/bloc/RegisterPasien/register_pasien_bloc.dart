import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend_tugas_akhir/common/form_enum.dart';
import 'package:frontend_tugas_akhir/domain/usecases/register.dart';

part 'register_pasien_event.dart';
part 'register_pasien_state.dart';

class RegisterPasienBloc
    extends Bloc<RegisterPasienEvent, RegisterPasienState> {
  final RegisterUsers registerUsers;
  RegisterPasienBloc(this.registerUsers) : super(RegisterPasienInitial()) {
    on<RegisterFormEmailChanged>((event, emit) async {
      final newEmail = event.email;
      emit(state.copyWith(
        email: newEmail,
      ));
    });

    on<RegisterFormPasswordChanged>((event, emit) async {
      final newPassword = event.password;
      emit(state.copyWith(
        password: newPassword,
      ));
    });

    on<RegisterFormValidationPasswordChanged>((event, emit) async {
      final newPassword = event.password;
      emit(state.copyWith(
        validationPassword: newPassword,
      ));
    });

    on<RegisterFormNameChanged>((event, emit) async {
      final newName = event.name;
      // print('bloc name: ${event.name}');
      emit(state.copyWith(
        name: newName,
      ));
    });

    on<RegisterFormObsecurePasswordChanged>((event, emit) {
      final newObsecure = event.obsecure;
      emit(state.copyWith(
        obsecurePassword: newObsecure,
      ));
    });

    on<RegisterFormIsLoading>((event, emit) {
      final newRememberMe = event.isLoading;

      emit(state.copyWith(
        isLoading: newRememberMe,
      ));
    });

    on<OnEmailSignIn>((event, emit) async {
      print('masuk ke bloc');
      emit(state.copyWith(
          formStatus: FormStatusEnum.submittingForm, isLoading: true));

      // print('result: ${state.email}, ${state.name}, ${state.password}');

      final result = await registerUsers.execute(
        state.email,
        state.name,
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
  }
}
