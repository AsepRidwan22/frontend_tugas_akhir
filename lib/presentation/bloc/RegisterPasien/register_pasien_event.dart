part of 'register_pasien_bloc.dart';

abstract class RegisterPasienEvent extends Equatable {
  const RegisterPasienEvent();

  @override
  List<Object> get props => [];
}

class RegisterFormEmailChanged extends RegisterPasienEvent {
  final String email;

  const RegisterFormEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class RegisterFormPasswordChanged extends RegisterPasienEvent {
  final String password;

  const RegisterFormPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RegisterFormValidationPasswordChanged extends RegisterPasienEvent {
  final String password;

  const RegisterFormValidationPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RegisterFormNameChanged extends RegisterPasienEvent {
  final String name;

  const RegisterFormNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class RegisterFormObsecurePasswordChanged extends RegisterPasienEvent {
  final bool obsecure;
  const RegisterFormObsecurePasswordChanged({required this.obsecure});

  @override
  List<Object> get props => [obsecure];
}

class RegisterFormIsLoading extends RegisterPasienEvent {
  final bool isLoading;
  const RegisterFormIsLoading({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class OnEmailSignIn extends RegisterPasienEvent {
  const OnEmailSignIn();
  @override
  List<Object> get props => [];
}
