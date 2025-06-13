import 'package:finance_flow/app/ui/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

Future<void> bootstrap(Future<void> Function(Widget) builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await findSystemLocale();
  await initializeDateFormatting(Intl.systemLocale);

  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen((record) {
    if (record.level == Level.SEVERE) {
      if (kDebugMode) {
        print('${record.level.name}: ${record.message}: ${record.time}: ${record.error}');
      }
    }
    if (kDebugMode) {
      print('${record.level.name}: ${record.message}: ${record.time}');
    }
  });

  builder(const App());
}
