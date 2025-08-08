// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Activity {

 String get name; String get description; String get locationName; int get duration; TimeOfDay get timeOfDay; bool get familyFriendly; int get price; String get destinationRef; String get ref; String get imageUrl;
/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityCopyWith<Activity> get copyWith => _$ActivityCopyWithImpl<Activity>(this as Activity, _$identity);

  /// Serializes this Activity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Activity&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.price, price) || other.price == price)&&(identical(other.destinationRef, destinationRef) || other.destinationRef == destinationRef)&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,locationName,duration,timeOfDay,familyFriendly,price,destinationRef,ref,imageUrl);

@override
String toString() {
  return 'Activity(name: $name, description: $description, locationName: $locationName, duration: $duration, timeOfDay: $timeOfDay, familyFriendly: $familyFriendly, price: $price, destinationRef: $destinationRef, ref: $ref, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ActivityCopyWith<$Res>  {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) _then) = _$ActivityCopyWithImpl;
@useResult
$Res call({
 String name, String description, String locationName, int duration, TimeOfDay timeOfDay, bool familyFriendly, int price, String destinationRef, String ref, String imageUrl
});




}
/// @nodoc
class _$ActivityCopyWithImpl<$Res>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._self, this._then);

  final Activity _self;
  final $Res Function(Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? locationName = null,Object? duration = null,Object? timeOfDay = null,Object? familyFriendly = null,Object? price = null,Object? destinationRef = null,Object? ref = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as TimeOfDay,familyFriendly: null == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,destinationRef: null == destinationRef ? _self.destinationRef : destinationRef // ignore: cast_nullable_to_non_nullable
as String,ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Activity].
extension ActivityPatterns on Activity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Activity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Activity value)  $default,){
final _that = this;
switch (_that) {
case _Activity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Activity value)?  $default,){
final _that = this;
switch (_that) {
case _Activity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String locationName,  int duration,  TimeOfDay timeOfDay,  bool familyFriendly,  int price,  String destinationRef,  String ref,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.name,_that.description,_that.locationName,_that.duration,_that.timeOfDay,_that.familyFriendly,_that.price,_that.destinationRef,_that.ref,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String locationName,  int duration,  TimeOfDay timeOfDay,  bool familyFriendly,  int price,  String destinationRef,  String ref,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Activity():
return $default(_that.name,_that.description,_that.locationName,_that.duration,_that.timeOfDay,_that.familyFriendly,_that.price,_that.destinationRef,_that.ref,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String locationName,  int duration,  TimeOfDay timeOfDay,  bool familyFriendly,  int price,  String destinationRef,  String ref,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Activity() when $default != null:
return $default(_that.name,_that.description,_that.locationName,_that.duration,_that.timeOfDay,_that.familyFriendly,_that.price,_that.destinationRef,_that.ref,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Activity implements Activity {
  const _Activity({required this.name, required this.description, required this.locationName, required this.duration, required this.timeOfDay, required this.familyFriendly, required this.price, required this.destinationRef, required this.ref, required this.imageUrl});
  factory _Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

@override final  String name;
@override final  String description;
@override final  String locationName;
@override final  int duration;
@override final  TimeOfDay timeOfDay;
@override final  bool familyFriendly;
@override final  int price;
@override final  String destinationRef;
@override final  String ref;
@override final  String imageUrl;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityCopyWith<_Activity> get copyWith => __$ActivityCopyWithImpl<_Activity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Activity&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.timeOfDay, timeOfDay) || other.timeOfDay == timeOfDay)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.price, price) || other.price == price)&&(identical(other.destinationRef, destinationRef) || other.destinationRef == destinationRef)&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,locationName,duration,timeOfDay,familyFriendly,price,destinationRef,ref,imageUrl);

@override
String toString() {
  return 'Activity(name: $name, description: $description, locationName: $locationName, duration: $duration, timeOfDay: $timeOfDay, familyFriendly: $familyFriendly, price: $price, destinationRef: $destinationRef, ref: $ref, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$ActivityCopyWith(_Activity value, $Res Function(_Activity) _then) = __$ActivityCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String locationName, int duration, TimeOfDay timeOfDay, bool familyFriendly, int price, String destinationRef, String ref, String imageUrl
});




}
/// @nodoc
class __$ActivityCopyWithImpl<$Res>
    implements _$ActivityCopyWith<$Res> {
  __$ActivityCopyWithImpl(this._self, this._then);

  final _Activity _self;
  final $Res Function(_Activity) _then;

/// Create a copy of Activity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? locationName = null,Object? duration = null,Object? timeOfDay = null,Object? familyFriendly = null,Object? price = null,Object? destinationRef = null,Object? ref = null,Object? imageUrl = null,}) {
  return _then(_Activity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,timeOfDay: null == timeOfDay ? _self.timeOfDay : timeOfDay // ignore: cast_nullable_to_non_nullable
as TimeOfDay,familyFriendly: null == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,destinationRef: null == destinationRef ? _self.destinationRef : destinationRef // ignore: cast_nullable_to_non_nullable
as String,ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
