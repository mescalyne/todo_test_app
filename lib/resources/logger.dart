
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:logger/logger.dart';

class Log {
  static var logger = Logger(
    output: ConsoleOutput(),
    printer: MyPrinter(),
  );

  static void debug(String message) {
    logger.d(message, '', StackTrace.current);
  }

  static void info(String message) {
    logger.i(message, '', StackTrace.current);
  }

  static void warning(String message) {
    logger.w(message, '', StackTrace.current);
  }

  static void error(String message) {
    logger.e(message, '', StackTrace.current);
  }
}

class MyPrinter extends LogPrinter {
  static int methodCount = 0;
  @override
  List<String> log(LogEvent event) {
    var time = DateTime.now();
    List<String> list = [];
    if (event.level == Level.verbose) {
      list.add(' - ${event.message}');
    } else {
      list.add(
          '- [${DateFormat('dd.MM.yy HH:mm:ss').format(time)}.${time.microsecond.toString().padRight(3, '0')}] - ${event.message}');
    }
    switch (event.level) {
      case Level.debug:
        methodCount = 1;
        break;
      case Level.warning:
        methodCount = 3;
        break;
      case Level.error:
        methodCount = 5;
        break;
      case Level.info:
        methodCount = 0;
        break;
      default:
        methodCount = 0;
        break;
    }
    if (methodCount > 0) {
      List<String> stackTrace = formatStackTrace(event.stackTrace, methodCount);
      list.addAll(stackTrace);
    }
    return list;
  }
}

List<String> formatStackTrace(StackTrace? stackTrace, int methodCount) {
  var lines = stackTrace.toString().split('\n');
  int stackTraceBeginIndex = 1;
  if (stackTraceBeginIndex > 0 && stackTraceBeginIndex < lines.length - 1) {
    lines = lines.sublist(stackTraceBeginIndex);
  }
  var formatted = <String>[];
  var count = 0;
  for (var line in lines) {
    if (_discardDeviceStacktraceLine(line) ||
        _discardWebStacktraceLine(line) ||
        _discardBrowserStacktraceLine(line) ||
        line.isEmpty) {
      continue;
    }
    formatted.add(
        '- #$count |  ${''.padRight(count, '  ')}${line.replaceFirst(RegExp(r'#\d+\s+'), '')}');
    if (++count == methodCount) {
      break;
    }
  }

  if (formatted.isEmpty) {
    return [];
  } else {
    return formatted;
  }
}

bool _discardDeviceStacktraceLine(String line) {
  final _deviceStackTraceRegex = RegExp(r'#[0-9]+[\s]+(.+) \(([^\s]+)\)');
  var match = _deviceStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(2)!.startsWith('package:logger');
}

bool _discardWebStacktraceLine(String line) {
  final _webStackTraceRegex = RegExp(r'^((packages|dart-sdk)\/[^\s]+\/)');
  var match = _webStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(1)!.startsWith('packages/logger') ||
      match.group(1)!.startsWith('dart-sdk/lib');
}

bool _discardBrowserStacktraceLine(String line) {
  final _browserStackTraceRegex = RegExp(r'^(?:package:)?(dart:[^\s]+|[^\s]+)');
  var match = _browserStackTraceRegex.matchAsPrefix(line);
  if (match == null) {
    return false;
  }
  return match.group(1)!.startsWith('package:logger') ||
      match.group(1)!.startsWith('dart:');
}
