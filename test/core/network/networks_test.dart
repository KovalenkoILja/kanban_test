import 'package:kanban_test/core/network/network_info.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}

void main() {
  NetworkInfo networkInfoImpl;
  MockDataConnectionChecker mockDataConnection;

  setUp(() {
    mockDataConnection = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfo(connectivity: mockDataConnection);
  });

  group('isConnected', () {
    test('should forward call to connectivity wifi', () async {
      when(mockDataConnection.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.wifi);
      final result = await networkInfoImpl.isConnected;
      verify(mockDataConnection.checkConnectivity());
      expect(result, true);
    });
    test('should forward call to connectivity mobile', () async {
      when(mockDataConnection.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.mobile);
      final result = await networkInfoImpl.isConnected;
      verify(mockDataConnection.checkConnectivity());
      expect(result, true);
    });
    test('should forward call to connectivity none', () async {
      when(mockDataConnection.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.none);
      final result = await networkInfoImpl.isConnected;
      verify(mockDataConnection.checkConnectivity());
      expect(result, false);
    });
  });
}
