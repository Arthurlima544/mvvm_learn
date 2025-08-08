import 'package:logging/logging.dart';
import 'package:mvvm_learn/data/repositories/booking/booking_repository.dart';
import 'package:mvvm_learn/domain/models/destination/destination.dart';
import 'package:mvvm_learn/domain/models/itinerary_config/itinerary_config.dart';

import '../../../data/repositories/activity/activity_repository.dart';
import '../../../data/repositories/destination/destination_repository.dart';
import '../../../utils/result.dart';
import '../../models/activity/activity.dart';
import '../../models/booking/booking.dart';

class BookingCreateUseCase {
  BookingCreateUseCase({
    required DestinationRepository destinationRepository,
    required ActivityRepository activityRepository,
    required BookingRepository bookingRepository,
  }) : _bookingRepository = bookingRepository,
       _activityRepository = activityRepository,
       _destinationRepository = destinationRepository;

  final DestinationRepository _destinationRepository;
  final ActivityRepository _activityRepository;
  final BookingRepository _bookingRepository;

  final _log = Logger('BookingCreateUsecase');

  Future<Result<Booking>> createFrom(ItineraryConfig itineraryConfig) async {
    if (itineraryConfig.destination == null) {
      _log.warning('Destination is not set');
      return Result.error(Exception('Destiantion is not set'));
    }
    final destinationResult = await _fetchDestination(
      itineraryConfig.destination!,
    );

    switch (destinationResult) {
      case Ok<Destination>(:final value):
        _log.fine('Destination loaded: ${value.ref}');
      case Error<Destination>(:final error):
        _log.warning('Error fetching destination $error');
        return Result.error(error);
    }

    if (itineraryConfig.activities.isEmpty) {
      _log.warning('Activities are not set');
      return Result.error(Exception('Activities are not set'));
    }

    final activitiesResult = await _activityRepository.getByDestination(
      itineraryConfig.destination!,
    );

    switch (activitiesResult) {
      case Error<List<Activity>>(:final error):
        _log.warning('Error fetching activities: ${activitiesResult.error}');
        return Result.error(error);

      case Ok<List<Activity>>(): // continue
    }

    final activities = activitiesResult.value
        .where((activity) => itineraryConfig.activities.contains(activity.ref))
        .toList();

    _log.fine('Activities Loaded (${activities.length})');

    if (itineraryConfig.startDate == null || itineraryConfig.endDate == null) {
      _log.warning('Dates are not set');
      return Result.error(Exception('Dates are not set'));
    }

    final booking = Booking(
      startDate: itineraryConfig.startDate!,
      endDate: itineraryConfig.endDate!,
      destination: destinationResult.value,
      activity: activities,
    );

    final saveBookingresult = await _bookingRepository.createBooking(booking);

    switch (saveBookingresult) {
      case Ok<void>():
        _log.fine('Booking saved successfully');
        break;

      case Error<void>(:final error):
        _log.warning('Failed to save booking', error);
        return Result.error(error);
    }

    return Result.ok(booking);
  }

  Future<Result<Destination>> _fetchDestination(String destinationRef) async {
    final result = await _destinationRepository.getDestinations();
    switch (result) {
      case Ok<List<Destination>>(:final value):
        final destination = value.firstWhere(
          (destination) => destination.ref == destinationRef,
        );
        return Result.ok(destination);

      case Error<List<Destination>>(:final error):
        return Result.error(error);
    }
  }
}
