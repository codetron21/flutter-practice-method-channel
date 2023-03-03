import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TestMethodChannelApp());
}

class TestMethodChannelApp extends StatefulWidget {
  const TestMethodChannelApp({Key? key}) : super(key: key);

  @override
  State<TestMethodChannelApp> createState() => _TestMethodChannelAppState();
}

class _TestMethodChannelAppState extends State<TestMethodChannelApp> {
  String _serial = 'xxx';
  static const platform = MethodChannel('com.codetron/serial');

  @override
  void initState() {
    _getDevSerial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(_serial),
        ),
      ),
    );
  }

  Future<void> _getDevSerial() async {
    String devSerial;
    try {
      devSerial = await platform.invokeMethod('getDevSerial');
    } on PlatformException catch (e) {
      devSerial = "Failed to get device serial: '${e.message}'.";
    }

    setState(() {
      _serial = devSerial;
    });
  }
}
