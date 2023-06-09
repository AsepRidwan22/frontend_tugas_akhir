import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomLoginUsernameTextField extends StatelessWidget {
  const CustomLoginUsernameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return BlocBuilder<LoginPasienBloc, LoginPasienState>(
      builder: (context, loginForm) {
        String email = loginForm.email; // Mengambil nilai email dari state

        return TextFormField(
          initialValue: email,
          cursorColor: Theme.of(context).colorScheme.tertiary,
          style: bSubtitle1.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          decoration: InputDecoration(
            labelText: "Email",
            errorStyle: bCaption1.copyWith(color: bError),
            hintText: "your@gmail.com",
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 15.0,
              ),
              child: SvgPicture.asset(
                "assets/email.svg",
                height: 24.0,
              ),
            ),
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "Please enter your email";
            }
            if (!emailRegex.hasMatch(text)) {
              return "Please enter a valid email address";
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          onChanged: (text) {
            context.read<LoginPasienBloc>().add(
                  LoginFormEmailChanged(
                    email: text,
                  ),
                );
          },
        );
      },
    );
  }
}
