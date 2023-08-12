import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/build_test_widget.dart';

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
            child: DashboardPage(),
          );

          expect(find.text(AppStrings.dashboardPageTitle), findsOneWidget);
          expect(find.text(AppStrings.dashboardPageTitle), findsOneWidget);
        },
      );
    },
  );
}
