import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

ReturnType run<ReturnType>(ReturnType Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) operation_for) {
    return operation_for(this);
  }

  T also(void Function(T self) operation_for) {
    operation_for(this);
    return this;
  }
}

extension DurationFormatter on Duration {
  String dayHourMinuteSecondFormatted() {
    return [
      inDays,
      inHours.remainder(24),
      inMinutes.remainder(60),
      inSeconds.remainder(60)
    ].map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':');
  }

  String minuteSecondFormatted() {
    return [
      inMinutes.remainder(60),
      inSeconds.remainder(60),
    ].map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':');
  }
}

extension DateTimeFormatter on DateTime {
  String shortTimeFormatted() {
    return DateFormat(
      'h:mm a',
    ).format(this);
  }

  String shortTime24hFormatted() {
    return DateFormat(
      'HH:mm',
    ).format(this);
  }

  String shortDateFormatted() {
    return DateFormat(
      'MMM dd',
    ).format(this);
  }

  String fromNow() {
    return Jiffy(this).fromNow();
  }

  String fromNowShort() {
    return Jiffy(this)
        .fromNow()
        .replaceAll('a few seconds', '1s')
        .replaceAll('a second', '1s')
        .replaceAll('seconds', 's')
        .replaceAll('second', 's')
        .replaceAll('a minute', '1m')
        .replaceAll('minutes', 'm')
        .replaceAll('minute', 'm')
        .replaceAll('an hour', '1h')
        .replaceAll('hours', 'h')
        .replaceAll('hour', 'h')
        .replaceAll('a day', '1d')
        .replaceAll('days', 'd')
        .replaceAll('day', 'd')
        .replaceAll('a month', '1M')
        .replaceAll('an month', '1M')
        .replaceAll('months', 'M')
        .replaceAll('month', 'M')
        .replaceAll('a year', '1y')
        .replaceAll('an year', '1y')
        .replaceAll('years', 'y')
        .replaceAll('year', 'y')
        .replaceAll('ago', '')
        .replaceAll(' ', '');
  }

  String fromNowLimit({int dayDiff = 1}) =>
      DateTime.now().difference(this).inDays > dayDiff
          ? shortDateFormatted()
          : shortTimeFormatted();
}

Future<Uint8List?> readFileByte(String? filePath) async {
  if (filePath == null) return null;
  final myUri = Uri.parse(filePath);
  final audioFile = File.fromUri(myUri);
  try {
    return Uint8List.fromList((await audioFile.readAsBytes()));
  } catch (_) {
    return null;
  }
}

extension FileTypeEx on String {
  bool get isVideoExtension {
    final value = toLowerCase();

    return (value == 'mov') || (value == 'mp4') || (value == 'mpv');
  }

  bool get isImageExtension {
    final value = toLowerCase();

    return (value == 'png') ||
        (value == 'jpg') ||
        (value == 'jpeg') ||
        (value == 'heic');
  }

  bool get isAudioExtension {
    final value = toLowerCase();

    return (value == 'mp3') ||
        (value == 'm4a') ||
        (value == 'wav') ||
        (value == 'caf') ||
        (value == 'aiff');
  }
}

extension FileUtils on String {
  String get fileName => substring(lastIndexOf('/') + 1);

  bool get isImageFileFromMime => startsWith('image');
}

Future<String> getDeviceID() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId ?? ''; // unique ID on Android
  } else if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor ?? ''; // unique ID on iOS
  } else {
    return '';
  }
}

extension ContextEx on BuildContext {
  void hideKeyboardIfShowed() {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

void removeFocus(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

Future<ByteData> getByteFromFile(File file) async {
  return await file
      .readAsBytes()
      .then((data) => ByteData.view(data as ByteBuffer));
}

convertChatTimeUnix(int current_unix_time, int postUniqTime) {
  int diff_sec = current_unix_time - postUniqTime;
  String unit = '';
  double time = 0;
  if (diff_sec < 60) {
    time = (diff_sec == 0 ? 1 : diff_sec) as double;
    unit = '秒前'; //seconds ago
  } else {
    if (diff_sec < 3600) {
      time = diff_sec / 60;
      unit = '分前'; //minutes ago
    } else {
      if (diff_sec < 86400) {
        time = diff_sec / 3600;
        unit = '時間前'; //hours ago
      } else {
        if (diff_sec < 2764800) {
          time = diff_sec / 86400;
          unit = '日前'; //days ago
        } else {
          // Calendar cal = Calendar.getInstance(Locale.US);
          // cal.setTimeInMillis(postUniqTime * 1000L);
          // return DateFormat.format('MM月dd日', cal).toString();
          Locale locale = Locale('vi', 'VN');
          DateTime date = DateTime.fromMillisecondsSinceEpoch(postUniqTime);
          var format = DateFormat("yMd");
          var dateString = format.format(date);
          return dateString;
        }
      }
    }
  }
  return time.toString() + unit;
}


//validate email
extension EmailValidate on String {
  bool isValidEmail() {
    return RegExp(
        r"^[ a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}