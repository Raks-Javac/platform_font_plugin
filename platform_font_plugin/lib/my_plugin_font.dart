// my_font_plugin.dart
import 'package:flutter/services.dart';

class MyFontPlugin {
  static const MethodChannel _channel = MethodChannel('my_font_plugin');

  static Future<String> getSystemFont() async {
    final String font = await _channel.invokeMethod('getSystemFont');
    return font;
  }
}
