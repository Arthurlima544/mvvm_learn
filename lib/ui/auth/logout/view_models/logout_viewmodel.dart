import 'package:flutter/material.dart';
import 'package:mvvm_learn/data/repositories/auth/auth_repository.dart';
import 'package:mvvm_learn/data/repositories/itinerary_config/itinerary_config_repository.dart';
import 'package:mvvm_learn/domain/models/itinerary_config/itinerary_config.dart';

import '../../../../utils/command.dart';
import '../../../../utils/result.dart';

class LogoutViewModel with ChangeNotifier {
  LogoutViewModel({
    required AuthRepository authRepository,
    required ItineraryConfigRepository itineraryConfigRepository,
  }) : _authLogoutRepository = authRepository,
       _itineraryConfigRepository = itineraryConfigRepository {
    logout = Command0(_logout);
  }
  final AuthRepository _authLogoutRepository;
  final ItineraryConfigRepository _itineraryConfigRepository;
  late Command0 logout;

  Future<Result> _logout() async {
    final result = await _authLogoutRepository.logout();

    switch (result) {
      case Ok<void>():
        return _itineraryConfigRepository.setItineraryConfig(
          const ItineraryConfig(),
        );
      case Error<void>():
        return result;
    }
  }
}
