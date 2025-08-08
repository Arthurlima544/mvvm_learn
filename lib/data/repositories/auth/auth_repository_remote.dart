import 'package:logging/logging.dart';
import 'package:mvvm_learn/data/services/api/model/login_request/login_request.dart';
import 'package:mvvm_learn/data/services/api/model/login_response/login_response.dart';
import 'package:mvvm_learn/utils/result.dart';

import '../../services/api/api_client.dart';
import '../../services/api/auth_api_client.dart';
import '../../services/secure_storage_service.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required SecureStorageService secureStorageService,
  }) : _apiClient = apiClient,
       _authApiClient = authApiClient,
       _secureStorageService = secureStorageService {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  }

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SecureStorageService _secureStorageService;

  bool? _isAuthenticated;
  String? _authToken;
  final _log = Logger('AuthRepositoryRemote');

  @override
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    await _fetch();

    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(email: email, password: password),
      );
      switch (result) {
        case Ok<LoginResponse>(:final value):
          _log.info('User logged in');
          _isAuthenticated = true;
          _authToken = value.token;
          return await _secureStorageService.saveToken(value.token);
        case Error<LoginResponse>():
          _log.warning('Error logging in: ${result.error}');
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('User looged out');

    try {
      final result = await _secureStorageService.saveToken(null);
      if (result is Error<void>) {
        _log.severe('Failed to clear Stored auth token');
      }
      _authToken = null;
      _isAuthenticated = false;
      return result;
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      notifyListeners();
    }
  }

  String? _authHeaderProvider() =>
      _authToken != null ? 'Bearer $_authToken' : null;

  Future<void> _fetch() async {
    final result = await _secureStorageService.fetchToken();
    switch (result) {
      case Ok<String?>(:final value):
        _authToken = value;
        _isAuthenticated = value != null;
      case Error<String?>(:final error):
        _log.severe("Failed to Fetch Token From Storage", error);
    }
  }
}
