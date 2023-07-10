import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:frontend_tugas_akhir/data/datasources/kesehatan_remote_data_source.dart';
// import 'package:frontend_tugas_akhir/data/datasources/user_remote_data_source.dart';
// import 'package:frontend_tugas_akhir/data/models/model_kesehatan.dart';
// import 'package:frontend_tugas_akhir/domain/entities/kesehatan.dart';
// import 'package:frontend_tugas_akhir/presentation/bloc/Kesehatan/kesehatan_bloc.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_app_bar.dart';
// import 'package:frontend_tugas_akhir/presentation/component/custom_btn.dart';
// import 'package:frontend_tugas_akhir/presentation/pages/login_page_new.dart';
// import 'package:frontend_tugas_akhir/theme/theme.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Beranda Screen'),
        ));
  }
}
