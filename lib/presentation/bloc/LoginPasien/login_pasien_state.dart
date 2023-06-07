part of 'login_pasien_bloc.dart';

class LoginPasienState extends Equatable {
  final String email;
  final String password;
  final String message;
  final bool rememberMe;
  final bool isLoading;
  // final FromStatusEnum fromStatus;
  const LoginPasienState({
    required this.email,
    required this.password,
    required this.message,
    required this.rememberMe,
    required this.isLoading,
    // required this.fromStatus,
  });

  LoginPasienState copyWith({
    String? email,
    String? password,
    String? message,
    bool? rememberMe,
    bool? isLoading,
    // FromStatusEnum? fromStatus,
  }) {
    return LoginPasienState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      // fromStatus: fromStatus ?? this.fromStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        message,
        rememberMe,
        isLoading,
        // fromStatus,
      ];
}

class LoginPasienInitial extends LoginPasienState {
  static String emailInitial = '';
  static String passwordInitial = '';
  static String messageInitial = '';
  static bool rememberMeInitial = false;
  static bool isLoadingInitial = false;
  // static FromStatusEnum fromStatusInitial = FromStatusEnum.login;

  const LoginPasienInitial()
      : super(
          email: '',
          password: '',
          message: '',
          rememberMe: false,
          isLoading: false,
          // fromStatus: FromStatusEnum.login,
        );
}
