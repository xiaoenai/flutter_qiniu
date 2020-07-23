import 'dart:async';

import 'package:flutter/services.dart';

class FlutterQiniu {
  static const MethodChannel _channel =
      const MethodChannel('plugins.xiaoenai.com/flutter_qiniu');

  static String get platformVersion {
    return '0.0.1';
  }


}
