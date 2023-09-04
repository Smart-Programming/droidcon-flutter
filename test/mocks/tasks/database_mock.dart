import 'package:droidcon_flutter/src/domain/entities/task_entity.dart';
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart';

import '../../test_helpers/build_test_widget.mocks.dart';

IDataSourceFacade<TaskEntity> mockTaskDatabase = TaskDatabaseMock();
