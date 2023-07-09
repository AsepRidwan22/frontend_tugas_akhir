import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomIconTextButton extends StatelessWidget {
  final double width;
  final String text;
  final String? icon;
  final double? height;
  final Color? bgColor;
  final Color? borederColor;
  final Color? textColor;
  final Color? iconColor;
  final double? radiusLeft;
  final double? radiusRight;
  final double? radiusAll;
  final bool? isLoading;
  final Function() onTap;
  const CustomIconTextButton(
      {Key? key,
      required this.width,
      required this.text,
      this.icon,
      this.height,
      this.bgColor,
      this.textColor,
      this.iconColor,
      this.borederColor,
      this.radiusLeft,
      this.radiusRight,
      this.radiusAll,
      this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("isLoading btn component: $isLoading");
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: bgColor ?? bPrimary,
          ),
          backgroundColor: bgColor ?? bPrimary,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borederColor ??
                    Colors.transparent, // Set the color for the border
                width: 2, // Set the width for the border
              ),
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
        // selectionColor: bTextSecondary,
        style: bButton1.copyWith(color: textColor ?? bTextPrimary),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      icon: icon != null
          ? SvgPicture.asset(
              icon!,
              // color: iconColor ?? bgForm,
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
