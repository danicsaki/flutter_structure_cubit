import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/food.png',
            fit: BoxFit.fitWidth,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 52, right: 52, top: 32),
            child: Text(
              'Welcome to our store',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color(0xff115023),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/lemon.png',
                height: 196,
              ),
              Image.asset(
                'assets/images/strawberries.png',
                height: 285,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 16, right: 16),
              child: Container(
                width: screenSize.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff23aa49),
                ),
                child: const Center(
                    child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
