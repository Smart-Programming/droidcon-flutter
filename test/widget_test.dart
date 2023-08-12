// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/pages/landing_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helpers/build_test_widget.dart';

void main() {
  testWidgets('Verify that app starts successfully', (
    WidgetTester tester,
  ) async {
    await buildTestWidget(
      tester: tester,
      child: LandingPage(),
    );

    expect(find.text(AppStrings.landingPageTitle), findsOneWidget);
    expect(find.text(AppStrings.landingPageDescription), findsOneWidget);
  });
}
