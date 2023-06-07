import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final Function(String?)? onChange;
  final String? Function(String?)? onChangeIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hint;
  final String? label;
  final TextInputType? textInputType;
  final String? customAutofillHints;
  final int maxLines;
  final String? icon;
  final String? iconPassword;

  const CustomTextField({
    Key? key,
    this.onChange,
    this.onChangeIcon,
    this.validator,
    this.controller,
    required this.hint,
    this.label,
    this.icon,
    this.iconPassword,
    this.textInputType,
    this.customAutofillHints,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.iconPassword == null ? false : _obscureText,
      keyboardType: widget.textInputType ?? TextInputType.text,
      controller: widget.controller,
      autofillHints: widget.customAutofillHints == null
          ? null
          : [widget.customAutofillHints!],
      maxLines: widget.maxLines,
      style: textStyleBuilder(16, FontWeight.normal)
          .copyWith(color: textSecondary),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: widget.icon == null
            ? null
            : Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                child: SvgPicture.asset(
                  widget.icon!,
                  height: 30,
                  width: double.infinity,
                ),
              ),
        suffixIcon: widget.iconPassword == null
            ? null
            : IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
        errorStyle:
            textStyleBuilder(16, FontWeight.normal).copyWith(color: Colors.red),
        hintText: widget.hint,
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChange,
    );
  }
}
