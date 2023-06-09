import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_register_notifier.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:provider/provider.dart';

class RegisterPageNew extends StatefulWidget {
  const RegisterPageNew({super.key});

  @override
  State<RegisterPageNew> createState() => _RegisterPageNewState();
}

class _RegisterPageNewState extends State<RegisterPageNew> {
  late String? email;
  late String? name;
  late String? password;
  // String? username;
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
  final RegExp passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          CustomAppBar(
            title: 'Register',
            widthBar: screenSize.width,
            leadingIcon: "assets/appBarBack.svg",
            leadingOnTap: () {
              Navigator.pop(context);
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
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
                  validator: (item) {
                    if (item!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!emailRegex.hasMatch(item)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  hint: "Masukan Email",
                  onChange: ((item) {
                    setState(() {
                      email = item;
                    });
                    // print(email);
                  }))),
          _customEditForm(
              context,
              "Username",
              CustomTextField(
                  hint: "Masukan Username",
                  validator: (item) {
                    if (item!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!usernameRegex.hasMatch(item)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  onChange: ((item) {
                    setState(() {
                      name = item;
                    });
                    // print(name);
                    // if (name != null) {
                    //   print(name);
                    // }
                  }))),
          _customEditForm(
              context,
              "Password",
              CustomTextField(
                  hint: "Masukan Password",
                  validator: (item) {
                    if (item!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!passwordRegex.hasMatch(item)) {
                      return 'Email tidak valid';
                    }
                    return null;
                  },
                  iconPassword: "assets/eye-slash.svg",
                  onChange: ((item) {
                    setState(() {
                      password = item;
                    });
                    // print(password);
                  }))),
          // _customEditForm(
          //     context,
          //     "Verifikasi Password",
          //     CustomTextField(
          //         hint: "Masukan Verifikasi Password",
          //         validator: (item) {
          //           if (item!.isEmpty) {
          //             return 'Password tidak boleh kosong';
          //           } else if (password != item) {
          //             return 'Password tidak sesuai';
          //           }
          //           return null;
          //         },
          //         iconPassword: "assets/eye-slash.svg",
          //         onChange: ((item) {
          //           if (item != null) {
          //             print(item);
          //           }
          //         }))),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            sliver: SliverToBoxAdapter(
              child: CustomIconTextButton(
                radiusAll: 15,
                bgColor: bSecondaryVariant1,
                width: screenSize.width,
                text: "Daftar",
                onTap: () {
                  print("parameter $email $name $password ");
                  if (email != null && name != null && password != null) {}
                  if (_formKey.currentState!.validate()) {
                    Provider.of<UserRegisterNotifier>(context, listen: false)
                        .register(email, name, password);
                  }
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<UserRegisterNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.loading) {
                  return const CircularProgressIndicator();
                } else if (data.state == RequestState.success) {
                  print("berhasil bro");
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
