import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_api_model.freezed.dart';
part 'booking_api_model.g.dart';

@freezed
abstract class BookingApiModel with _$BookingApiModel {
  const factory BookingApiModel({
    int? id,
    required DateTime startDate,
    required DateTime endDate,
    required String name,
    required String destinationRef,
    required List<String> activitiesRef,
  }) = _BookingApiModel;

  factory BookingApiModel.fromJson(Map<String, Object?> json) =>
      _$BookingApiModelFromJson(json);
}
