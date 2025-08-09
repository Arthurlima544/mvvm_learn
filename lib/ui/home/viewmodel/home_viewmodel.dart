import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:mvvm_learn/data/repositories/booking/booking_repository.dart';
import 'package:mvvm_learn/utils/command.dart';

import 'dart:developer' as dev;

import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/booking/booking_summary.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required BookingRepository bookingRepository,
    required UserRepository userRepository,
  }) : _bookingRepository = bookingRepository,
       _userRepository = userRepository {
    load = Command0(_load)..execute();
  }

  final BookingRepository _bookingRepository;
  final UserRepository _userRepository;

  List<BookingSummary> _bookings = [];
  final _log = Logger('HomeViewModel');

  late Command0 load;

  List<BookingSummary> get bookings => _bookings;

  User? get user => _user;
  User? _user;

  Future<Result> _load() async {
    try {
      final result = await _bookingRepository.getBookingsList();
      switch (result) {
        case Ok<List<BookingSummary>>():
          _bookings = result.value;
          _log.fine('Loaded ${_bookings.length} bookings');
        case Error<List<BookingSummary>>(:final error):
          _log.warning('Failed to load bookings', error);
          dev.log(
            'Ops Error... Current error state: ${load.error}',
            error: error,
          );
      }
      final userResult = await _userRepository.getUser();
      switch (userResult) {
        case Ok<User>(:final value):
          _user = value;
          _log.fine('Loaded user');
        case Error<User>(:final error):
          _log.warning('Failed to load user', error);
      }
      return userResult;
    } finally {
      notifyListeners();
    }
  }
}
