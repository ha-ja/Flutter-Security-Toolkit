import 'package:flutter_security_toolkit/src/flutter_security_toolkit_method_channel.dart';
import 'package:flutter_security_toolkit/src/flutter_security_toolkit_platform_interface.dart';
import 'package:flutter_security_toolkit/src/threat_detection_center.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSecurityToolkitPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSecurityToolkitPlatform {
  @override
  Future<bool?> areHooksDetected() => Future.value(false);

  @override
  Future<bool?> areRootPrivilegesDetected() => Future.value(false);

  @override
  Future<bool?> isSimulatorDetected() => Future.value(false);
}

void main() {
  final FlutterSecurityToolkitPlatform initialPlatform =
      FlutterSecurityToolkitPlatform.instance;

  test('$MethodChannelFlutterSecurityToolkit is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelFlutterSecurityToolkit>());
  });

  test('areRootPrivilegesDetected', () async {
    MockFlutterSecurityToolkitPlatform fakePlatform =
        MockFlutterSecurityToolkitPlatform();
    FlutterSecurityToolkitPlatform.instance = fakePlatform;

    expect(await ThreatDetectionCenter.areRootPrivilegesDetected(), false);
  });

  test('areHooksDetected', () async {
    MockFlutterSecurityToolkitPlatform fakePlatform =
        MockFlutterSecurityToolkitPlatform();
    FlutterSecurityToolkitPlatform.instance = fakePlatform;

    expect(await ThreatDetectionCenter.areHooksDetected(), false);
  });

  test('isSimulatorDetected', () async {
    MockFlutterSecurityToolkitPlatform fakePlatform =
        MockFlutterSecurityToolkitPlatform();
    FlutterSecurityToolkitPlatform.instance = fakePlatform;

    expect(await ThreatDetectionCenter.isSimulatorDetected(), false);
  });
}
