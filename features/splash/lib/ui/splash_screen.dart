import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String appVersion;

  const SplashScreen({Key? key,required this.appVersion}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text("Splash Screen ${widget.appVersion}")
        ],
      ),
    );
  }
}
