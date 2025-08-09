import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';

import '../../utils/result.dart';

class SecureStorageService {
  static const _tokenKey = 'TOKEN';
  final _log = Logger('SecureStorageService');

  Future<Result<String?>> fetchToken() async {
    try {
      final secureStorage = FlutterSecureStorage();
      _log.finer('Trying to get token from storage');
      return Result.ok(await secureStorage.read(key: _tokenKey));
    } on Exception catch (e) {
      _log.warning('Failed to get token', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final secureStorage = FlutterSecureStorage();
      if (token == null) {
        _log.finer('Removed token');
        await secureStorage.delete(key: _tokenKey);
      } else {
        _log.finer('Replaced token');
        await secureStorage.write(key: _tokenKey, value: token);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }
}
