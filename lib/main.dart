import 'package:flutter/material.dart';
import 'package:qr_code_scanner_flutter/constant/constant.dart';
import 'package:qr_code_scanner_flutter/screen/home_screen.dart';
import 'package:qr_code_scanner_flutter/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      routes: <String, WidgetBuilder>{
        homeScreen: (BuildContext context) => const HomeScreen()
      },
      home: const SplashScreen(),
    );
  }
}
