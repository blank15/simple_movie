
import 'package:shared/app_config.dart';
import 'package:shared/style/theme.dart';
import 'package:shared/util/named_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:splashscreen/splash.dart';
class AppModule extends Module {
  final String appVersion;

  AppModule({required this.appVersion});

  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(
      Modular.get<NamedRoutes>().splashScreen,
      module: SplashScreenFeatures(appVersion: appVersion),
    ),
  ];
}

class MovieApps extends StatefulWidget {
  const MovieApps({Key? key}) : super(key: key);

  @override
  _MovieAppsState createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: Config.isDebug,
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(brightness: Brightness.light),
          child: Material(
            child: child,
          ),
        );
      },
      initialRoute: Modular.get<NamedRoutes>().splashScreen,
    ).modular();
  }
}


