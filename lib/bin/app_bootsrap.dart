import 'dart:async';

import 'package:droidcon_flutter/bin/droidcon_app.dart';
import 'package:droidcon_flutter/src/domain/constants/enums.dart';
import 'package:flutter/material.dart';

Future<void> appBootstrap({
  AppContext appContext = AppContext.development,
}) async {
  runApp(const DroidconApp());
}
