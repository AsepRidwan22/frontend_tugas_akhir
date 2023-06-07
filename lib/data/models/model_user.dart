import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String password;
  final String name;

  const UserModel({
    required this.email,
    required this.password,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      name: json["name"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "password": password,
    };
  }

  // User toEntity() {
  //   return User(
  //     email: this.email,
  //     name: this.name,
  //     password: this.password,
  //   );
  // }

  User toEntity() {
    return User(
      email: email,
      name: name,
      password: password,
    );
  }

  @override
  List<Object?> get props => [email, password, name];
}
