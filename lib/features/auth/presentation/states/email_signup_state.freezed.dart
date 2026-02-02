// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmailSignupState {

 bool get isPasswordVisible; bool get isConfirmPasswordVisible; bool get isLoading;
/// Create a copy of EmailSignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailSignupStateCopyWith<EmailSignupState> get copyWith => _$EmailSignupStateCopyWithImpl<EmailSignupState>(this as EmailSignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailSignupState&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'EmailSignupState(isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $EmailSignupStateCopyWith<$Res>  {
  factory $EmailSignupStateCopyWith(EmailSignupState value, $Res Function(EmailSignupState) _then) = _$EmailSignupStateCopyWithImpl;
@useResult
$Res call({
 bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class _$EmailSignupStateCopyWithImpl<$Res>
    implements $EmailSignupStateCopyWith<$Res> {
  _$EmailSignupStateCopyWithImpl(this._self, this._then);

  final EmailSignupState _self;
  final $Res Function(EmailSignupState) _then;

/// Create a copy of EmailSignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailSignupState].
extension EmailSignupStatePatterns on EmailSignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailSignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailSignupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailSignupState value)  $default,){
final _that = this;
switch (_that) {
case _EmailSignupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailSignupState value)?  $default,){
final _that = this;
switch (_that) {
case _EmailSignupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailSignupState() when $default != null:
return $default(_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _EmailSignupState():
return $default(_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _EmailSignupState() when $default != null:
return $default(_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _EmailSignupState implements EmailSignupState {
   _EmailSignupState({this.isPasswordVisible = false, this.isConfirmPasswordVisible = false, this.isLoading = false});
  

@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isConfirmPasswordVisible;
@override@JsonKey() final  bool isLoading;

/// Create a copy of EmailSignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailSignupStateCopyWith<_EmailSignupState> get copyWith => __$EmailSignupStateCopyWithImpl<_EmailSignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailSignupState&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordVisible,isConfirmPasswordVisible,isLoading);

@override
String toString() {
  return 'EmailSignupState(isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$EmailSignupStateCopyWith<$Res> implements $EmailSignupStateCopyWith<$Res> {
  factory _$EmailSignupStateCopyWith(_EmailSignupState value, $Res Function(_EmailSignupState) _then) = __$EmailSignupStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading
});




}
/// @nodoc
class __$EmailSignupStateCopyWithImpl<$Res>
    implements _$EmailSignupStateCopyWith<$Res> {
  __$EmailSignupStateCopyWithImpl(this._self, this._then);

  final _EmailSignupState _self;
  final $Res Function(_EmailSignupState) _then;

/// Create a copy of EmailSignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,}) {
  return _then(_EmailSignupState(
isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
