import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

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
          child: Container(
        child: CustomScrollView(
          // physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 10),
              sliver: SliverToBoxAdapter(
                  child: SvgPicture.asset(
                "assets/Logo.svg",
                height: 48,
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 70),
              sliver: SliverToBoxAdapter(
                  child: SvgPicture.asset(
                "assets/ImageCover.svg",
                height: 208,
              )),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 40),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text('Peduli Diabetes',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 40, right: 35, left: 35),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                      'Tindakan dan sikap yang bertujuan untuk memberikan perhatian dan perawatan yang tepat kepada penderita diabetes',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
            )
          ],
        ),
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
              bgColor: primary,
              text: "Pasien",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageNew()),
                );
              },
            ),
            CustomIconTextButton(
              height: 50,
              radiusRight: 15,
              bgColor: bgBtnSecondary,
              width: screenSize.width / 2.2,
              text: "Dokter",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPageNew()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
