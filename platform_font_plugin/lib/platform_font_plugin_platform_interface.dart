import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_font_plugin_method_channel.dart';

abstract class PlatformFontPluginPlatform extends PlatformInterface {
  /// Constructs a PlatformFontPluginPlatform.
  PlatformFontPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformFontPluginPlatform _instance =
      MethodChannelPlatformFontPlugin();

  /// The default instance of [PlatformFontPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformFontPlugin].
  static PlatformFontPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformFontPluginPlatform] when
  /// they register themselves.
  static set instance(PlatformFontPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> getSystemFont() async {
    throw UnimplementedError(
        'platform systtem font() has not been implemented.');
  }
}
