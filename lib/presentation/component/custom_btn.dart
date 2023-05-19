import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomIconTextButton extends StatelessWidget {
  final double width;
  final String text;
  String? icon;
  double? height;
  Color? bgColor;
  Color? iconColor;
  double? radiusLeft;
  double? radiusRight;
  double? radiusAll;
  bool? isLoading;
  final Function() onTap;
  CustomIconTextButton(
      {Key? key,
      required this.width,
      required this.text,
      this.icon,
      this.height,
      this.bgColor,
      this.iconColor,
      this.radiusLeft,
      this.radiusRight,
      this.radiusAll,
      this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("isLoading btn component: $isLoading");
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: primary,
          ),
          backgroundColor: bgColor ?? primary,
          shape: RoundedRectangleBorder(
              borderRadius: radiusAll != null
                  ? BorderRadius.circular(radiusAll!)
                  : radiusLeft != null
                      ? BorderRadius.only(
                          topLeft: Radius.circular(radiusLeft!),
                          bottomLeft: Radius.circular(radiusLeft!))
                      : BorderRadius.only(
                          topRight: Radius.circular(radiusRight!),
                          bottomRight: Radius.circular(radiusRight!))),
          minimumSize: Size((width < 300) ? width : width, height ?? 60)),
      label: Text(
        isLoading != true ? text : '',
        style: textStyleBuilder(15, FontWeight.w500)
            .copyWith(color: iconColor ?? bgForm),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      icon: icon != null
          ? SvgPicture.asset(
              icon!,
              color: iconColor ?? bgForm,
            )
          : (isLoading == true)
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : const Icon(
                  null,
                  size: 0,
                ),
    );
  }
}
