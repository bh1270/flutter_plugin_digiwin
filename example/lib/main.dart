import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_digiwin/flutter_plugin_digiwin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterPluginDigiwin.init();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    Future.delayed(Duration(milliseconds: 1500), () {
      FlutterPluginDigiwin.d("111", tag: 'ttttt');
      FlutterPluginDigiwin.e("2222",tag: 'eeeee');
      FlutterPluginDigiwin().testCallBack('我是测试的的吗',(obj){
        FlutterPluginDigiwin.d(obj);

      });


    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await FlutterPluginDigiwin.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
