import 'package:flutter/material.dart';
import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_page_new.dart';
import 'package:frontend_tugas_akhir/presentation/pages/ringkasan_kesehatan.dart';
import 'package:frontend_tugas_akhir/presentation/provider/dokter_login_notifier.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_login_notifier.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:provider/provider.dart';

class LoginPageNew extends StatefulWidget {
  final String role;
  const LoginPageNew({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              title: 'Login ${widget.role}',
              widthBar: screenSize.width,
              leadingIcon: "assets/appBarBack.svg",
              leadingOnTap: () {
                Navigator.pop(context);
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 20, top: 80, bottom: 5),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Masuk",
                  style: bHeading4.copyWith(color: bPrimary),
                ),
              ),
            ),
            _customEditForm(
              context,
              "Email",
              CustomTextField(
                controller: _emailController,
                hint: "Masukkan Email",
                icon: "assets/email.svg",
                customAutofillHints: AutofillHints.email,
                validator: (item) {
                  if (item!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            _customEditForm(
              context,
              "Password",
              CustomTextField(
                controller: _passwordController,
                hint: "Masukkan Password",
                icon: "assets/password.svg",
                iconPassword: "assets/eye-slash.svg",
                customAutofillHints: AutofillHints.password,
                validator: (item) {
                  if (item!.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Consumer<PasienLoginNotifier>(
                      builder: (context, loginNotifier, _) {
                        return Row(
                          children: <Widget>[
                            Checkbox(
                              value: loginNotifier.rememberMe,
                              onChanged: (value) {
                                loginNotifier.rememberMe = value!;
                              },
                              activeColor: bPrimary,
                            ),
                            Text(
                              "Ingat Saya",
                              style: bSubtitle2.copyWith(color: bDarkGrey),
                            ),
                          ],
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const RegisterPageNew(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Lupa Password?",
                        style: bSubtitle2.copyWith(color: bPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: widget.role == "Pasien"
                      ? Consumer<PasienLoginNotifier>(
                          builder: (context, pasienLoginNotifier, _) {
                            return CustomIconTextButton(
                              radiusAll: 15,
                              bgColor: bPrimary,
                              width: screenSize.width,
                              text: "Masuk",
                              isLoading: pasienLoginNotifier.isLoading,
                              onTap: () => _loginPasien(pasienLoginNotifier),
                            );
                          },
                        )
                      : Consumer<DokterLoginNotifier>(
                          builder: (context, dokterLoginNotifier, _) {
                            return CustomIconTextButton(
                              radiusAll: 15,
                              bgColor: bPrimary,
                              width: screenSize.width,
                              text: "Masuk",
                              isLoading: dokterLoginNotifier.isLoading,
                              onTap: () => _loginDokter(dokterLoginNotifier),
                            );
                          },
                        ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              sliver: SliverToBoxAdapter(
                child: CustomIconTextButton(
                  radiusAll: 15,
                  bgColor: bSecondary,
                  width: screenSize.width,
                  text: "Daftar",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPageNew(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loginPasien(PasienLoginNotifier loginNotifier) async {
    if (_formKey.currentState!.validate()) {
      loginNotifier.isLoading = true;

      try {
        await loginNotifier.login(
          _emailController.text,
          _passwordController.text,
        );

        if (loginNotifier.state == RequestState.success) {
          _navigateToNextPage();
        } else {
          _showErrorSnackBar('Login gagal. Silakan coba lagi.');
        }
      } catch (error) {
        _showErrorSnackBar('Terjadi kesalahan. Silakan coba lagi.');
      }

      loginNotifier.isLoading = false;
    }
  }

  void _loginDokter(DokterLoginNotifier loginNotifier) async {
    if (_formKey.currentState!.validate()) {
      loginNotifier.isLoading = true;

      try {
        await loginNotifier.login(
          _emailController.text,
          _passwordController.text,
        );

        if (loginNotifier.state == RequestState.success) {
          _navigateToNextPage();
        } else {
          _showErrorSnackBar('Login gagal. Silakan coba lagi.');
        }
      } catch (error) {
        _showErrorSnackBar('Terjadi kesalahan. Silakan coba lagi.');
      }

      loginNotifier.isLoading = false;
    }
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const RingkasanKesehatan(),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _customEditForm(BuildContext context, String title, Widget child) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: bHeading6.copyWith(color: bTextSecondary),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
