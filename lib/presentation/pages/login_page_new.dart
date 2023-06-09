import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_tugas_akhir/common/failure.dart';
// import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_login_email_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_login_password_text_field.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_toast.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_page_new.dart';
import 'package:frontend_tugas_akhir/presentation/pages/ringkasan_kesehatan.dart';
// import 'package:frontend_tugas_akhir/presentation/provider/dokter_login_notifier.dart';
// import 'package:frontend_tugas_akhir/presentation/provider/pasien_login_notifier.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
// import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/form_enum.dart';

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
  final _formKey = GlobalKey<FormState>();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void toastError(String message) => toast.showToast(
      child: CustomToast(
        logo: "assets/exclamation-circle.svg",
        message: message,
        toastColor: bToastFiled,
        bgToastColor: bBgToastFiled,
        borderToastColor: bBorderToastFiled,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3));

  void toastSuccess(String message) {
    toast.showToast(
        child: CustomToast(
          logo: "assets/check-circle.svg",
          message: message,
          toastColor: bToastSuccess,
          bgToastColor: bBgToastSuccess,
          borderToastColor: bBorderToastSuccess,
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListener<LoginPasienBloc, LoginPasienState>(
        listenWhen: (previous, current) {
          if (previous.formStatus == FormStatusEnum.submittingForm) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state.formStatus == FormStatusEnum.failedSubmission) {
            // _showSnackBar(state.message, Colors.red);
            // if (state.message is ServerFailure) {
            //   toastError(state.message);
            // }
            toastError(state.message);
          } else if (state.formStatus == FormStatusEnum.successSubmission) {
            Future(() {
              // _showSnackBar(state.message, Colors.green);
              toastSuccess(state.message);
              // print('sukses login');
            }).then((value) {
              // context.read<DashboardBloc>().add(const IsLogInSave(value: true));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RingkasanKesehatan(),
                ),
              );
            });
          }
        },
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    "assets/backgroundawal.svg", // Ganti dengan path file SVG latar belakang yang Anda miliki
                    fit: BoxFit.cover,
                    width: screenSize.width * 1.5,
                  ),
                ),
              ),
              CustomScrollView(
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
                    padding:
                        const EdgeInsets.only(left: 20, top: 80, bottom: 5),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        "Masuk",
                        style: bHeading4.copyWith(color: bPrimary),
                      ),
                    ),
                  ),
                  _customEditForm(
                      context, "Email", const CustomLoginUsernameTextField()),
                  _customEditForm(context, "Password",
                      const CustomLoginPasswordTextField()),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildCheckBox(),
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
                    padding:
                        const EdgeInsets.only(top: 30, right: 20, left: 20),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                          child: widget.role == "Pasien"
                              ? CustomIconTextButton(
                                  radiusAll: 15,
                                  bgColor: bPrimary,
                                  width: screenSize.width,
                                  text: "Masuk",
                                  // isLoading: pasienLoginNotifier.isLoading,
                                  // onTap: () => _loginPasien(pasienLoginNotifier),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<LoginPasienBloc>()
                                          .add(const OnEmailSignIn());
                                      // });
                                    } else {
                                      toastError('Lengkapi data anda');
                                    }
                                  },
                                )
                              : CustomIconTextButton(
                                  radiusAll: 15,
                                  bgColor: bPrimary,
                                  width: screenSize.width,
                                  text: "Masuk",
                                  // isLoading: pasienLoginNotifier.isLoading,
                                  // onTap: () => _loginPasien(pasienLoginNotifier),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<LoginPasienBloc>()
                                          .add(const OnEmailSignIn());
                                      // try {
                                      //   context
                                      //       .read<LoginPasienBloc>()
                                      //       .add(const OnEmailSignIn());
                                      // } catch (e) {
                                      //   context.read<LoginPasienBloc>().add(
                                      //       LoginFailure(
                                      //           errorMessage: e.toString()));
                                      // }
                                    } else {
                                      // Text wait localization
                                      // toastError(AppLocalizations.of(context)!.complateYourData);
                                    }
                                  },
                                )),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
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
            ],
          ),
        ),
      ),
    );
  }

  // void _showSnackBar(String message, Color color) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       backgroundColor: color,
  //     ),
  //   );
  // }

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

  Widget _buildCheckBox() {
    return BlocBuilder<LoginPasienBloc, LoginPasienState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<LoginPasienBloc>().add(
                LoginPasienRememberMeChanged(
                  rememberMe: !state.rememberMe,
                ),
              ),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                  value: state.rememberMe,
                  onChanged: (value) => context.read<LoginPasienBloc>().add(
                        LoginPasienRememberMeChanged(
                          rememberMe: value!,
                        ),
                      ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              // Text wait localization
              Text(
                'ingat saya',
                style: bBody1.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
