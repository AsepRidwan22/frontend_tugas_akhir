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
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          _customAppBar("Ringkasan Kesehatan", 'assets/notifikasi.svg'),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                  decoration: customBoxDecoration03(bPrimary),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        decoration: BoxDecoration(
                          color: bTextPrimary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Gemuk', //status
                              style: textStyleBuilder(18, FontWeight.w600)
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SvgPicture.asset(
                              "assets/Gemuk1.svg",
                              width: 40.0,
                              // color: bTextPrimary,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _customDataKondisiTubuh(
                                context, 'Tinggi Badan', '170', 'cm'),
                            const SizedBox(
                              height: 10,
                            ),
                            _customDataKondisiTubuh(
                                context, 'Berat Badan', '47', 'kg'),
                            const SizedBox(
                              height: 10,
                            ),
                            _customDataKondisiTubuh(context, 'BMI', '25', 'kg'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _customDataKondisiTubuh(
                                context, 'Umur', '22', 'thn'), //umur
                            const SizedBox(
                              height: 10,
                            ),
                            _customDataKondisiTubuh(context, 'Berat Ideal',
                                '60-65', 'kg'), //bb min & max
                            const SizedBox(
                              height: 10,
                            ),
                            _customDataKondisiTubuh(context, 'BMI Ideal',
                                '23-28', 'kg'), //bmi min & max
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kebutuhan Kalori Harian',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: customBoxDecoration03(bTextPrimary),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _customKebutuhanKalori(
                        context, 'assets/ringanIcon.svg', 'Ringan', '900'),
                    const SizedBox(
                      height: 10,
                    ),
                    _customKebutuhanKalori(
                        context, 'assets/sedangIcon.svg', 'Ringan', '900'),
                    const SizedBox(
                      height: 10,
                    ),
                    _customKebutuhanKalori(
                        context, 'assets/beratIcon.svg', 'Ringan', '900'),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistik',
                    style: bSubtitle3.copyWith(color: bGrey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tekanan Darah',
                    style: bSubtitle3.copyWith(color: bTextSecondary),
                  ),
                ],
              ),
            ),
          ),
          //buatkan sliverpadding dengan row yang berisi 2 buah column
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: customBoxDecoration03(bTextPrimary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Sistolik',
                              style: bSubtitle1.copyWith(
                                  color: bGrey, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "assets/iconHeart.svg",
                              width: 24.0,
                              height: 24.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '120',
                              style: bSubtitle1.copyWith(
                                  color: bGrey, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'mmHg',
                              style: bBody2.copyWith(
                                  color: bGrey, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset(
                          "assets/diagramSistolik.svg",
                          width: 130.0,
                          // height: 24.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: customBoxDecoration03(bTextPrimary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Diastolik',
                              style: bSubtitle1.copyWith(
                                  color: bGrey, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              "assets/iconHeart.svg",
                              width: 24.0,
                              height: 24.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '120',
                              style: bSubtitle1.copyWith(
                                  color: bGrey, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'mmHg',
                              style: bBody2.copyWith(
                                  color: bGrey, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset(
                          "assets/diagramSistolik.svg",
                          width: 130.0,
                          // height: 24.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: customBoxDecoration03(bPrimary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/iconHeart.svg",
                          color: bTextPrimary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hipertensi', //keterangan hipertensi
                          style: bSubtitle3.copyWith(color: bTextPrimary),
                        ),
                      ],
                    ),
                    //buatkan button untuk melihat detail
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        decoration: BoxDecoration(
                          color: bSecondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Target',
                          style: bButton1.copyWith(color: bPrimaryVariant1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori basal :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori Umur :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori Jenis Kelamin :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori Berat Badan :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori Aktivitas :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori dikurangi :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kalori Total :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Keterangan Diabetes :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Persentase lemak tubuh :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Status Tekanan Darah :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Resiko Jantung :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Kolesterol :',
                style: bSubtitle2.copyWith(color: bPrimaryVariant1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _customDataKondisiTubuh(
    BuildContext context, String label, String data, String satuan) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        label,
        style: bBody2.copyWith(color: bPrimaryVariant2),
      ),
      Row(
        children: [
          Text(
            data,
            style: bSubtitle1.copyWith(
                color: bTextPrimary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            satuan,
            style: bBody2.copyWith(
                color: bLightGrey, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    ],
  );
}

Widget _customKebutuhanKalori(
    BuildContext context, String customIcon, String title, String kalori) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 64,
        height: 64,
        child: Center(
          child: CircleAvatar(
            radius: 32,
            backgroundColor: bPrimaryVariant2,
            child: SvgPicture.asset(
              customIcon,
              width: 70.0,
              // color: bTextPrimary,
            ),
          ),
        ),
      ),
      Text(title,
          style: bSubtitle1.copyWith(
              color: textFourth, fontWeight: FontWeight.bold)),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            kalori,
            style:
                bSubtitle1.copyWith(color: bGrey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            'kCal',
            style: bBody2.copyWith(color: bPrimary),
          ),
        ],
      ),
    ],
  );
}

Widget _customAppBar(String label, String iconBar) {
  return SliverPadding(
    padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
    sliver: SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ringkasan Kesehatan',
            style: bHeading7.copyWith(color: bPrimaryVariant1),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/notifikasi.svg",
                // color: Colors.black,
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
