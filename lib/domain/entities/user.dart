import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String password;
  final int? idRole;
  final int? status;

  const User({
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    this.idRole,
    this.status,
  });

  @override
  List<Object?> get props => [name, email, emailVerifiedAt, idRole, status];
}
