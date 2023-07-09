import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final String label;
  final String hint;
  final String prefixIcon;
  final bool? isPassword;
  final bool obsecure;
  final void Function(bool)? onTogglePassword;

  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.label,
    this.initialValue,
    required this.hint,
    required this.prefixIcon,
    required this.onChanged,
    this.isPassword,
    required this.obsecure,
    this.onTogglePassword,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    // String email = loginForm.email; // Mengambil nilai email dari state

    return TextFormField(
      // initialValue: initialValue,
      cursorColor: Theme.of(context).colorScheme.tertiary,
      style: bSubtitle1.copyWith(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      obscureText: obsecure,
      decoration: InputDecoration(
          labelText: label,
          errorStyle: bCaption1.copyWith(color: bError),
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 15.0,
            ),
            child: SvgPicture.asset(
              prefixIcon,
              height: 24.0,
            ),
          ),
          suffixIcon: (isPassword == true)
              ? Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 20.0),
                  child: GestureDetector(
                    onTap: () => onTogglePassword!(!obsecure),
                    child: SvgPicture.asset(
                      (obsecure)
                          ? "assets/eyeSlash.svg"
                          : "assets/eye-slash.svg",
                      // color: ThemeData.from(context).colorScheme.tertiary,
                      height: 24.0,
                    ),
                  ),
                )
              : null),
      validator: validator ?? (value) => null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
    );
  }
}
