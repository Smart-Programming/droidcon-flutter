import 'package:droidcon_flutter/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:droidcon_flutter/src/presentation/pages/landing_page.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  const Route<dynamic> Function(RouteSettings settings) routeGenerator =
      generateRoute;
  final BuildContext context = MockBuildContext();
  group(
    'Route Generator Tests - ',
    () {
      test('returns default page', () {
        const RouteSettings settings = RouteSettings();

        final MaterialPageRoute<LandingPage> route =
            routeGenerator(settings) as MaterialPageRoute<LandingPage>;

        expect(route, isA<MaterialPageRoute<LandingPage>>());
        expect(route.builder(context), isA<LandingPage>());
      });

      test('returns dashboard page', () {
        const RouteSettings settings = RouteSettings(
          name: AppRoutes.dashboardRoute,
        );

        final MaterialPageRoute<DashboardPage> route =
            routeGenerator(settings) as MaterialPageRoute<DashboardPage>;

        expect(route, isA<MaterialPageRoute<DashboardPage>>());
        expect(route.builder(context), isA<DashboardPage>());
      });
    },
  );
}
