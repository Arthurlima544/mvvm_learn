import 'package:mvvm_learn/domain/models/itinerary_config/itinerary_config.dart';

import 'package:mvvm_learn/utils/result.dart';

import 'itinerary_config_repository.dart';

class ItineraryConfigRepositoryMemory implements ItineraryConfigRepository {
  ItineraryConfig? _itineraryConfig;

  @override
  Future<Result<ItineraryConfig>> getItinararyConfig() async {
    return Result.ok(_itineraryConfig ?? const ItineraryConfig());
  }

  @override
  Future<Result<void>> setItineraryConfig(
    ItineraryConfig itineraryConfig,
  ) async {
    _itineraryConfig = itineraryConfig;
    return const Result.ok(null);
  }
}
