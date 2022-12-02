
import 'package:about/about.dart';
import 'package:home/data/datasource/remote_home.dart';
import 'package:home/domain/repository/home_repository.dart';
import 'package:home/home.dart';
import 'package:home/data/repository/home_repository.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/home/detail/detail_bloc.dart';
import 'package:home/presentation/bloc/home/movie_bloc.dart';
import 'package:shared/app_config.dart';
import 'package:shared/style/theme.dart';
import 'package:shared/util/named_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:splashscreen/splash.dart';
class AppModule extends Module {
  final String appVersion;

  AppModule({required this.appVersion});

  @override
  List<Bind> get binds => [
    Bind((_) => RemoteMovieImpl(
      dio: Modular.get<Dio>(),
    )),
    Bind((_) => HomeRepositoryImpl(
        remoteMovie: Modular.get<RemoteMovie>()
    )),
    Bind((_) => HomeUseCaseImpl(
        homeRepository: Modular.get<HomeRepository>()
    ))
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute(
      Modular.get<NamedRoutes>().splashScreen,
      module: SplashFeatures(appVersion: appVersion),
    ),
    ModuleRoute(
      Modular.get<NamedRoutes>().homeScreen,
      module: HomeFeatures(),
    ),
    ModuleRoute(
      Modular.get<NamedRoutes>().aboutScreen,
      module: AboutFeatures(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(
              homeUseCase: Modular.get<HomeUseCase>()
          ),
        ),
        BlocProvider(
          create: (context) => DetailMovieBloc(
              homeUseCase: Modular.get<HomeUseCase>()
          ),
        )
      ],
      child: MaterialApp(
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
    ).modular(),

    );
  }
}


