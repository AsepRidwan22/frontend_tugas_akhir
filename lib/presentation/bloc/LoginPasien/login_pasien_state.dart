part of 'login_pasien_bloc.dart';

class LoginPasienState extends Equatable {
  final String email;
  final String password;
  final String message;
  final bool rememberMe;
  final bool isLoading;
  final FormStatusEnum formStatus;
  final bool obsecurePassword;
  const LoginPasienState({
    required this.email,
    required this.password,
    required this.message,
    required this.rememberMe,
    required this.isLoading,
    required this.formStatus,
    required this.obsecurePassword,
  });

  LoginPasienState copyWith({
    String? email,
    String? password,
    String? message,
    bool? rememberMe,
    bool? isLoading,
    FormStatusEnum? formStatus,
    bool? obsecurePassword,
  }) {
    return LoginPasienState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      formStatus: formStatus ?? this.formStatus,
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        message,
        rememberMe,
        isLoading,
        formStatus,
        obsecurePassword,
      ];
}

class LoginPasienInitial extends LoginPasienState {
  static String emailInitial = '';
  static String passwordInitial = '';
  static String messageInitial = '';
  static bool rememberMeInitial = false;
  static bool isLoadingInitial = false;
  static FormStatusEnum formStatusInitial = FormStatusEnum.initForm;
  static bool obsecurePasswordInitial = true;

  LoginPasienInitial()
      : super(
          email: emailInitial,
          password: passwordInitial,
          message: messageInitial,
          rememberMe: rememberMeInitial,
          isLoading: isLoadingInitial,
          formStatus: FormStatusEnum.initForm,
          obsecurePassword: obsecurePasswordInitial,
        );
}
