import 'package:droidcon_flutter/bin/app_bootsrap.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // initialize hive db
  await Hive.initFlutter();
  // open box
  var box = await Hive.openBox('task_box');
  appBootstrap(appContext: AppContext.production);
}
