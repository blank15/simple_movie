import 'package:core/network/dio_client.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';

class Core extends Module {
  final String baseUrl;
  final PackageInfo packageInfo;

  Core({required this.baseUrl, required this.packageInfo, });

  @override
  List<Bind> get binds => [
    Bind((_) => Modular.get<DioClient>().dio),
    Bind((_) => DioClient(
      apiBaseUrl: baseUrl,)),
    Bind((_) => packageInfo),
  ];

  @override
  List<ModularRoute> get routes => [];
}
