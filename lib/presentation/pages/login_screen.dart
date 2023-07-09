import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend_tugas_akhir/presentation/bloc/Dashboard/dashboard_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_login_email_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_login_password_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_toast.dart';
import 'package:frontend_tugas_akhir/presentation/pages/dashboard_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/register_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/verification_screen.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/form_enum.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      resizeToAvoidBottomInset: false,
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
            toastError(state.message);
          } else if (state.formStatus == FormStatusEnum.successSubmission) {
            Future(() {
              toastSuccess(state.message);
            }).then((value) {
              // context.read<DashboardBloc>().add(const IsLogInSave(value: true));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
                (route) => false,
              );
            });
          }
        },
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
            Form(
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
                    padding: EdgeInsets.only(
                        left: 20,
                        top: screenSize.height * 0.1,
                        bottom: screenSize.height * 0.01),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              ? BlocBuilder<LoginPasienBloc, LoginPasienState>(
                                  builder: (context, state) {
                                  return CustomIconTextButton(
                                    radiusAll: 15,
                                    bgColor: bPrimary,
                                    width: screenSize.width,
                                    text: "Masuk",
                                    isLoading: state.isLoading,
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
                                  );
                                })
                              : CustomIconTextButton(
                                  radiusAll: 10,
                                  bgColor: bPrimary,
                                  width: screenSize.width,
                                  text: "Masuk",
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginPasienBloc>();
                                    } else {
                                      // Text wait localization
                                      // toastError(AppLocalizations.of(context)!.complateYourData);
                                    }
                                  },
                                )),
                    ),
                  ),
                  widget.role == 'Pasien'
                      ? SliverPadding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          sliver: SliverToBoxAdapter(
                            child: CustomIconTextButton(
                              radiusAll: 15,
                              bgColor: bSecondary,
                              width: screenSize.width,
                              text: "Daftar",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        VerificationScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 0,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customEditForm(BuildContext context, String title, Widget child) {
    Size screenSize = MediaQuery.of(context).size;
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: screenSize.height * 0.01),
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
              // SizedBox(
              //   height: 24.0,
              //   width: 24.0,
              //   child: Checkbox(
              //     // checkColor: Colors.transparent,
              //     fillColor: ,
              //     value: state.rememberMe,
              //     onChanged: (value) => context.read<LoginPasienBloc>().add(
              //           LoginPasienRememberMeChanged(
              //             rememberMe: value!,
              //           ),
              //         ),
              //   ),
              // ),
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
