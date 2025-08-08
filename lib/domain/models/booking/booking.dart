import 'package:freezed_annotation/freezed_annotation.dart';

import '../activity/activity.dart';
import '../destination/destination.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    int? id,

    required DateTime startDate,
    required DateTime endDate,

    required Destination destination,

    required List<Activity> activity,
  }) = _Booking;

  factory Booking.fromJson(Map<String, Object?> json) =>
      _$BookingFromJson(json);
}
