import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/util/named_routes.dart';
import 'util/color_palettes.dart';

class SharedModule extends Module {

  @override
  List<Bind> get binds => [
    Bind((_) => NamedRoutes()),
    Bind((_) => ColorPalettes()),
    Bind((_) => NamedRoutes())
  ];

  @override
  List<ModularRoute> get routes => [];
}
