import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_font_plugin_platform_interface.dart';

/// An implementation of [PlatformFontPluginPlatform] that uses method channels.
class MethodChannelPlatformFontPlugin extends PlatformFontPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_font_plugin');
  @visibleForTesting
  final fontmethodChannel = const MethodChannel('my_font_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String> getSystemFont() async {
    final String font = await fontmethodChannel.invokeMethod('getSystemFont');
    return font;
  }
}
