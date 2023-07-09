import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_tugas_akhir/presentation/pages/halaman_awal_screen.dart';
import 'package:frontend_tugas_akhir/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // Simulate loading process
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the next screen after loading
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HalamanAwalScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          color: bBackgroundPrimary, // Background color
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              SvgPicture.asset(
                'assets/Logo.svg',
                width: 200,
                // height: 200,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        color: bBackgroundPrimary,
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: const CircularProgressIndicator(
              color: bPrimaryVariant1,
            ),
          ),
        ),
      ),
    );
  }
}
