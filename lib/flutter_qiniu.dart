import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_qiniu/flutter_qiniu_config.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

typedef FlutterQiNiuProgress(String key, double percent);

class FlutterQiNiu {
  static const MethodChannel _channel =
  const MethodChannel('plugins.xiaoenai.com/flutter_qiniu');

  static String get platformVersion {
    return '0.0.1';
  }

  static FlutterQiNiuProgress _progress;


  static Future<Map> upload(FlutterQiNiuConfig config,
      FlutterQiNiuProgress progress) async {
    try {
      _progress = progress;
      _channel.setMethodCallHandler(_handler);

      String args = convert.jsonEncode(config.toJson());
      String result = await _channel.invokeMethod('upload', args);
      Map map = convert.jsonDecode(result);

      _progress = null;
      return Future.value(map);
    } catch (e) {
      _progress = null;
      return Future.error(e);
    }
  }

  static Future<dynamic> _handler(MethodCall call) async {
    print('--------ssss----${call.method}-----ssss---------');
    if (call.method == 'progress') {
      print('--------ssss----${call.arguments}-----ssss---------');
      Map args = convert.jsonDecode(call.arguments);
      print('--------ssss----$args---${_progress}--ssss---------');
      if (_progress != null &&
          args['key'] is String &&
          args['persent'] is double) {
        print('---------ssss---------');
        _progress(args['key'], args['persent']);
      }
      return '';
    }
  }
}
