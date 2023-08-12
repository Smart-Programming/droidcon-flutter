import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class DroidconApp extends StatelessWidget {
  const DroidconApp({
    super.key,
    this.appContext = AppContext.development,
  });

  final AppContext appContext;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      initialRoute: AppRoutes.defaultRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
