import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/dashboard_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_screen.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class HalamanAwalScreen extends StatefulWidget {
  const HalamanAwalScreen({super.key});

  @override
  State<HalamanAwalScreen> createState() => _HalamanAwalScreenState();
}

class _HalamanAwalScreenState extends State<HalamanAwalScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.1),
            child: SvgPicture.asset(
              "assets/Logo.svg",
              height: 48,
              // color: bPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.05),
            child: SvgPicture.asset(
              "assets/ImageCover.svg",
              height: 208,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.1),
            child: Center(
              child: Text(
                'Peduli Diabetes',
                style: bHeading3.copyWith(color: bPrimary),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.05),
            child: Center(
              child: Text(
                  'Tindakan dan sikap yang bertujuan untuk memberikan perhatian dan perawatan yang tepat kepada penderita diabetes',
                  textAlign: TextAlign.center,
                  style: bSubtitle1.copyWith(color: bTextSecondary)),
            ),
          )
        ],
      )),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconTextButton(
              height: 50,
              radiusLeft: 15,
              width: screenSize.width / 2.2,
              bgColor: bPrimary,
              text: "Pasien",
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(
                      role: 'Pasien',
                    ),
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
            ),
            // Text('data', style: bHeading3,),
            CustomIconTextButton(
              height: 50,
              radiusRight: 15,
              bgColor: bSecondaryVariant1,
              width: screenSize.width / 2.2,
              text: "Dokter",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen(
                            role: 'Dokter',
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
