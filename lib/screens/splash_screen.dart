import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/pattern1.png'),
            repeat: ImageRepeat.repeat),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/logo_splash.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Alireza Seif',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
