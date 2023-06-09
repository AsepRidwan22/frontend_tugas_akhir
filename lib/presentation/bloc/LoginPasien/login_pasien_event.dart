part of 'login_pasien_bloc.dart';

abstract class LoginPasienEvent extends Equatable {
  const LoginPasienEvent();

  @override
  List<Object> get props => [];
}

class LoginFormEmailChanged extends LoginPasienEvent {
  final String email;

  const LoginFormEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginFormPasswordChanged extends LoginPasienEvent {
  final String password;

  const LoginFormPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginPasienRememberMeChanged extends LoginPasienEvent {
  final bool rememberMe;
  const LoginPasienRememberMeChanged({required this.rememberMe});

  @override
  List<Object> get props => [rememberMe];
}

// class OnSaveRememberme extends LoginPasienEvent {
//   const OnSaveRememberme();
//   @override
//   List<Object> get props => [];
// }

class OnEmailSignIn extends LoginPasienEvent {
  const OnEmailSignIn();
  @override
  List<Object> get props => [];
}

class LoginFormObsecurePasswordChanged extends LoginPasienEvent {
  final bool obsecure;
  const LoginFormObsecurePasswordChanged({required this.obsecure});

  @override
  List<Object> get props => [obsecure];
}

// class LoginFailure extends LoginPasienEvent {
//   final String errorMessage;
//   const LoginFailure({required this.errorMessage});

//   @override
//   List<Object> get props => [errorMessage];
// }

// class LoginFailureEvent extends LoginPasienEvent {
//   final String errorMessage;

//   LoginFailureEvent(this.errorMessage);

//   @override
//   List<Object> get props => [errorMessage];
// }
