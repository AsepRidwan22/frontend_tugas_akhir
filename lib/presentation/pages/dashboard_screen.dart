// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/halaman_awal.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
// import 'package:frontend_tugas_akhir/theme/theme.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final List<Widget> _listWidget = [
//     const HalamanAwal(),
//     const HalamanAwal(),
//     const HalamanAwal(),
//     const HalamanAwal(),
//   ];

//   // void _bottomNavIndexChange(int index) {
//   //   bool isLogin = context.read<DashboardBloc>().state.isLogIn;
//   //   if (index == 2 || index == 3) {
//   //     if (isLogin && user != null) {
//   //       context.read<DashboardBloc>().add(
//   //             IndexBottomNavChange(
//   //               newIndex: index,
//   //             ),
//   //           );
//   //     } else {
//   //       // Change to login screen
//   //       Navigator.push(
//   //         context,
//   //         PageTransition(
//   //           curve: Curves.easeInOut,
//   //           type: PageTransitionType.bottomToTop,
//   //           child: const LoginPageNew(role: 'Pasien',),
//   //           duration: const Duration(milliseconds: 150),
//   //           reverseDuration: const Duration(milliseconds: 150),
//   //         ),
//   //       );
//   //     }
//   //   } else {
//   //     context.read<DashboardBloc>().add(
//   //           IndexBottomNavChange(newIndex: index),
//   //         );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _listWidget[bottomNav.indexBottomNav],
//       bottomNavigationBar: BlocBuilder<ThemeManagerBloc, ThemeManagerState>(
//         builder: (context, theme) {
//           Brightness screenBrightness =
//               MediaQuery.platformBrightnessOf(context);
//           Color activeBottomNav = (theme.isDark == ThemeModeEnum.darkTheme)
//               ? bTextPrimary
//               : (theme.isDark == ThemeModeEnum.lightTheme)
//                   ? bPrimary
//                   : (screenBrightness == Brightness.light)
//                       ? bPrimary
//                       : bTextPrimary;
//           return BottomNavigationBar(
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   "assets/icon/light/home.svg",
//                   color: bGrey,
//                   height: 24.0,
//                 ),
//                 activeIcon: SvgPicture.asset(
//                   "assets/icon/fill/home.svg",
//                   color: activeBottomNav,
//                   height: 24.0,
//                 ),
//                 // Wait Localization
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   "assets/icon/light/copy.svg",
//                   color: bGrey,
//                   height: 24.0,
//                 ),
//                 activeIcon: SvgPicture.asset(
//                   "assets/icon/fill/copy.svg",
//                   color: activeBottomNav,
//                   height: 24.0,
//                 ),
//                 // Wait Localization
//                 label: 'News',
//               ),
//               BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   "assets/icon/light/star.svg",
//                   color: bGrey,
//                   height: 24.0,
//                 ),
//                 activeIcon: SvgPicture.asset(
//                   "assets/icon/fill/star.svg",
//                   color: activeBottomNav,
//                   height: 24.0,
//                 ),
//                 // Wait Localization
//                 label: 'Favorite',
//               ),
//               BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   "assets/icon/light/user.svg",
//                   color: bGrey,
//                   height: 24.0,
//                 ),
//                 activeIcon: SvgPicture.asset(
//                   "assets/icon/fill/user.svg",
//                   color: activeBottomNav,
//                   height: 24.0,
//                 ),
//                 // Wait Localization
//                 label: 'Akun',
//               ),
//             ],
//             currentIndex: bottomNav.indexBottomNav,
//             onTap: _bottomNavIndexChange,
//             selectedFontSize: 10.0,
//             unselectedFontSize: 10.0,
//           );
//         },
//       ),
//     );
//   }
// }
