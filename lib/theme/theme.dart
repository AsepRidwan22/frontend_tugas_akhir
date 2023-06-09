import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color bPrimary = Color(0xFF1F3C88);
const Color bPrimaryVariant1 = Color(0xFF070D59);
const Color bPrimaryVariant2 = Color(0xFFDCEDFE);
const Color bSecondary = Color(0xFFF7B633);
const Color bSecondaryVariant1 = Color(0xFFE4A015);
const Color bTextPrimary = Color(0xFFFFFFFF);
const Color bTextSecondary = Color(0xFF000000);
const Color bError = Color(0xFFB00020);
const Color bAccepted = Color(0xFF3CAE5C);
const Color bBackgroundPrimary = Color(0xFFF9FAFF);
const Color bBackgroundSecondary = Color(0xFF1B222A);
const Color bGrey = Color(0xFF5C5C5C);
const Color bDarkGrey = Color(0xFF33393F);
const Color bLightGrey = Color(0xFFEEEEF0);
const Color bToastFiled = Color(0xffEC4D2C);
const Color bBgToastFiled = Color(0xffFCEDE9);
const Color bBorderToastFiled = Color(0xffFF977B);
const Color bToastSuccess = Color(0xff3CAE5C);
const Color bBgToastSuccess = Color(0xffEAF7EE);
const Color bBorderToastSuccess = Color(0xff8CD8A2);
const Color bToastWarning = Color(0xffFFE924);
const Color bBgToastWarning = Color(0xffFEFFBD);
const Color bBorderToastWarning = Color(0xffFFE924);
const Color textPrimary = Color(0xFF2E2E2E);
const Color textSecondary = Color(0xFF666666);
const Color textThird = Color(0xFFA8A8A8);
const Color textFourth = Color(0xFF197DFD);
const Color bgForm = Color(0xffffffff);
const Color textBarColor = Color(0xFFFFFDFD);
const Color gradation = Color(0xFF35A8E0);
const Color labelForm = Color(0xFF505050);
const Color bgLine = Color(0xFFF5F5F5);
const Color borderTopLine = Color(0xFFDEDEDE);
const Color bStroke = Color.fromARGB(30, 0, 0, 0);

//cutom boxDecoration
BoxDecoration customBoxDecoration03(Color? containerColor) {
  return BoxDecoration(
    color: containerColor,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 1),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.12),
        blurRadius: 3,
        offset: const Offset(0, 3),
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.14),
        blurRadius: 4,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

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

// light theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: bBackgroundPrimary,
  primaryColor: bPrimary,
  backgroundColor: bBackgroundPrimary,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    // button color primary
    primary: bPrimary,
    onPrimary: bTextPrimary,
    // container color primary
    primaryContainer: bLightGrey,
    onPrimaryContainer: bPrimary,
    // button secondary
    secondary: bSecondary,
    onSecondary: bTextPrimary,
    // container color secondary
    secondaryContainer: bTextPrimary,
    onSecondaryContainer: bPrimary,
    // text color primary
    tertiary: bPrimary,
    // text color secondary
    onTertiary: bGrey,
    // text color primary in container
    tertiaryContainer: bTextSecondary,
    // text color secondary in container
    onTertiaryContainer: bGrey,
    // error
    error: bError,
    onError: bTextPrimary,
    // error in container
    errorContainer: bError,
    onErrorContainer: bTextPrimary,
    // background color
    background: bBackgroundPrimary,
    onBackground: bPrimary,
    // card primary
    surface: bPrimary,
    onSurface: bTextPrimary,
    // card secondary
    surfaceVariant: bTextPrimary,
    onSurfaceVariant: bTextSecondary,
    // drop down
    inverseSurface: bPrimaryVariant1,
    onInverseSurface: bTextPrimary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: bbBorderBuilder(bStroke),
    errorBorder: bbBorderBuilder(bError),
    focusedErrorBorder: bbBorderBuilder(bError),
    focusedBorder: bbBorderBuilder(bGrey),
    disabledBorder: bbBorderBuilder(bStroke),
    filled: true,
    fillColor: bTextPrimary,
    labelStyle: bSubtitle1.copyWith(color: bStroke),
    hintStyle: bSubtitle1.copyWith(color: bStroke),
    prefixIconColor: bPrimaryVariant1,
    suffixIconColor: bPrimaryVariant1,
    border: InputBorder.none,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(bPrimary),
      textStyle: MaterialStateProperty.all(
        bSubtitle4.copyWith(color: bTextPrimary),
      ),
      // overlayColor: MaterialStateProperty.all(bPrimaryVariant1),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      width: 1.0,
      color: bPrimary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    fillColor: MaterialStateProperty.all(bPrimary),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 2.0,
    backgroundColor: bTextPrimary,
    selectedItemColor: bPrimary,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: bCaption3.copyWith(color: bPrimary),
    unselectedLabelStyle: bCaption1.copyWith(color: bGrey),
    unselectedItemColor: bGrey,
    selectedIconTheme: const IconThemeData(color: bPrimary),
    unselectedIconTheme: const IconThemeData(color: bGrey),
  ),
);

// dark theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff1B222A),
  primaryColor: bTextPrimary,
  backgroundColor: bBackgroundSecondary,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    // button color primary
    primary: bPrimary,
    onPrimary: bTextPrimary,
    // container color primary
    primaryContainer: bDarkGrey,
    onPrimaryContainer: bTextPrimary,
    // button secondary
    secondary: bDarkGrey,
    onSecondary: bTextPrimary,
    // container color secondary
    secondaryContainer: bDarkGrey,
    onSecondaryContainer: bTextPrimary,
    // text color primary
    tertiary: bTextPrimary,
    // text color secondary
    onTertiary: bGrey,
    // text color primary in container
    tertiaryContainer: bTextPrimary,
    // text color secondary in container
    onTertiaryContainer: bGrey,
    // error
    error: bError,
    onError: bTextPrimary,
    // error in container
    errorContainer: bError,
    onErrorContainer: bTextPrimary,
    // background color
    background: bBackgroundSecondary,
    onBackground: bTextPrimary,
    // card primary
    surface: bDarkGrey,
    onSurface: bTextPrimary,
    // card secondary
    surfaceVariant: bGrey,
    onSurfaceVariant: bTextPrimary,
    // drop down
    inverseSurface: bGrey,
    onInverseSurface: bTextPrimary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: bbBorderBuilder(bGrey),
    errorBorder: bbBorderBuilder(bError),
    focusedErrorBorder: bbBorderBuilder(bError),
    focusedBorder: bbBorderBuilder(bTextPrimary),
    disabledBorder: bbBorderBuilder(bStroke),
    filled: true,
    fillColor: bDarkGrey,
    labelStyle: bSubtitle1.copyWith(color: bGrey),
    hintStyle: bSubtitle1.copyWith(color: bGrey),
    prefixIconColor: bGrey,
    suffixIconColor: bGrey,
    focusColor: bError,
    border: InputBorder.none,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(bDarkGrey),
      textStyle: MaterialStateProperty.all(
        bSubtitle4.copyWith(color: bTextPrimary),
      ),
      overlayColor: MaterialStateProperty.all(bGrey),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      width: 1.0,
      color: bGrey,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    fillColor: MaterialStateProperty.all(bGrey),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 2.0,
    backgroundColor: bDarkGrey,
    selectedItemColor: bTextPrimary,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: bCaption3.copyWith(color: bTextPrimary),
    unselectedLabelStyle: bCaption1.copyWith(color: bGrey),
    unselectedItemColor: bGrey,
    selectedIconTheme: const IconThemeData(color: bTextPrimary),
    unselectedIconTheme: const IconThemeData(color: bGrey),
  ),
);

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

OutlineInputBorder bbBorderBuilder(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
  );
}
