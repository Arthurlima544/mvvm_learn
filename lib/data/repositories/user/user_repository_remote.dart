import 'package:mvvm_learn/data/services/api/model/user/user_api_model.dart';
import 'package:mvvm_learn/domain/models/user/user.dart';

import 'package:mvvm_learn/utils/result.dart';

import '../../services/api/api_client.dart';
import 'user_repository.dart';

class UserRepositoryRemote implements UserRepository {
  UserRepositoryRemote({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  User? _cachedData;
  @override
  Future<Result<User>> getUser() async {
    if (_cachedData != null) {
      return Future.value(Result.ok(_cachedData!));
    }
    final result = await _apiClient.getUser();

    switch (result) {
      case Ok<UserApiModel>(:final value):
        final user = User(name: value.name, picture: value.picture);
        _cachedData = user;
        return Result.ok(user);
      case Error<UserApiModel>(:final error):
        return Result.error(error);
    }
  }
}
