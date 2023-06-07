import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/services.dart';

class HalamanAwal extends StatefulWidget {
  const HalamanAwal({super.key});

  @override
  State<HalamanAwal> createState() => _HalamanAwalState();
}

class _HalamanAwalState extends State<HalamanAwal> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.only(top: 100),
            sliver: SliverToBoxAdapter(
                child: SvgPicture.asset(
              "assets/Logo.svg",
              height: 48,
              color: bPrimary,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 70),
            sliver: SliverToBoxAdapter(
                child: SvgPicture.asset(
              "assets/ImageCover.svg",
              height: 208,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 40),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Peduli Diabetes',
                  style: bHeading3.copyWith(color: bPrimary),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 40, right: 35, left: 35),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text(
                    'Tindakan dan sikap yang bertujuan untuk memberikan perhatian dan perawatan yang tepat kepada penderita diabetes',
                    textAlign: TextAlign.center,
                    style: bSubtitle1.copyWith(color: bTextSecondary)),
              ),
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
                  MaterialPageRoute(
                      builder: (context) => const LoginPageNew(
                            role: 'Pasien',
                          )),
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
                      builder: (context) => const LoginPageNew(
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
