import 'platform_font_plugin_platform_interface.dart';

class PlatformFontPlugin {
  Future<String?> getPlatformVersion() {
    return PlatformFontPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getPlatformFontType() {
    return PlatformFontPluginPlatform.instance.getSystemFont();
  }
}
