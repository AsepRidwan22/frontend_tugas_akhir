import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar_ver2.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_verification_text_field.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/services.dart';
class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    if (screenSize.width < 320.0 || screenSize.height < 650.0) {
      return Container();
    } else if (screenSize.width > 500.0) {
      // Tablet Mode (Must be repair)
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500.0),
          child: _buildVerificationScreen(context, screenSize),
        ),
      );
    } else {
      // Mobile Mode
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildVerificationScreen(context, screenSize),
        bottomSheet: _buildButtonVerifikasi(context, screenSize),
      );
    }
  }

  Widget _buildVerificationScreen(BuildContext context, Size screenSize) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            title: 'Verifikasi OTP',
            widthBar: screenSize.width,
            leadingIcon: "assets/appBarBack.svg",
            leadingOnTap: () {
              Navigator.pop(context);
            },
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.05,
            ),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: SvgPicture.asset(
                  "assets/envelope.svg",
                  height: 100.0,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.05,
            ),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Kode verifikasi telah dikirim ke Email anda Masukkan kode verifikasi di sini',
                  style: bSubtitle1.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.05,
            ),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomVerificationTextField(
                        focusNow: focus1,
                        focusNext: focus2,
                        field: 1,
                      ),
                      CustomVerificationTextField(
                        focusNow: focus2,
                        focusNext: focus3,
                        field: 2,
                      ),
                      CustomVerificationTextField(
                        focusNow: focus3,
                        focusNext: focus4,
                        field: 3,
                      ),
                      CustomVerificationTextField(
                        focusNow: focus4,
                        focusNext: focus4,
                        field: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: screenSize.height * 0.02),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Tidak menerima kode verifikasi?',
                  style: bSubtitle1.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.01,
              right: screenSize.width * 0.2,
              left: screenSize.width * 0.2,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //buatkan text untuk timer dan button untuk kirim ulang
                children: <Widget>[
                  Text(
                    '00:30',
                    style: bSubtitle1.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  CustomIconTextButton(
                      radiusAll: 28,
                      bgColor: bTextPrimary,
                      textColor: bTextSecondary,
                      borederColor: bPrimary,
                      width: screenSize.width * 0.2,
                      height: screenSize.height * 0.05,
                      text: "Kirim Ulang",
                      // isLoading: pasienLoginNotifier.isLoading,
                      // onTap: () => _loginPasien(pasienLoginNotifier),
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildButtonVerifikasi(BuildContext context, Size screenSize) {
  return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: CustomIconTextButton(
        radiusAll: 28,
        bgColor: bPrimary,
        width: screenSize.width * 0.9,
        text: "Verifikasi",
        // isLoading: pasienLoginNotifier.isLoading,
        // onTap: () => _loginPasien(pasienLoginNotifier),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const RegisterScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
      ));
}
