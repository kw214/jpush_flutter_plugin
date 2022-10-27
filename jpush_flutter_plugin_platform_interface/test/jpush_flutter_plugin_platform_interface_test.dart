// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:jpush_flutter_plugin_platform_interface/jpush_flutter_plugin_platform_interface.dart';

class JpushFlutterPluginMock extends JpushFlutterPluginPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('JpushFlutterPluginPlatformInterface', () {
    late JpushFlutterPluginPlatform jpushFlutterPluginPlatform;

    setUp(() {
      jpushFlutterPluginPlatform = JpushFlutterPluginMock();
      JpushFlutterPluginPlatform.instance = jpushFlutterPluginPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await JpushFlutterPluginPlatform.instance.getPlatformName(),
          equals(JpushFlutterPluginMock.mockPlatformName),
        );
      });
    });
  });
}
