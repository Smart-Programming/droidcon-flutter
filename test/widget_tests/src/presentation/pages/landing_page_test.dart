import 'package:droidcon_flutter/src/domain/constants/keys.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:droidcon_flutter/src/presentation/pages/landing_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'Landing Page',
    () {
      testWidgets(
        'renders properly',
        (
          WidgetTester tester,
        ) async {
          await buildTestWidget(
            tester: tester,
            child: LandingPage(),
          );

          expect(find.text(AppStrings.landingPageTitle), findsOneWidget);
          expect(find.text(AppStrings.landingPageDescription), findsOneWidget);
        },
      );

      testWidgets(
        'navigates to the dashboard page',
        (
          WidgetTester tester,
        ) async {
          await buildTestWidget(
            tester: tester,
            child: LandingPage(),
          );

          /// Before we navigate, we expect that
          /// we are not in the dashboard page and nothing in the
          /// dashboard page is visible
          expect(find.byType(LandingPage), findsOneWidget);
          expect(find.byType(DashboardPage), findsNothing);

          final Finder proceedBtn = find.byKey(AppKeys.proceedBtnKey);
          await tester.ensureVisible(proceedBtn);

          await tester.tap(proceedBtn);
          await tester.pumpAndSettle();

          /// After we navigate, we expect that we can find the dashboard
          /// page and associated texts
          expect(find.byType(LandingPage), findsNothing);
          expect(find.byType(DashboardPage), findsOneWidget);
          expect(find.text(AppStrings.dashboardPageTitle), findsOneWidget);
        },
      );
    },
  );
}
