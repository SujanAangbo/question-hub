// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailLoginState {

 bool get isLoading; bool get isGoogleLoading;
/// Create a copy of EmailLoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailLoginStateCopyWith<EmailLoginState> get copyWith => _$EmailLoginStateCopyWithImpl<EmailLoginState>(this as EmailLoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailLoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isGoogleLoading, isGoogleLoading) || other.isGoogleLoading == isGoogleLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isGoogleLoading);

@override
String toString() {
  return 'EmailLoginState(isLoading: $isLoading, isGoogleLoading: $isGoogleLoading)';
}


}

/// @nodoc
abstract mixin class $EmailLoginStateCopyWith<$Res>  {
  factory $EmailLoginStateCopyWith(EmailLoginState value, $Res Function(EmailLoginState) _then) = _$EmailLoginStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isGoogleLoading
});




}
/// @nodoc
class _$EmailLoginStateCopyWithImpl<$Res>
    implements $EmailLoginStateCopyWith<$Res> {
  _$EmailLoginStateCopyWithImpl(this._self, this._then);

  final EmailLoginState _self;
  final $Res Function(EmailLoginState) _then;

/// Create a copy of EmailLoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isGoogleLoading = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isGoogleLoading: null == isGoogleLoading ? _self.isGoogleLoading : isGoogleLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailLoginState].
extension EmailLoginStatePatterns on EmailLoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailLoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailLoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailLoginState value)  $default,){
final _that = this;
switch (_that) {
case _EmailLoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailLoginState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailLoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isGoogleLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailLoginState() when $default != null:
return $default(_that.isLoading,_that.isGoogleLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isGoogleLoading)  $default,) {final _that = this;
switch (_that) {
case _EmailLoginState():
return $default(_that.isLoading,_that.isGoogleLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isGoogleLoading)?  $default,) {final _that = this;
switch (_that) {
case _EmailLoginState() when $default != null:
return $default(_that.isLoading,_that.isGoogleLoading);case _:
  return null;

}
}

}

/// @nodoc


class _EmailLoginState implements EmailLoginState {
  const _EmailLoginState({this.isLoading = false, this.isGoogleLoading = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isGoogleLoading;

/// Create a copy of EmailLoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailLoginStateCopyWith<_EmailLoginState> get copyWith => __$EmailLoginStateCopyWithImpl<_EmailLoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailLoginState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isGoogleLoading, isGoogleLoading) || other.isGoogleLoading == isGoogleLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isGoogleLoading);

@override
String toString() {
  return 'EmailLoginState(isLoading: $isLoading, isGoogleLoading: $isGoogleLoading)';
}


}

/// @nodoc
abstract mixin class _$EmailLoginStateCopyWith<$Res> implements $EmailLoginStateCopyWith<$Res> {
  factory _$EmailLoginStateCopyWith(_EmailLoginState value, $Res Function(_EmailLoginState) _then) = __$EmailLoginStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isGoogleLoading
});




}
/// @nodoc
class __$EmailLoginStateCopyWithImpl<$Res>
    implements _$EmailLoginStateCopyWith<$Res> {
  __$EmailLoginStateCopyWithImpl(this._self, this._then);

  final _EmailLoginState _self;
  final $Res Function(_EmailLoginState) _then;

/// Create a copy of EmailLoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isGoogleLoading = null,}) {
  return _then(_EmailLoginState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isGoogleLoading: null == isGoogleLoading ? _self.isGoogleLoading : isGoogleLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
