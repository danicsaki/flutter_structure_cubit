import 'package:app_structure_example/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xff23AA49),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/shopping-bag.svg',
                width: 41,
                height: 41,
              ),
              const SizedBox(width: 8),
              const Text(
                'Groceee',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const CircularProgressIndicator(color: Colors.white),
        ],
      ),
    );
  }
}
