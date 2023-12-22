import 'package:final_practice/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() => {loadAppFonts()});
  testGoldens('DeviceBuilder - multiple scenaruos', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(
        widget: const MyApp(),
        name: 'First Test Page',
      );

    await tester.pumpDeviceBuilder(builder,
        wrapper: materialAppWrapper(
            theme: ThemeData.light(), platform: TargetPlatform.android));

    await screenMatchesGolden(tester, 'second_screenshot');
  });
}
