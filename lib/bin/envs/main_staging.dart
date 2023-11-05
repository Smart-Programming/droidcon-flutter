import 'package:droidcon_flutter/bin/app_bootsrap.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  appBootstrap(appContext: AppContext.staging);
}
