// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ItineraryConfig _$ItineraryConfigFromJson(
  Map<String, dynamic> json
) {
    return _itineraryConfig.fromJson(
      json
    );
}

/// @nodoc
mixin _$ItineraryConfig {

 String? get continent; DateTime? get startDate; DateTime? get endDate; int? get guests; String? get destination; List<String> get activities;
/// Create a copy of ItineraryConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryConfigCopyWith<ItineraryConfig> get copyWith => _$ItineraryConfigCopyWithImpl<ItineraryConfig>(this as ItineraryConfig, _$identity);

  /// Serializes this ItineraryConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraryConfig&&(identical(other.continent, continent) || other.continent == continent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.destination, destination) || other.destination == destination)&&const DeepCollectionEquality().equals(other.activities, activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,continent,startDate,endDate,guests,destination,const DeepCollectionEquality().hash(activities));

@override
String toString() {
  return 'ItineraryConfig(continent: $continent, startDate: $startDate, endDate: $endDate, guests: $guests, destination: $destination, activities: $activities)';
}


}

/// @nodoc
abstract mixin class $ItineraryConfigCopyWith<$Res>  {
  factory $ItineraryConfigCopyWith(ItineraryConfig value, $Res Function(ItineraryConfig) _then) = _$ItineraryConfigCopyWithImpl;
@useResult
$Res call({
 String? continent, DateTime? startDate, DateTime? endDate, int? guests, String? destination, List<String> activities
});




}
/// @nodoc
class _$ItineraryConfigCopyWithImpl<$Res>
    implements $ItineraryConfigCopyWith<$Res> {
  _$ItineraryConfigCopyWithImpl(this._self, this._then);

  final ItineraryConfig _self;
  final $Res Function(ItineraryConfig) _then;

/// Create a copy of ItineraryConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? continent = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? guests = freezed,Object? destination = freezed,Object? activities = null,}) {
  return _then(_self.copyWith(
continent: freezed == continent ? _self.continent : continent // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,guests: freezed == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ItineraryConfig].
extension ItineraryConfigPatterns on ItineraryConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _itineraryConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _itineraryConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _itineraryConfig value)  $default,){
final _that = this;
switch (_that) {
case _itineraryConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _itineraryConfig value)?  $default,){
final _that = this;
switch (_that) {
case _itineraryConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? continent,  DateTime? startDate,  DateTime? endDate,  int? guests,  String? destination,  List<String> activities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _itineraryConfig() when $default != null:
return $default(_that.continent,_that.startDate,_that.endDate,_that.guests,_that.destination,_that.activities);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? continent,  DateTime? startDate,  DateTime? endDate,  int? guests,  String? destination,  List<String> activities)  $default,) {final _that = this;
switch (_that) {
case _itineraryConfig():
return $default(_that.continent,_that.startDate,_that.endDate,_that.guests,_that.destination,_that.activities);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? continent,  DateTime? startDate,  DateTime? endDate,  int? guests,  String? destination,  List<String> activities)?  $default,) {final _that = this;
switch (_that) {
case _itineraryConfig() when $default != null:
return $default(_that.continent,_that.startDate,_that.endDate,_that.guests,_that.destination,_that.activities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _itineraryConfig implements ItineraryConfig {
  const _itineraryConfig({this.continent, this.startDate, this.endDate, this.guests, this.destination, final  List<String> activities = const []}): _activities = activities;
  factory _itineraryConfig.fromJson(Map<String, dynamic> json) => _$itineraryConfigFromJson(json);

@override final  String? continent;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  int? guests;
@override final  String? destination;
 final  List<String> _activities;
@override@JsonKey() List<String> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}


/// Create a copy of ItineraryConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$itineraryConfigCopyWith<_itineraryConfig> get copyWith => __$itineraryConfigCopyWithImpl<_itineraryConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$itineraryConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _itineraryConfig&&(identical(other.continent, continent) || other.continent == continent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.guests, guests) || other.guests == guests)&&(identical(other.destination, destination) || other.destination == destination)&&const DeepCollectionEquality().equals(other._activities, _activities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,continent,startDate,endDate,guests,destination,const DeepCollectionEquality().hash(_activities));

@override
String toString() {
  return 'ItineraryConfig(continent: $continent, startDate: $startDate, endDate: $endDate, guests: $guests, destination: $destination, activities: $activities)';
}


}

/// @nodoc
abstract mixin class _$itineraryConfigCopyWith<$Res> implements $ItineraryConfigCopyWith<$Res> {
  factory _$itineraryConfigCopyWith(_itineraryConfig value, $Res Function(_itineraryConfig) _then) = __$itineraryConfigCopyWithImpl;
@override @useResult
$Res call({
 String? continent, DateTime? startDate, DateTime? endDate, int? guests, String? destination, List<String> activities
});




}
/// @nodoc
class __$itineraryConfigCopyWithImpl<$Res>
    implements _$itineraryConfigCopyWith<$Res> {
  __$itineraryConfigCopyWithImpl(this._self, this._then);

  final _itineraryConfig _self;
  final $Res Function(_itineraryConfig) _then;

/// Create a copy of ItineraryConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? continent = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? guests = freezed,Object? destination = freezed,Object? activities = null,}) {
  return _then(_itineraryConfig(
continent: freezed == continent ? _self.continent : continent // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,guests: freezed == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as int?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
