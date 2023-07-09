// // import 'dart:ffi';

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/common/state_enum.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// // import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_text_field.dart';
// import 'package:frontend_tugas_akhir/presentation/provider/pasien_register_notifier.dart';
// import 'package:frontend_tugas_akhir/theme/theme.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:logger/logger.dart';
// import 'package:image_picker/image_picker.dart';

// class FormKesehatanAwalScreen extends StatefulWidget {
//   const FormKesehatanAwalScreen({super.key});

//   @override
//   State<FormKesehatanAwalScreen> createState() =>
//       _FormKesehatanAwalScreenState();
// }

// class _FormKesehatanAwalScreenState extends State<FormKesehatanAwalScreen> {
//   String? beratBadan;
//   String? tinggiBadan;
//   String? lingkarPinggang;
//   String? lingkarPinggul;
//   String? tekananDarahSistolik;
//   String? tekananDarahDiastolik;
//   DateTime? lamaDiabetes;
//   String? aktivitasFisik;
//   bool riwayatKeluargaDiabetes = false;
//   bool perokok = false;
//   bool riwayatStroke = false;
//   String? rekamMedis;
//   final TextEditingController _dateController = TextEditingController();

//   RegExp requiredFieldRegex = RegExp(r'^\s*\S+\s*$');

//   DateTime? _selectedDate;
//   final Logger logger = Logger();
//   // final ScrollController _scrollController = ScrollController();
//   // bool _isRefreshing = false;

//   late File _selectedImage;

//   Future<void> _pickImage() async {
//     final pickedImage =
//         await ImagePicker().getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedImage != null) {
//         _selectedImage = File(pickedImage.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       locale: const Locale('id', 'ID'), // Atur locale ke Indonesia
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _dateController.text = DateFormat.yMMMMd('id_ID').format(
//             picked); // Mengisi field dengan tanggal yang dipilih dan format Indonesia
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     initializeDateFormatting(
//         'id_ID', null); // Inisialisasi format tanggal Indonesia
//   }

//   @override
//   void dispose() {
//     _dateController.dispose();
//     // _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: CustomScrollView(
//         // controller: _scrollController,
//         physics: const BouncingScrollPhysics(),
//         slivers: <Widget>[
//           CustomAppBar(
//             title: 'Form Kesehatan Awal',
//             widthBar: screenSize.width,
//             leadingIcon: "assets/appBarBack.svg",
//             leadingOnTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           _customEditForm(
//               context,
//               "Berat Badan",
//               CustomTextField(
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Berat Badan tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Berat Badan tidak valid';
//                     }
//                     return null;
//                   },
//                   textInputType: TextInputType.number,
//                   hint: "Masukan Berat Badan",
//                   onChange: ((item) {
//                     setState(() {
//                       beratBadan = item;
//                     });
//                   }))),
//           _customEditForm(
//               context,
//               "Tinggi Badan",
//               CustomTextField(
//                   hint: "Masukan Tinggi Badan",
//                   textInputType: TextInputType.number,
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       tinggiBadan = item;
//                     });
//                   }))),
//           _customEditForm(
//               context,
//               "Lingkar Pinggang",
//               CustomTextField(
//                   hint: "Masukan Lingkar Pinggang",
//                   textInputType: TextInputType.number,
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       lingkarPinggang = item;
//                     });
//                     // print(password);
//                   }))),
//           _customEditForm(
//               context,
//               "Lingkar Pinggul",
//               CustomTextField(
//                   hint: "Masukan Lingkar Pinggul",
//                   textInputType: TextInputType.number,
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       lingkarPinggul = item;
//                     });
//                   }))),
//           _customEditForm(
//               context,
//               "Tekanan Darah Sistolik",
//               CustomTextField(
//                   hint: "Masukan Tekanan Darah Diastolik",
//                   textInputType: TextInputType.number,
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       tekananDarahSistolik = item;
//                     });
//                   }))),
//           _customEditForm(
//               context,
//               "Tekanan Darah Diastoik",
//               CustomTextField(
//                   hint: "Masukan Tekanan Darah Diastolik",
//                   textInputType: TextInputType.number,
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       tekananDarahDiastolik = item;
//                     });
//                   }))),
//           _customEditForm(
//             context,
//             "Lama Diabetes",
//             TextFormField(
//               controller: _dateController,
//               readOnly: true, // Membuat field hanya bisa dibaca
//               decoration: InputDecoration(
//                 labelText: 'Tanggal',
//                 suffixIcon: IconButton(
//                   onPressed: () => _selectDate(
//                       context), // Membuka date picker ketika ikon ditekan
//                   icon: const Icon(Icons.calendar_today),
//                 ),
//               ),
//             ),
//           ),
//           _customEditForm(
//               context,
//               "Aktivitas Fisik",
//               CustomTextField(
//                   hint: "Masukan Aktivitas Fisik",
//                   validator: (item) {
//                     if (item!.isEmpty) {
//                       return 'Email tidak boleh kosong';
//                     } else if (!requiredFieldRegex.hasMatch(item)) {
//                       return 'Email tidak valid';
//                     }
//                     return null;
//                   },
//                   onChange: ((item) {
//                     setState(() {
//                       aktivitasFisik = item;
//                     });
//                   }))),
//           _customCheckBoxForm(
//             context,
//             CheckboxListTile(
//               title: const Text('Apakah anda perokok?'),
//               value: perokok,
//               onChanged: (value) {
//                 setState(() {
//                   perokok = value ?? false;
//                 });
//               },
//             ),
//           ),
//           _customCheckBoxForm(
//             context,
//             CheckboxListTile(
//               title: const Text('Apakah anda punya riwayat stroke?'),
//               value: riwayatStroke,
//               onChanged: (value) {
//                 setState(() {
//                   riwayatStroke = value ?? false;
//                 });
//               },
//             ),
//           ),
//           //buatkan sliverpadding untuk upload image
//           SliverPadding(
//             padding: const EdgeInsets.only(
//               top: 10.0,
//               left: 20.0,
//               right: 20.0,
//             ),
//             sliver: SliverToBoxAdapter(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Upload Rekam Medis",
//                     style: textStyleBuilder(15, FontWeight.w500)
//                         .copyWith(color: labelForm),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5.0),
//                     child: GestureDetector(
//                       onTap: () {
//                         _pickImage();
//                       },
//                       child: Container(
//                         height: 50,
//                         width: screenSize.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: bSecondaryVariant1,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "assets/email.svg",
//                               height: 20,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Upload",
//                               style: textStyleBuilder(15, FontWeight.w500)
//                                   .copyWith(color: labelForm),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverPadding(
//             padding:
//                 const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
//             sliver: SliverToBoxAdapter(
//               child: CustomIconTextButton(
//                 radiusAll: 15,
//                 bgColor: bSecondaryVariant1,
//                 width: screenSize.width,
//                 text: "Submit",
//                 onTap: () {
//                   // print("parameter $email $name $password ");
//                   // if (email != null && name != null && password != null) {}
//                   // if (_formKey.currentState!.validate()) {
//                   //   Provider.of<UserRegisterNotifier>(context, listen: false)
//                   //       .register(email, name, password);
//                   // }
//                 },
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Consumer<UserRegisterNotifier>(
//               builder: (context, data, child) {
//                 if (data.state == RequestState.loading) {
//                   return const CircularProgressIndicator();
//                 } else if (data.state == RequestState.success) {
//                   // print("berhasil bro");
//                   logger.i("Info message");
//                   return Container();
//                 } else {
//                   // print("gagal bro");
//                   logger.e("Error message");
//                   return Expanded(
//                     child: Container(),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _customEditForm(
//     BuildContext context, String pleaceHolder, Widget textField) {
//   return SliverPadding(
//     padding: const EdgeInsets.only(
//       top: 10.0,
//       left: 20.0,
//       right: 20.0,
//     ),
//     sliver: SliverToBoxAdapter(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             pleaceHolder,
//             style: textStyleBuilder(15, FontWeight.w500)
//                 .copyWith(color: labelForm),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: textField,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _customCheckBoxForm(BuildContext context, Widget textField) {
//   return SliverPadding(
//     padding: const EdgeInsets.only(
//       top: 10.0,
//       left: 5.0,
//       right: 5.0,
//     ),
//     sliver: SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 5.0),
//         child: textField,
//       ),
//     ),
//   );
// }
