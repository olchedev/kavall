part of 'app_log.dart';

enum AppLogLevel {
  debug,
  info,
  warn,
  error,
  fatal,
}

extension AppLogLevelExt on AppLogLevel {
  String get name => toString().split('.').last.toUpperCase();
}
