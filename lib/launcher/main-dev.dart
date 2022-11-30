
import 'package:core/core.dart';
import 'package:core/network/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_movie/main.dart';
import 'package:shared/shared.dart';
import 'package:shared/app_config.dart';
import 'package:package_info/package_info.dart';
void main() async {
  Config.appFlavor = Flavor.DEVELOPMENT;

  WidgetsFlutterBinding.ensureInitialized();
  /// Init core and shared module

  final packageInfo = await PackageInfo.fromPlatform();
  Modular.init(SharedModule());
  Modular.init(
      Core(baseUrl: ApiConstant.baseUrlDebug, packageInfo: packageInfo));

  /// Change device orientation and force to portrait
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
      ModularApp(
        module: AppModule(
          appVersion: '${packageInfo.version}.${packageInfo.buildNumber}',
        ), child: const MovieApps(),)));
}
