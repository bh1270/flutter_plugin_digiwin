import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TestCallBack = void Function(dynamic obj);

class FlutterPluginDigiwin {
  static const MethodChannel _channel = MethodChannel('flutter_plugin_digiwin');
  // TestCallBack? callBack;

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static init() {
    print('init');

    LogUtil.init(tag: 'zzzz', maxLen: 100000, isDebug: true);
  }

  static void d(Object? object, {String? tag}) {
    print('dddd');

    LogUtil.d(object, tag: tag);
  }

  static void e(Object? object, {String? tag}) {
    print('eeee');

    LogUtil.e(object, tag: tag);
  }

  void testCallBack(dynamic obj,TestCallBack? callBack) async {
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              if (ObjectUtil.isNotEmpty(callBack))
                {
                  callBack!({"test": obj})
                }
            });
  }
}
