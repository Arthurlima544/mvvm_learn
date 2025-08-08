import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_summary.freezed.dart';
part 'booking_summary.g.dart';

@freezed
abstract class BookingSummary with _$BookingSummary {
  const factory BookingSummary({
    required int id,

    required String name,

    required DateTime startDate,

    required DateTime endDate,
  }) = _BookingSummary;

  factory BookingSummary.fromJson(Map<String, Object?> json) =>
      _$BookingSummaryFromJson(json);
}
