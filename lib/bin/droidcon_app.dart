import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class DroidconApp extends StatelessWidget {
  const DroidconApp({
    super.key,
    required this.store,
    this.appContext = AppContext.development,
  });

  final AppContext appContext;
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: AppStrings.appName,
        initialRoute: AppRoutes.defaultRoute,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
