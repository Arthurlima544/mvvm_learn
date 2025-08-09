import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mvvm_learn/data/repositories/auth/auth_repository.dart';
import 'package:mvvm_learn/utils/command.dart';
import 'package:mvvm_learn/utils/result.dart';

class LoginViewModel with ChangeNotifier {
  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    login = Command1<void, (String email, String password)>(_login);
  }

  final AuthRepository _authRepository;
  final _log = Logger('LoginViewModel');

  late Command1 login;

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    if (result is Error<void>) {
      _log.warning('Login failed! ${result.error}');
    }
    return result;
  }
}
