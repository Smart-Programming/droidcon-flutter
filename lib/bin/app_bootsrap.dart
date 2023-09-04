import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/droidcon_app.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:droidcon_flutter/src/infrastructure/database/hive/hive.dart';
import 'package:droidcon_flutter/src/infrastructure/repository/task_repository.dart';
import 'package:flutter/material.dart';

/// [appBootstrap] is a function that will determine the entry point into the
/// application. From this entry-point, we can handle any initializations and
/// pre-launch checks necessary for the application to work properly.
FutureOr<void> appBootstrap({
  AppContext appContext = AppContext.development,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// We can start the application with a default hive database as our data
  /// source. This allows us to dynamically change our data sources without
  /// a problem since we rely on abstract classes (interfaces) as opposed to
  /// their implementation (SOLID principals)
  ///
  final IDataSourceFacade<TaskEntity> dataSource = HiveTasksDatabase();
  final ITaskRepository tasksRepository = TaskRepository(dataSource);

  /// This is the initialization of our entire application state.
  /// At this point, we can already pre-fill it with all the tasks we
  /// have found from the database if at all they were fetched.
  Store<AppState> store = Store<AppState>(
    initialState: AppState.initial(),
  );

  runApp(
    DroidconApp(
      store: store,
      tasksRepository: tasksRepository,
      appContext: appContext,
    ),
  );
}
