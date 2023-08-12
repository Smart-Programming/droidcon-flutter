import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/application/state/states/tasks/tasks_state.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/build_test_widget.dart';

void main() {
  group('Dashboard Page', () {
    testWidgets(
      'renders properly',
      (WidgetTester tester) async {
        /// The store tester will be used in any test that may need
        /// to verify that state changes are correct
        final StoreTester<AppState> storeTester = StoreTester<AppState>(
          initialState: AppState.initial(),
        );
        await buildTestWidget(
          tester: tester,
          store: storeTester.store,
          child: DashboardPage(),
        );

        expect(find.text(AppStrings.dashboardPageTitle), findsOneWidget);
        expect(find.text(AppStrings.dashboardPageTitle), findsOneWidget);
        expect(storeTester.state.tasksState, TasksState.initial());
      },
    );
  });
}
