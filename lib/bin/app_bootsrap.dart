import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/droidcon_app.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:flutter/material.dart';

/// [appBootstrap] is a function that will determine the entry point into the
/// application. From this entry-point, we can handle any initializations and
/// pre-launch checks necessary for the application to work properly.
Future<void> appBootstrap({
  AppContext appContext = AppContext.development,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );
  runApp(
    DroidconApp(
      store: store,
      appContext: appContext,
    ),
  );
}
