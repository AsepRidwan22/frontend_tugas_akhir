import 'package:frontend_tugas_akhir/common/constants.dart';
import 'package:frontend_tugas_akhir/common/utils.dart';
import 'package:frontend_tugas_akhir/presentation/bloc/news_bloc.dart';
import 'package:frontend_tugas_akhir/presentation/pages/berita_list.dart';
import 'package:frontend_tugas_akhir/presentation/pages/halaman_awal.dart';
import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
import 'package:frontend_tugas_akhir/presentation/pages/register_page_new.dart';
import 'package:frontend_tugas_akhir/presentation/pages/ringkasan_kesehatan.dart';
import 'package:frontend_tugas_akhir/presentation/provider/news_notifier.dart';
import 'package:frontend_tugas_akhir/presentation/provider/user_login_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_tugas_akhir/presentation/provider/user_register_notifier.dart';
import 'package:provider/provider.dart';
import 'package:frontend_tugas_akhir/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_file.dart';

void main() async {
  di.init();
  runApp(MyApp());
  // await initializeDateFormatting('id_ID', 'assets/symbols/id_ID.json');
  // var now = DateTime.now();
  // var formatter = DateFormat.yMd('id_ID');
  // print(formatter.format(now));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<UserLoginNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UserRegisterNotifier>(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<NewsNotifier>(),
        // ),
        BlocProvider(
          create: (_) => di.locator<NewsListBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData.light().copyWith(
        //   colorScheme: kColorScheme,
        //   primaryColor: Colors.white,
        //   scaffoldBackgroundColor: kRichBlack,
        //   textTheme: kTextTheme,
        // ),
        home: const BeritaList(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/halaman_awal':
              return MaterialPageRoute(builder: (_) => HalamanAwal());
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginPageNew());
            case '/register':
              return MaterialPageRoute(builder: (_) => RegisterPageNew());
            // case PopularMoviesPage.ROUTE_NAME:
            // return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
