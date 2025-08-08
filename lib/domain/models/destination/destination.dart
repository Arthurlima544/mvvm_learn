import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination.freezed.dart';
part 'destination.g.dart';

@freezed
abstract class Destination with _$Destination {
  const factory Destination({
    required String ref,
    required String name,
    required String country,
    required String continent,
    required String knowFor,
    required List<String> tags,

    required String imageUrl,
  }) = _Destination;

  factory Destination.fromJson(Map<String, Object?> json) =>
      _$DestinationFromJson(json);
}
