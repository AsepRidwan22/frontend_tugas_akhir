import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/data/datasources/secure_storage_data_source.dart';
import 'package:frontend_tugas_akhir/data/helper/shared_preferences_helper.dart';
import 'package:frontend_tugas_akhir/data/repositories/secure_storage_reporitory_impl.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/Dashboard/dashboard_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/pages/beranda_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/berita_list_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/halaman_awal_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/kesehatan_screen.dart';
// import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SourceStorageReopsitoryImpl sourceStorageReopsitoryImpl =
      SourceStorageReopsitoryImpl(
          SecureStorageDataSource(SecureStorageHelper()));
  final toast = FToast();
  final List<Widget> _listWidget = [
    const BerandaScreen(),
    const BeritaListScreen(),
    const KesehatanScreen(),
    const HalamanAwalScreen(),
  ];

  String? token; // Tambahkan variabel token

  @override
  void initState() {
    super.initState();
    // Panggil metode untuk mengambil token saat inisialisasi
    getToken();
  }

  void getToken() async {
    token = await sourceStorageReopsitoryImpl.getToken();
    setState(() {}); // Perbarui UI setelah token diperoleh
  }

  void _bottomNavIndexChange(int index) {
    // bool isLogin = context.read<DashboardBloc>().state.isLogIn;
    // bool isntLogin = context.read<DashboardBloc>().state.isntLogIn;
    // bool isLogin = true;
    print('token dalam ui : $token');
    if (index == 2) {
      if (token != null) {
        context.read<DashboardBloc>().add(
              IndexBottomNavChange(
                newIndex: index,
              ),
            );
      } else {
        // Change to login screen
        Navigator.push(
          context,
          PageTransition(
            curve: Curves.easeInOut,
            type: PageTransitionType.bottomToTop,
            child: const LoginScreen(
              role: 'Pasien',
            ),
            duration: const Duration(milliseconds: 150),
            reverseDuration: const Duration(milliseconds: 150),
          ),
        );
      }
    } else {
      context.read<DashboardBloc>().add(
            IndexBottomNavChange(newIndex: index),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, bottomNav) {
        return Scaffold(
          body: _listWidget[bottomNav.indexBottomNav],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/light/home.svg",
                  // color: bGrey,
                  height: 24.0,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icon/fill/home.svg",
                  // color: bPrimary,
                  height: 24.0,
                ),
                // Wait Localization
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/light/news.svg",
                  // color: bGrey,
                  height: 24.0,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icon/fill/news.svg",
                  // color: bPrimary,
                  height: 24.0,
                ),
                // Wait Localization
                label: 'Berita',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/light/health.svg",
                  // color: bGrey,
                  height: 24.0,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icon/fill/health.svg",
                  // color: bPrimary,
                  height: 24.0,
                ),
                // Wait Localization
                label: 'Kesehatan',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icon/light/profile.svg",
                  // color: bGrey,
                  height: 24.0,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/icon/fill/profile.svg",
                  // color: bPrimary,
                  height: 24.0,
                ),
                // Wait Localization
                label: 'Akun',
              ),
            ],
            currentIndex: bottomNav.indexBottomNav,
            onTap: _bottomNavIndexChange,
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
          ),
        );
      },
    );
  }
}
