import 'package:flutter_test/flutter_test.dart';
import 'package:platform_font_plugin/platform_font_plugin.dart';
import 'package:platform_font_plugin/platform_font_plugin_platform_interface.dart';
import 'package:platform_font_plugin/platform_font_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformFontPluginPlatform
    with MockPlatformInterfaceMixin
    implements PlatformFontPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformFontPluginPlatform initialPlatform = PlatformFontPluginPlatform.instance;

  test('$MethodChannelPlatformFontPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformFontPlugin>());
  });

  test('getPlatformVersion', () async {
    PlatformFontPlugin platformFontPlugin = PlatformFontPlugin();
    MockPlatformFontPluginPlatform fakePlatform = MockPlatformFontPluginPlatform();
    PlatformFontPluginPlatform.instance = fakePlatform;

    expect(await platformFontPlugin.getPlatformVersion(), '42');
  });
}
