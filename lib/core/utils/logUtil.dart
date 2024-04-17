/**
 * 日志打印库，方便调试
 * 如果不需要日志输出 可以设置 isShowLog = false;
 */

const String DEBUG = "debug";
const String INFO = "info";
const String ERROR = "error";

const String LOGHEADER = "调试日志";

// ANSI颜色转义码
const String resetColor = '\x1B[0m';
const String redColor = '\x1B[31m';
const String greenColor = '\x1B[32m';
const String yellowColor = '\x1B[33m';
const String blueColor = '\x1B[34m';

bool isShowLog = true;

void logDebug(String content, {String tag = "default"}) {
  if (!isShowLog) return;
  printContent(DEBUG, tag, content);
}

void logInfo(String content, {String tag = "default"}) {
  if (!isShowLog) return;
  printContent(INFO, tag, content);
}

void logError(String content, {String tag = "default"}) {
  if (!isShowLog) return;
  printContent(ERROR, tag, content);
}

void printContent(String level, String tag, String content) {
  if (isShowLog) {
    switch (level) {
      case DEBUG:
        printColored(
            "$LOGHEADER level: $level , tag: $tag , content: $content ",
            greenColor);
        break;
      case INFO:
        printColored(
            "$LOGHEADER level: $level , tag: $tag , content: $content ",
            yellowColor);
        break;
      case ERROR:
        printColored(
            "$LOGHEADER level: $level , tag: $tag , content: $content ",
            redColor);
        break;
      default:
        printColored(
            "$LOGHEADER level: $level , tag: $tag , content: $content ",
            blueColor);
    }
  }
}

void printColored(String message, String color) {
  print('$color$message$resetColor');
}
