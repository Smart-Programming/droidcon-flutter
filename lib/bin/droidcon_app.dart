import 'package:async_redux/async_redux.dart';
import 'package:droidcon_flutter/bin/app_wrapper.dart';
import 'package:droidcon_flutter/src/application/state/app_state.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:droidcon_flutter/src/domain/constants/strings.dart';
import 'package:droidcon_flutter/src/domain/interfaces/tasks/i_task_repository.dart';
import 'package:droidcon_flutter/src/presentation/router/route_generator.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class DroidconApp extends StatelessWidget {
  const DroidconApp({
    super.key,
    required this.store,
    required this.tasksRepository,
    this.appContext = AppContext.development,
  });

  final AppContext appContext;
  final Store<AppState> store;
  final ITaskRepository? tasksRepository;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: AppWrapper(
        tasksRepository: tasksRepository,
        child: MaterialApp(
          title: AppStrings.appName,
          initialRoute: AppRoutes.defaultRoute,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
