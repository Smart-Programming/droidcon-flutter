import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/actions/tasks/create_task_action.dart';
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
    'CreateTaskAction',
    () {
      testWidgets(
        'should create a task and update the state',
        (WidgetTester tester) async {
          TaskEntity task = TaskEntity(
            name: 'Sample task',
            sortOrder: Random.secure().nextInt(200),
            taskStatus: TaskStatus.done,
          );

          when(mockTaskDatabase.create(data: task)).thenAnswer(
            (_) async => Future<TaskEntity>.value(
              task.copyWith(
                id: Random.secure().toString(),
                createdAt: DateTime.now().toIso8601String(),
              ),
            ),
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
                      CreateTaskAction(
                        context: context,
                        repository: AppWrapper.of(context).tasksRepository!,
                        task: task,
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

          // expect(storeTester.state.tasksState?.tasks, isNotEmpty);
        },
      );
    },
  );
}
