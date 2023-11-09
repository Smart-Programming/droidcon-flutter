// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/infrastructure/repository/task_repository.dart';
import 'package:droidcon_flutter/src/presentation/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/tasks/database_mock.dart';
import 'test_helpers/build_test_widget.dart';

void main() {
  testWidgets('Verify that app starts successfully', (
    WidgetTester tester,
  ) async {
    await buildTestWidget(
      tester: tester,
      child: LandingPage(),
    );

    expect(find.text(AppStrings.landingPageDescription), findsOneWidget);
  });

  testWidgets('test app wrapper', (
    WidgetTester tester,
  ) async {
    final AppWrapper widget = AppWrapper(
      child: Placeholder(),
      tasksRepository: TaskRepository(mockTaskDatabase),
    );

    await buildTestWidget(
      tester: tester,
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () {
                AppWrapper.of(context).updateShouldNotify(widget);
              },
            );
          },
        ),
      ),
    );

    await tester.tap(find.byType(RawMaterialButton));
    await tester.pump();

    expect(find.byType(RawMaterialButton), findsOneWidget);
  });
}
