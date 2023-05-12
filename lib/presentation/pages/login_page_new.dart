import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_page_new.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:frontend_tugas_akhir/presentation/provider/user_login_notifier.dart';
import 'package:frontend_tugas_akhir/common/state_enum.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({super.key});

  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  String? email;
  String? password;
  bool isChecked = false;
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final _formKey = GlobalKey<FormState>();
  // final _isObscured = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool _isObscured = true;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Consumer<UserLoginNotifier>(builder: (context, data, child) {
        return Container(
          // constraints: const BoxConstraints(maxWidth: 500),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              // physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                CustomAppBar(
                  title: 'Login',
                  widthBar: screenSize.width,
                  leadingIcon: "assets/appBarBack.svg",
                  leadingOnTap: () {
                    Navigator.pop(context);
                  },
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 60, bottom: 50),
                  sliver: SliverToBoxAdapter(
                      child: SvgPicture.asset(
                    "assets/Logo.svg",
                    height: 48,
                  )),
                ),
                _customEditForm(
                    context,
                    "Email",
                    CustomTextField(
                        hint: "Masukan Email",
                        icon: "assets/email.svg",
                        validator: (item) {
                          if (item!.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else if (!emailRegex.hasMatch(item)) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                        onChange: ((item) {
                          setState(() {
                            email = item;
                          });
                          if (email != null) {
                            print(email);
                          }
                        }))),
                _customEditForm(
                    context,
                    "Password",
                    CustomTextField(
                        hint: "Masukan Password",
                        icon: "assets/password.svg",
                        iconPassword: "assets/eye-slash.svg",
                        validator: (item) {
                          if (item!.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          // else if (!passwordRegex.hasMatch(item)) {
                          //   return 'Password tidak valid';
                          // }
                          return null;
                        },
                        onChangeIcon: ((item) {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        }),
                        onChange: ((item) {
                          setState(() {
                            password = item;
                          });
                          if (password != null) {
                            print(password);
                          }
                        }))),
                SliverPadding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Ingat Saya",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  sliver: SliverToBoxAdapter(
                    child: CustomIconTextButton(
                      radiusAll: 15,
                      bgColor: bgBtnSecondary,
                      width: screenSize.width,
                      text: "Masuk",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<UserLoginNotifier>(context, listen: false)
                              .login(email, password);
                        }
                      },
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  sliver: SliverToBoxAdapter(
                    child: CustomIconTextButton(
                      radiusAll: 15,
                      bgColor: bgBtnSecondary,
                      width: screenSize.width,
                      text: "Daftar",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPageNew()),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Consumer<UserLoginNotifier>(
                    builder: (context, data, child) {
                      if (data.state == RequestState.Loading) {
                        return CircularProgressIndicator();
                      } else if (data.state == RequestState.Success) {
                        // Navigator.pushReplacementNamed(context, '/register');
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPageNew()),
                          );
                        });
                        return Container();
                      } else {
                        print("gagal bro");
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _customEditForm(
    BuildContext context, String pleaceHolder, Widget textField) {
  return SliverPadding(
    padding: const EdgeInsets.only(
      top: 10.0,
      left: 20.0,
      right: 20.0,
    ),
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            pleaceHolder,
            style: textStyleBuilder(15, FontWeight.w500)
                .copyWith(color: labelForm),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: textField,
          ),
        ],
      ),
    ),
  );
}
