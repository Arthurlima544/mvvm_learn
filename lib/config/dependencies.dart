import 'package:mvvm_learn/data/repositories/booking/booking_repository_remote.dart';
import 'package:mvvm_learn/data/repositories/destination/destination_repository.dart';
import 'package:mvvm_learn/data/repositories/destination/destination_repository_remote.dart';
import 'package:mvvm_learn/data/repositories/itinerary_config/itinerary_config_repository_memory.dart';
import 'package:mvvm_learn/data/services/api/api_client.dart';
import 'package:mvvm_learn/domain/use_cases/booking/booking_create_use_case.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/activity/activity_repository.dart';
import '../data/repositories/activity/activity_repository_remote.dart';
import '../data/repositories/booking/booking_repository.dart';
import '../data/repositories/itinerary_config/itinerary_config_repository.dart';

List<SingleChildWidget> _sharedProviders = [
  Provider(
    lazy: true,
    create: (context) => BookingCreateUseCase(
      destinationRepository: context.read<DestinationRepository>(),
      activityRepository: context.read<ActivityRepository>(),
      bookingRepository: context.read<BookingRepository>(),
    ),
  ),
];

List<SingleChildWidget> get providersLocal {
  return [
    Provider(create: (context) => ApiClient()),

    Provider(
      create: (context) =>
          DestinationRepositoryRemote(apiClient: context.read<ApiClient>())
              as DestinationRepository,
    ),

    Provider(
      create: (context) =>
          ActivityRepositoryRemote(apiClient: context.read<ApiClient>())
              as ActivityRepository,
    ),
    Provider.value(
      value: ItineraryConfigRepositoryMemory() as ItineraryConfigRepository,
    ),
    Provider(
      create: (context) =>
          BookingRepositoryRemote(apiClient: context.read<ApiClient>())
              as BookingRepository,
    ),
    ..._sharedProviders,
  ];
}
