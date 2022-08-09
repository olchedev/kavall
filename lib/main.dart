import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kavall/core/theme/kavall_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kavall/pages/delivery_statistic/bloc/delivery_statistic_bloc.dart';
import 'package:kavall/repositories/statistic/statistics_repository.dart';

import 'core/router/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: YamlAssetLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeliveryStatisticBloc>(
          create: (BuildContext context) =>
              DeliveryStatisticBloc(StatisticsRepository())
                ..add(DeliveryStatisticEvent.init()),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: KavallTheme.fetchMainTheme(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
