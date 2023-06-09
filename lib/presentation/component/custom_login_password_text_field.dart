import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomLoginPasswordTextField extends StatelessWidget {
  const CustomLoginPasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPasienBloc, LoginPasienState>(
      builder: (context, loginForm) {
        return TextFormField(
          initialValue: loginForm.password,
          obscureText: loginForm.obsecurePassword,
          style: bSubtitle1.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          decoration: InputDecoration(
            // Wait Localization
            labelText: "Password",
            errorStyle: bCaption1.copyWith(color: bError),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 20.0),
              child: GestureDetector(
                onTap: (() => context.read<LoginPasienBloc>().add(
                      LoginFormObsecurePasswordChanged(
                        obsecure: !loginForm.obsecurePassword,
                      ),
                    )),
                child: SvgPicture.asset(
                  (loginForm.obsecurePassword)
                      ? "assets/eyeSlash.svg"
                      : "assets/eye-slash.svg",
                  // color: ThemeData.from(context).colorScheme.tertiary,
                  height: 24.0,
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 15.0,
              ),
              child: SvgPicture.asset(
                "assets/password.svg",
                // color: Theme.of(context).colorScheme.tertiary,
                height: 24.0,
              ),
            ),
          ),
          // Validator must be check
          validator: (text) {
            if (text == null || text.isEmpty) {
              // Wait Localization
              return "Please enter some text";
            } else if (text.length < 8) {
              // Wait Localization
              return "Length must be min 8 char";
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (text) => context.read<LoginPasienBloc>().add(
                LoginFormPasswordChanged(
                  password: text,
                ),
              ),
        );
      },
    );
  }
}
