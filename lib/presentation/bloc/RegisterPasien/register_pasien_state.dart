part of 'register_pasien_bloc.dart';

class RegisterPasienState extends Equatable {
  final String email;
  final String name;
  final String password;
  final String validationPassword;
  final String message;
  final FormStatusEnum formStatus;
  final bool obsecurePassword;
  final bool isLoading;
  const RegisterPasienState({
    required this.email,
    required this.name,
    required this.password,
    required this.validationPassword,
    required this.message,
    required this.formStatus,
    required this.obsecurePassword,
    required this.isLoading,
  });

  RegisterPasienState copyWith({
    String? email,
    String? name,
    String? password,
    String? validationPassword,
    String? message,
    bool? rememberMe,
    bool? isLoading,
    FormStatusEnum? formStatus,
    bool? obsecurePassword,
  }) {
    return RegisterPasienState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      validationPassword: validationPassword ?? this.validationPassword,
      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      obsecurePassword: obsecurePassword ?? this.obsecurePassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        email,
        name,
        password,
        validationPassword,
        message,
        formStatus,
        obsecurePassword,
        isLoading,
      ];
}

class RegisterPasienInitial extends RegisterPasienState {
  static String emailInitial = '';
  static String nameInitial = '';
  static String passwordInitial = '';
  static String validationPasswordInitial = '';
  static String messageInitial = '';
  static bool rememberMeInitial = false;
  static bool isLoadingInitial = false;
  static FormStatusEnum formStatusInitial = FormStatusEnum.initForm;
  static bool obsecurePasswordInitial = true;

  RegisterPasienInitial()
      : super(
          email: emailInitial,
          name: nameInitial,
          password: passwordInitial,
          validationPassword: validationPasswordInitial,
          message: messageInitial,
          formStatus: FormStatusEnum.initForm,
          obsecurePassword: obsecurePasswordInitial,
          isLoading: isLoadingInitial,
        );
}
