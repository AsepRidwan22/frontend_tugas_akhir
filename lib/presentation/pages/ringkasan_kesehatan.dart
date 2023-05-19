import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class RingkasanKesehatan extends StatefulWidget {
  const RingkasanKesehatan({super.key});

  @override
  State<RingkasanKesehatan> createState() => _RingkasanKesehatanState();
}

class _RingkasanKesehatanState extends State<RingkasanKesehatan> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
          child: Container(
        child: CustomScrollView(
          // physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Ringkasan Kesehatan',
                        style: textStyleBuilder(18, FontWeight.w600),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/notifikasi.svg",
                          color: Colors.black,
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              sliver: SliverToBoxAdapter(
                child: Container(
                    color: bgBtnSecondary,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: primary,
                          padding: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Text(
                                  //harus diperbaiki
                                  'Gemuk',
                                  style: textStyleBuilder(18, FontWeight.w600)
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // SvgPicture.asset(
                                //   "assets/fat1.svg",
                                //   height: 100.0,
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          color: primary,
                          padding: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Text(
                                  //harus diperbaiki
                                  'Gemuk',
                                  style: textStyleBuilder(18, FontWeight.w600)
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // SvgPicture.asset(
                                //   "assets/fat1.svg",
                                //   height: 80.0,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
