import 'package:flutter/material.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final Function(String item) onChange;
  final String? Function(String? item)? onChangeIcon;
  // final String? Function(String? item)? isLoading;
  final String? Function(String? item)? validator;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  TextInputType? textInputType;
  String? customAutofillHints;
  int? maxLines;
  final String? icon;
  final String? iconPassword;

  CustomTextField(
      {Key? key,
      required this.onChange,
      this.onChangeIcon,
      this.validator,
      this.controller,
      required this.hint,
      this.label,
      this.icon,
      this.iconPassword,
      this.textInputType,
      this.customAutofillHints,
      this.maxLines})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  // get customAutofillHints => null;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.iconPassword == null ? false : _obscureText,
      keyboardType: widget.textInputType ?? TextInputType.text,
      controller: widget.controller,
      autofillHints: widget.customAutofillHints == null
          ? null
          : [widget.customAutofillHints!],
      maxLines: widget.maxLines ?? 1,
      style: textStyleBuilder(16, FontWeight.normal)
          .copyWith(color: textSecondary),
      decoration: InputDecoration(
          prefixIcon: widget.icon == null
              ? null
              : Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: SvgPicture.asset(
                    widget.icon!,
                    height: 30,
                    width: double.infinity,
                  ),
                ),
          suffixIcon: widget.iconPassword == null
              ? null
              : IconButton(
                  icon: _obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
          errorStyle: textStyleBuilder(16, FontWeight.normal)
              .copyWith(color: Colors.red),
          hintText: widget.hint,
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: bBorderBuilder(textSecondary, 15)),
      //validator must be check
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChange,
    );
  }
}
