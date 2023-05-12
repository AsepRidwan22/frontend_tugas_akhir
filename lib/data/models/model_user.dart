import 'package:frontend_tugas_akhir/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  // print("masuk ke model");
  const UserModel({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "password": password,
      };

  User toEntity() {
    return User(
      email: this.email,
      name: this.name,
      password: this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];

  map(Function(dynamic model) param0) {}
}
