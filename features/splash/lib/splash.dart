import 'package:shared/util/named_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ui/splash_screen.dart';

class SplashScreenFeatures extends Module {
  final String appVersion;

  SplashScreenFeatures({required this.appVersion});

  final _namedRoutes = Modular.get<NamedRoutes>();

  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      _namedRoutes.splashScreen,
      child: (context, args) => SplashScreen(appVersion: appVersion),
    ),
  ];

}