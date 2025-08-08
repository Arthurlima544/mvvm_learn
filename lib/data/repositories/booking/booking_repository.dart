import '../../../domain/models/booking/booking.dart';
import '../../../domain/models/booking/booking_summary.dart';
import '../../../utils/result.dart';

abstract class BookingRepository {
  Future<Result<List<BookingSummary>>> getBookingsList();

  // Future<Result<booking>> getBooking(int id);

  Future<Result<void>> createBooking(Booking booking);
}
