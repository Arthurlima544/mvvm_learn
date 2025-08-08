import 'package:mvvm_learn/data/repositories/booking/booking_repository.dart';
import 'package:mvvm_learn/data/services/api/api_client.dart';
import 'package:mvvm_learn/data/services/api/model/booking/booking_api_model.dart';
import 'package:mvvm_learn/domain/models/booking/booking_summary.dart';
import 'package:mvvm_learn/utils/result.dart';

import '../../../domain/models/booking/booking.dart';

class BookingRepositoryRemote implements BookingRepository {
  BookingRepositoryRemote({required apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<void>> createBooking(Booking booking) async {
    try {
      final bookingApiModel = BookingApiModel(
        startDate: booking.startDate,
        endDate: booking.endDate,
        name: '${booking.destination.name}, ${booking.destination.continent}',
        destinationRef: booking.destination.ref,
        activitiesRef: booking.activity
            .map((activity) => activity.ref)
            .toList(),
      );
      return _apiClient.postBooking(bookingApiModel);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<BookingSummary>>> getBookingsList() async {
    try {
      final result = await _apiClient.getBookings();
      switch (result) {
        case Ok<List<BookingApiModel>>(:final value):
          return Result.ok(
            value
                .map(
                  (bookingApi) => BookingSummary(
                    id: bookingApi.id!,
                    name: bookingApi.name,
                    startDate: bookingApi.startDate,
                    endDate: bookingApi.endDate,
                  ),
                )
                .toList(),
          );
        case Error<List<BookingApiModel>>(:final error):
          return Result.error(error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
