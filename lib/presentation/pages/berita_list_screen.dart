import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/data/datasources/news_remote_data_source.dart';
import 'package:frontend_tugas_akhir/data/models/model_news.dart';
import 'package:frontend_tugas_akhir/presentation/component/custom_news_card.dart';
// import 'package:frontend_tugas_akhir/presentation/widgets/news_card_list.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
// import 'package:frontend_tugas_akhir/theme/theme.dart';
// import 'package:intl/date_symbol_data_file.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:frontend_tugas_akhir/common/state_enum.dart';

class BeritaListScreen extends StatefulWidget {
  const BeritaListScreen({super.key});

  @override
  State<BeritaListScreen> createState() => _BeritaListScreenState();
}

class _BeritaListScreenState extends State<BeritaListScreen> {
  @override
  void initState() {
    super.initState();

    futureArticle = NewsRemoteDataSourceImpl().diabetesNewsId();

    // if (user != null) {
    //   context.read<DashboardBloc>().add(OnIsAdmin(email: user!.email!));
    // }

    // _controller = TabController(
    //   vsync: this,
    //   length: 2,
    // );

    // if (mounted) {
    //   setState(() {
    //     process = ScreenProcessEnum.loaded;
    //   });
    // }
  }

  late final Future<ArticlesResult> futureArticle;

  @override
  Widget build(BuildContext context) {
    // initializeDateFormatting('id_ID', 'assets/locale_data/symbols/id_ID.json');
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: FutureBuilder<ArticlesResult>(
        future: futureArticle,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final news = snapshot.data!.articles;
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, right: 20, left: 20),
                  child: CustomNewsCard(
                    img: news[index].urlToImage ?? "",
                    title: news[index].title ?? "Tidak ada judul",
                    writer: news[index].author ?? "Tidak ada penulis",
                    // date: DateFormat("EEEE, d MMMM yyyy", "id_ID").format(
                    //     DateTime.parse(snapshot
                    //         .data!.articles[index].publishedAt
                    //         .toString())),
                    onTap: () {
                      // To detail News
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     curve: Curves.easeOut,
                      //     type: PageTransitionType.bottomToTop,
                      //     child: NewsDetailScreenApi(
                      //       img: news[index].urlToImage,
                      //       title: news[index].title,
                      //       author: news[index].author,
                      //       date: DateFormat("EEEE, d MMMM yyyy", "id_ID")
                      //           .format(DateTime.parse(snapshot
                      //               .data!.articles[index].publishedAt
                      //               .toString())),
                      //       url: news[index].url,
                      //       content: news[index].content,
                      //     ),
                      //     duration: const Duration(milliseconds: 150),
                      //     reverseDuration: const Duration(milliseconds: 150),
                      //   ),
                      // );
                    },
                  ),
                );
              },
              itemCount: news.length,
            );
          } else if (snapshot.hasError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
