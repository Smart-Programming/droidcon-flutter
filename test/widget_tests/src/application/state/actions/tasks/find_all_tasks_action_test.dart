import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/find_all_tasks_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../mocks/tasks/database_mock.dart';
import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'FindAllTasksAction',
    () {
      testWidgets(
        'should find all tasks and add them to state',
        (WidgetTester tester) async {
          TaskEntity task = TaskEntity(
            name: 'Sample task',
            taskStatus: TaskStatus.done,
          );

          final List<TaskEntity> tasks = <TaskEntity>[];

          for (int i = 0; i < 4; i++) {
            tasks.add(
              task.copyWith(
                id: Random.secure().toString(),
                createdAt: DateTime.now().toIso8601String(),
              ),
            );
          }
          when(mockTaskDatabase.findMany()).thenAnswer(
            (_) async => Future<List<TaskEntity>>.value(tasks),
          );

          StoreTester<AppState> storeTester = StoreTester<AppState>(
            initialState: AppState.initial(),
          );
          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            child: Builder(
              builder: (BuildContext context) {
                return RawMaterialButton(
                  onPressed: () {
                    StoreProvider.dispatch(
                      context,
                      FindAllTasks(
                        context: context,
                        repository: AppWrapper.of(context).tasksRepository!,
                      ),
                    );
                  },
                );
              },
            ),
          );

          final Finder btn = find.byType(RawMaterialButton);
          expect(btn, findsOneWidget);

          await tester.tap(btn);
          await tester.pumpAndSettle();

          expect(storeTester.state.tasksState?.tasks, isNotEmpty);
        },
      );
    },
  );
}
