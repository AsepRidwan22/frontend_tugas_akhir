import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color textPrimary = Color(0xFF2E2E2E);
const Color textSecondary = Color(0xFF666666);
const Color textThird = Color(0xFFA8A8A8);
// const Color labelSecondary = Color(0xFF656565);
const Color backgroundPrimary = Color(0xFFF5F5F5);
const Color lineForm = Color(0xFFDFDFDF);
const Color bgForm = Color(0xffffffff);
const Color textBarColor = Color(0xFFFFFDFD);
const Color primary = Color(0xFF1670E8);
const Color bgBtnSecondary = Color(0xFF197DFD);
const Color gradation = Color(0xFF35A8E0);
const Color outLineBtn = Color(0xFF194E7D);
const Color labelForm = Color(0xFF505050);
const Color bgLine = Color(0xFFF5F5F5);
const Color borderTopLine = Color(0xFFDEDEDE);
const Color bStroke = Color.fromARGB(30, 0, 0, 0);

final TextStyle bHeading1 =
    GoogleFonts.poppins(fontSize: 64, fontWeight: FontWeight.w500);
final TextStyle bHeading2 =
    GoogleFonts.poppins(fontSize: 48, fontWeight: FontWeight.w400);
final TextStyle bHeading3 =
    GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w700);
final TextStyle bHeading4 =
    GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600);
final TextStyle bHeading5 =
    GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400);
final TextStyle bHeading6 =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);
final TextStyle bHeading7 =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle bSubtitle1 =
    GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);
final TextStyle bSubtitle2 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
final TextStyle bSubtitle3 =
    GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);
final TextStyle bSubtitle4 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700);
final TextStyle bBody1 =
    GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400);
final TextStyle bBody2 =
    GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400);
final TextStyle bCaption1 =
    GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400);
final TextStyle bCaption2 =
    GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w400);
final TextStyle bCaption3 =
    GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w700);
final TextStyle bButton1 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
final TextStyle bButton2 =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600);
final TextStyle bPopup =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700);

// border
OutlineInputBorder bBorderBuilder(Color color, double bRadius,
    {double wBorder = 1.0}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(bRadius),
    ),
    borderSide: BorderSide(
      color: color,
      width: wBorder,
    ),
  );
}

TextStyle textStyleBuilder(double size, FontWeight weight) {
  return GoogleFonts.poppins(fontSize: size, fontWeight: weight);
}

//Padding