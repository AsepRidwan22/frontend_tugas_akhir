// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:frontend_tugas_akhir/common/constants.dart';
// import 'package:frontend_tugas_akhir/data/models/news.dart';
// // import 'package:frontend_tugas_akhir/presentation/pages/article/article_detail_page.dart';
// import 'package:flutter/material.dart';

// class NewsCard extends StatelessWidget {
//   final Article article;

//   NewsCard(this.article);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       child: InkWell(
//         onTap: () {
//           // Navigator.pushNamed(
//           //   context,
//           //   ArticleDetailPage.ROUTE_NAME,
//           //   arguments: article.id,
//           // );
//         },
//         child: Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             Card(
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   left: 16 + 80 + 16,
//                   bottom: 8,
//                   right: 8,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       article.title ?? '-',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: kHeading6,
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       article.description ?? '-',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(
//                 left: 16,
//                 bottom: 16,
//               ),
//               child: ClipRRect(
//                   // child: CachedNetworkImage(
//                   //   imageUrl: '$baseImageUrl${article.posterPath}',
//                   //   width: 80,
//                   //   placeholder: (context, url) => Center(
//                   //     child: CircularProgressIndicator(),
//                   //   ),
//                   //   errorWidget: (context, url, error) => Icon(Icons.error),
//                   // ),
//                   // borderRadius: BorderRadius.all(Radius.circular(8)),
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
