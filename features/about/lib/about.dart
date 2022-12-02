
import 'package:about/ui/about_screen.dart';
import 'package:shared/util/named_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutFeatures extends Module {
  AboutFeatures();

  final _namedRoutes = Modular.get<NamedRoutes>();

  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      _namedRoutes.aboutScreen,
      child: (context, args) => const AboutScreen(),
    ),

  ];

}