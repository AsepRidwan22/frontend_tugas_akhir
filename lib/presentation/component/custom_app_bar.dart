import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String leadingIcon;
  final Function() leadingOnTap;
  final double? widthBar;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.widthBar,
    required this.leadingIcon,
    required this.leadingOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: true,
      pinned: true,
      toolbarHeight: 60,
      // leadingWidth: widthBar,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[primary, gradation],
                    stops: [0.447, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      titleTextStyle: textStyleBuilder(22, FontWeight.normal).copyWith(
        color: textBarColor,
      ),
      title: Text(title),
    );
  }
}
