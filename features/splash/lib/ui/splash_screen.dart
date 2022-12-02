import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:shared/util/named_routes.dart';

class SplashScreen extends StatefulWidget {
  final String appVersion;

  const SplashScreen({Key? key,required this.appVersion}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _namedRoutes = Modular.get<NamedRoutes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.white,
                child:FlutterLogo(size:100)
            ),
            SizedBox(),
            Text("version ${widget.appVersion}")
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
        Timer(Duration(seconds: 3), () =>
            Modular.to.pushReplacementNamed(
                '${_namedRoutes.homeScreen}')
        );
  }
}
