import 'package:flutter/material.dart';
import 'package:frontend_tugas_akhir/common/form_enum.dart';
// import 'package:frontend_tugas_akhir/common/form_enum.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/common/state_enum.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/RegisterPasien/register_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_toast.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/provider/pasien_register_notifier.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp usernameRegex = RegExp(r'^(?=.*[0-9])[a-zA-Z0-9_]{8,20}$');
  final RegExp passwordRegex =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  final _formKey = GlobalKey<FormState>();
  final toast = FToast();

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
      // resizeToAvoidBottomInset: false,
      body: BlocListener<RegisterPasienBloc, RegisterPasienState>(
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
                  builder: (context) => const LoginScreen(
                    role: 'Pasien',
                  ),
                ),
                (route) => false,
              );
            });
          }
        },
        child: BlocBuilder<RegisterPasienBloc, RegisterPasienState>(
            builder: (context, state) {
          return Form(
            key: _formKey,
            child: CustomScrollView(
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
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                ),
                _customEditForm(
                  context,
                  "Email",
                  CustomTextField(
                    label: 'Email',
                    hint: "Masukan Email",
                    initialValue: state.email,
                    obsecure: false,
                    prefixIcon: 'assets/email.svg',
                    validator: (item) => item!.isEmpty
                        ? 'Email tidak boleh kosong'
                        : !emailRegex.hasMatch(item)
                            ? 'Email tidak valid'
                            : null,
                    onChanged: (text) {
                      context.read<RegisterPasienBloc>().add(
                            RegisterFormEmailChanged(
                              email: text,
                            ),
                          );
                    },
                  ),
                ),
                _customEditForm(
                  context,
                  "Username",
                  CustomTextField(
                    label: 'Username',
                    hint: "Masukan Username",
                    initialValue: state.name,
                    obsecure: false,
                    prefixIcon: 'assets/prefixProfile.svg',
                    validator: (item) => item!.isEmpty
                        ? 'Username tidak boleh kosong'
                        : !usernameRegex.hasMatch(item)
                            ? 'Harus mengandung angka dan huruf minimal 8 karakter'
                            : null,
                    onChanged: (text) {
                      context.read<RegisterPasienBloc>().add(
                            RegisterFormNameChanged(
                              name: text,
                            ),
                          );
                    },
                  ),
                ),
                _customEditForm(
                  context,
                  "Password",
                  CustomTextField(
                    label: 'Password',
                    hint: "Masukkan Password",
                    initialValue: state.password,
                    prefixIcon: 'assets/password.svg',
                    isPassword: false,
                    obsecure: true,
                    validator: (item) => item!.isEmpty
                        ? 'Password tidak boleh kosong'
                        : !passwordRegex.hasMatch(item)
                            ? 'Harus mengandung angka dan huruf minimal 8 karakter'
                            : null,
                    onChanged: (text) {
                      context.read<RegisterPasienBloc>().add(
                            RegisterFormPasswordChanged(password: text),
                          );
                    },
                  ),
                ),
                _customEditForm(
                  context,
                  "Validasi Password",
                  CustomTextField(
                    label: 'Validasi Password',
                    hint: "Masukkan Validasi Password",
                    initialValue: state.validationPassword,
                    prefixIcon: 'assets/password.svg',
                    isPassword: true,
                    obsecure: state.obsecurePassword,
                    validator: (item) => item!.isEmpty
                        ? 'Validasi Password tidak boleh kosong'
                        : item != state.password
                            ? 'Harus sama dengan password diatas'
                            : null,
                    onTogglePassword: (obsecure) {
                      context.read<RegisterPasienBloc>().add(
                            RegisterFormObsecurePasswordChanged(
                                obsecure: obsecure),
                          );
                    },
                    onChanged: (text) {
                      context.read<RegisterPasienBloc>().add(
                            RegisterFormValidationPasswordChanged(
                                password: text),
                          );
                    },
                  ),
                ),
                BlocBuilder<RegisterPasienBloc, RegisterPasienState>(
                  builder: (context, state) {
                    return SliverPadding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      sliver: SliverToBoxAdapter(
                        child: CustomIconTextButton(
                          radiusAll: 15,
                          bgColor: bSecondaryVariant1,
                          width: screenSize.width,
                          isLoading: state.isLoading,
                          text: "Daftar",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print('ontap jalan');
                              context
                                  .read<RegisterPasienBloc>()
                                  .add(const OnEmailSignIn());
                            } else {
                              toastError('Lengkapi data anda');
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

Widget _customEditForm(
  BuildContext context,
  String title,
  Widget child,
) {
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
