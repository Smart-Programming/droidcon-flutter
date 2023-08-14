import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget child,
  AppContext appContext = AppContext.development,
  Store<AppState>? store,
}) async {
  // If the store is not setup, default to the initial state
  store ??= StoreTester<AppState>(initialState: AppState.initial()).store;
  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: appContext != AppContext.production,
        home: Material(child: child),
        onGenerateRoute: generateRoute,
      ),
    ),
  );
}

typedef Callback = void Function(MethodCall call);
