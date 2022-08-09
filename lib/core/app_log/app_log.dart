import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:stack_trace/stack_trace.dart';

part 'app_log_level.dart';

class AppLog {
  const AppLog._();

  /// Common name of the logs directory.
  static const logsDirName = 'logs';
  static const _logFileName = 'app_log.txt';

  static Directory? _tempDir;
  static Directory? _logsDir;
  static RandomAccessFile? _logsFile;
  static AppLogLevel _debugLevel = AppLogLevel.info;
  static AppLogLevel _logLevel = AppLogLevel.info;

  /// Returns logs [Directory] instance.
  static Directory? get logsDir => _logsDir;

  /// Returns temp [Directory] instance.
  static Directory? get tempDir => _tempDir;

  static Future<RandomAccessFile> _initLogsFile() async {
    return File(join(_logsDir!.path, _logFileName)).open(mode: FileMode.append);
  }

  /// Initialize a static [_logsFile] instance.
  static Future<void> initialize({
    /// Minimum level of debug messages.
    AppLogLevel debugLevel = AppLogLevel.info,

    /// Minimum level of logging messages.
    AppLogLevel logLevel = AppLogLevel.info,
  }) async {
    _debugLevel = debugLevel;
    _logLevel = logLevel;

    _logsFile = await _initLogsFile();
  }

  /// Common logging method.
  static void log(
    String message, {
    required AppLogLevel logLevel,
    StackTrace? stackTrace,
    Object? exception,
    bool logFirebase = true,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    final member = Trace.current().frames[2].member;

    final buffer = StringBuffer('\n')
      ..write('${logLevel.name} $timestamp $member');

    bool isMultiline = false;
    final messageBuffer = StringBuffer();
    if (message.isNotEmpty) {
      isMultiline = message.contains('\n');
      messageBuffer.writeln(message);
    }

    if (exception != null) {
      isMultiline = true;
      messageBuffer.writeln(exception);
    }

    if (stackTrace != null) {
      isMultiline = true;
      messageBuffer.writeln(stackTrace);
    }

    message = messageBuffer.toString();
    if (isMultiline) {
      buffer.write(' ML:${message.length - 1}');
    }
    buffer.write(' ');
    buffer.write(message);

    final logString = buffer.toString();

    buffer.clear();

    if (logLevel.index >= _logLevel.index) {
      _logsFile?.writeStringSync(logString);
    }

    if (logLevel.index >= _debugLevel.index) {
      print(logString);
    }
  }

  /// Log with [AppLogLevel.debug] tag.
  static void debug(
    String message, {
    StackTrace? stackTrace,
    Object? exception,
  }) {
    log(
      message,
      logLevel: AppLogLevel.debug,
      stackTrace: stackTrace,
      exception: exception,
    );
  }

  /// Log with [AppLogLevel.info] tag.
  static void info(
    String message, {
    StackTrace? stackTrace,
    Object? exception,
  }) {
    log(
      message,
      logLevel: AppLogLevel.info,
      stackTrace: stackTrace,
      exception: exception,
    );
  }

  /// Log with [AppLogLevel.warn] tag.
  static void warn(
    String message, {
    StackTrace? stackTrace,
    Object? exception,
  }) {
    log(
      message,
      logLevel: AppLogLevel.warn,
      stackTrace: stackTrace,
      exception: exception,
    );
  }

  /// Log with [AppLogLevel.error] tag.
  static void error(
    String message, {
    StackTrace? stackTrace,
    Object? exception,
  }) {
    log(
      message,
      logLevel: AppLogLevel.error,
      stackTrace: stackTrace,
      exception: exception,
    );
  }

  /// Log with [AppLogLevel.fatal] tag.
  static void fatal(
    String message, {
    StackTrace? stackTrace,
    Object? exception,
  }) {
    log(
      message,
      logLevel: AppLogLevel.fatal,
      stackTrace: stackTrace,
      exception: exception,
    );
  }
}
