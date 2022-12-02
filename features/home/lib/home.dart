import 'package:home/presentation/ui/detail_screen.dart';
import 'package:home/presentation/ui/home_screen.dart';
import 'package:shared/util/named_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/ui/home_screen.dart';

class HomeFeatures extends Module {
  HomeFeatures();

  final _namedRoutes = Modular.get<NamedRoutes>();

  @override
  List<Bind<Object>> get binds => super.binds;

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      _namedRoutes.homeScreen,
      child: (context, args) => HomeScreen(),
    ),
    ChildRoute(
      _namedRoutes.detailScreen,
      child: (context, args) => DetailScreen(id: args.data),
    ),
  ];

}