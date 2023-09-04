import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:droidcon_flutter/src/infrastructure/repository/task_repository.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../mocks/tasks/database_mock.dart';

@GenerateMocks(<Type>[],
    // ignore: always_specify_types
    customMocks: [
      MockSpec<IDataSourceFacade<TaskEntity>>(as: #TaskDatabaseMock),
    ])
FutureOr<void> buildTestWidget({
  required WidgetTester tester,
  required Widget child,
  AppContext appContext = AppContext.development,
  Store<AppState>? store,
  ITaskRepository? tasksRepository,
}) async {
  // If the store is not setup, default to the initial state
  store ??= StoreTester<AppState>(initialState: AppState.initial()).store;

  /// If there is no task repository passed at testing time, we can easily
  /// fallback to a default mocked tasks repository database that we have
  /// control over.
  tasksRepository ??= TaskRepository(mockTaskDatabase);
  await tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: AppWrapper(
        tasksRepository: tasksRepository,
        child: MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: appContext != AppContext.production,
          home: Material(child: child),
          onGenerateRoute: generateRoute,
        ),
      ),
    ),
  );
}

typedef Callback = void Function(MethodCall call);
