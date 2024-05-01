import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/switch_account_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SwitchAccountScreen(),
    );
  }
}
