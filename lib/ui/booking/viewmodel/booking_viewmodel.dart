import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:mvvm_learn/domain/models/booking/booking.dart';
import 'package:mvvm_learn/domain/models/itinerary_config/itinerary_config.dart';
import 'package:mvvm_learn/utils/result.dart';

import '../../../data/repositories/booking/booking_repository.dart';
import '../../../data/repositories/itinerary_config/itinerary_config_repository.dart';
import '../../../domain/use_cases/booking/booking_create_use_case.dart';
import '../../../utils/command.dart';

class BookingViewModel extends ChangeNotifier {
  BookingViewModel({
    required BookingRepository bookingRepository,
    required ItineraryConfigRepository itineraryConfigRepository,
    required BookingCreateUseCase bookingCreateUseCase,
  }) : _bookingCreateUseCase = bookingCreateUseCase,
       _itineraryConfigRepository = itineraryConfigRepository {
    createBooking = Command0(_createBooking);
  }
  Booking? _booking;

  Booking? get booking => _booking;

  final ItineraryConfigRepository _itineraryConfigRepository;
  final BookingCreateUseCase _bookingCreateUseCase;

  late final Command0 createBooking;

  late final Command1<void, int> loadingBooking;
  final _log = Logger("BookingViewModel");

  Future<Result<void>> _createBooking() async {
    _log.fine('Loading Booking');
    final itineraryConfig = await _itineraryConfigRepository
        .getItinararyConfig();

    switch (itineraryConfig) {
      case Ok<ItineraryConfig>(:final value):
        _log.fine('Loaded stored ItineraryConfig');
        final result = await _bookingCreateUseCase.createFrom(value);
        switch (result) {
          case Ok<Booking>(:final value):
            _log.fine('Created Booking');
            _booking = value;
            notifyListeners();
            return const Result.ok(null);
          case Error<Booking>(:final error):
            _log.warning('ItineraryConfig error: $error');
        }
        break;
      case Error<ItineraryConfig>(:final error):
        _log.warning('ItineraryConfig error: $error');
        notifyListeners();
        return Result.error(error);
    }
    return Result.error(
      Exception("Unknown error occurred while creating booking"),
    );
  }
}
