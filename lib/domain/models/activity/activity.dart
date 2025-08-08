import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

enum TimeOfDay { any, morning, afternoon, evening, night }

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required String name,

    required String description,

    required String locationName,

    required int duration,

    required TimeOfDay timeOfDay,

    required bool familyFriendly,

    required int price,

    required String destinationRef,

    required String ref,
    required String imageUrl,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
