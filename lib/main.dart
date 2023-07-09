import 'package:flutter/services.dart';
// import 'package:frontend_tugas_akhir/common/constants.dart';
import 'package:frontend_tugas_akhir/common/utils.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/Dashboard/dashboard_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/LoginPasien/login_pasien_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/News/news_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/Kesehatan/kesehatan_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/RegisterPasien/register_pasien_bloc.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/beranda_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/berita_list.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/form_kesehatan_awal.dart';
import 'package:frontend_tugas_akhir/presentation/pages/halaman_awal_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_screen.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/splah_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/verification_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/verifikasi_screen.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/ringkasan_kesehatan.dart';
import 'package:frontend_tugas_akhir/presentation/provider/dokter_login_notifier.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_login_notifier.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tugas_akhir/presentation/provider/pasien_register_notifier.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:frontend_tugas_akhir/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:bloc/bloc.dart';
// import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  di.init();
  runApp(const MyApp());
  // await initializeDateFormatting('id_ID', 'assets/symbols/id_ID.json');
  // var now = DateTime.now();
  // var formatter = DateFormat.yMd('id_ID');
  // print(formatter.format(now));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Ubah dengan warna status bar yang diinginkan
      statusBarBrightness: Brightness
          .light, // Sesuaikan dengan brightness konten di halaman tersebut
      statusBarIconBrightness:
          Brightness.dark, // SSesuaikan dengan kecerahan ikon teks
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<PasienLoginNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<DokterLoginNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UserRegisterNotifier>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NewsListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LoginPasienBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DashboardBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<KesehatanBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RegisterPasienBloc>(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            // statusBarColor: Colors
            //     .transparent, // Ubah dengan warna status bar yang diinginkan
            // statusBarBrightness: Brightness
            //     .light, // Sesuaikan dengan brightness konten di halaman tersebut
            // statusBarIconBrightness:
            //     Brightness.dark, // Sesuaikan dengan kebutuhan ikon status bar
            ),
        child: MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'), // Tambahkan lokalisasi yang ingin Anda dukung
            Locale('id', 'ID'),
          ],
          theme: lightTheme,
          home: const HalamanAwalScreen(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/halaman_awal':
                return MaterialPageRoute(
                    builder: (_) => const HalamanAwalScreen());
              case '/pasien/login':
                return MaterialPageRoute(
                    builder: (_) => const LoginScreen(
                          role: 'Pasien',
                        ));
              case '/dokter/login':
                return MaterialPageRoute(
                    builder: (_) => const LoginScreen(
                          role: 'Dokter',
                        ));
              case '/register':
                return MaterialPageRoute(
                    builder: (_) => const RegisterScreen());
              // case PopularMoviesPage.ROUTE_NAME:
              // return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ),
      ),
    );
  }
}
