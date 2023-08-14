import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/update_tasks_state_action.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../test_helpers/build_test_widget.dart';

void main() {
  group(
    'UpdateTasksStateAction',
    () {
      testWidgets(
        'should update with a list of tasks',
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
                      UpdateTasksStateAction(tasks: tasks),
                    );
                  },
                );
              },
            ),
          );

          final Finder btn = find.byType(RawMaterialButton);
          expect(btn, findsOneWidget);
          expect(storeTester.state.tasksState?.tasks, isEmpty);

          await tester.tap(btn);
          await tester.pumpAndSettle();

          expect(storeTester.state.tasksState?.tasks, isNotEmpty);
        },
      );
      testWidgets(
        'should update state with the selected task',
        (WidgetTester tester) async {
          TaskEntity task = TaskEntity(
            name: 'Sample task',
            taskStatus: TaskStatus.done,
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
                      UpdateTasksStateAction(selectedTask: task),
                    );
                  },
                );
              },
            ),
          );

          final Finder btn = find.byType(RawMaterialButton);
          expect(btn, findsOneWidget);
          expect(storeTester.state.tasksState?.selectedTask, isNull);

          await tester.tap(btn);
          await tester.pumpAndSettle();

          expect(storeTester.state.tasksState?.selectedTask, isNotNull);
        },
      );
    },
  );
}
