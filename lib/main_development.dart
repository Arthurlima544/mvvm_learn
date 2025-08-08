import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mvvm_learn/main.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';

// Run flutter run --target lib/main_development.dart
void main() {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = Level.ALL;

  runApp(MultiProvider(providers: providersLocal, child: const MainApp()));
}
