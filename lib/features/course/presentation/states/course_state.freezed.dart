// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseState {

 CourseModel? get selectedCourse; List<CourseModel> get courses;
/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseStateCopyWith<CourseState> get copyWith => _$CourseStateCopyWithImpl<CourseState>(this as CourseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseState&&(identical(other.selectedCourse, selectedCourse) || other.selectedCourse == selectedCourse)&&const DeepCollectionEquality().equals(other.courses, courses));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCourse,const DeepCollectionEquality().hash(courses));

@override
String toString() {
  return 'CourseState(selectedCourse: $selectedCourse, courses: $courses)';
}


}

/// @nodoc
abstract mixin class $CourseStateCopyWith<$Res>  {
  factory $CourseStateCopyWith(CourseState value, $Res Function(CourseState) _then) = _$CourseStateCopyWithImpl;
@useResult
$Res call({
 CourseModel? selectedCourse, List<CourseModel> courses
});


$CourseModelCopyWith<$Res>? get selectedCourse;

}
/// @nodoc
class _$CourseStateCopyWithImpl<$Res>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._self, this._then);

  final CourseState _self;
  final $Res Function(CourseState) _then;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCourse = freezed,Object? courses = null,}) {
  return _then(_self.copyWith(
selectedCourse: freezed == selectedCourse ? _self.selectedCourse : selectedCourse // ignore: cast_nullable_to_non_nullable
as CourseModel?,courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<CourseModel>,
  ));
}
/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseModelCopyWith<$Res>? get selectedCourse {
    if (_self.selectedCourse == null) {
    return null;
  }

  return $CourseModelCopyWith<$Res>(_self.selectedCourse!, (value) {
    return _then(_self.copyWith(selectedCourse: value));
  });
}
}


/// Adds pattern-matching-related methods to [CourseState].
extension CourseStatePatterns on CourseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseState value)  $default,){
final _that = this;
switch (_that) {
case _CourseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseState value)?  $default,){
final _that = this;
switch (_that) {
case _CourseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CourseModel? selectedCourse,  List<CourseModel> courses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseState() when $default != null:
return $default(_that.selectedCourse,_that.courses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CourseModel? selectedCourse,  List<CourseModel> courses)  $default,) {final _that = this;
switch (_that) {
case _CourseState():
return $default(_that.selectedCourse,_that.courses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CourseModel? selectedCourse,  List<CourseModel> courses)?  $default,) {final _that = this;
switch (_that) {
case _CourseState() when $default != null:
return $default(_that.selectedCourse,_that.courses);case _:
  return null;

}
}

}

/// @nodoc


class _CourseState implements CourseState {
   _CourseState({required this.selectedCourse, final  List<CourseModel> courses = const []}): _courses = courses;
  

@override final  CourseModel? selectedCourse;
 final  List<CourseModel> _courses;
@override@JsonKey() List<CourseModel> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}


/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseStateCopyWith<_CourseState> get copyWith => __$CourseStateCopyWithImpl<_CourseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseState&&(identical(other.selectedCourse, selectedCourse) || other.selectedCourse == selectedCourse)&&const DeepCollectionEquality().equals(other._courses, _courses));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCourse,const DeepCollectionEquality().hash(_courses));

@override
String toString() {
  return 'CourseState(selectedCourse: $selectedCourse, courses: $courses)';
}


}

/// @nodoc
abstract mixin class _$CourseStateCopyWith<$Res> implements $CourseStateCopyWith<$Res> {
  factory _$CourseStateCopyWith(_CourseState value, $Res Function(_CourseState) _then) = __$CourseStateCopyWithImpl;
@override @useResult
$Res call({
 CourseModel? selectedCourse, List<CourseModel> courses
});


@override $CourseModelCopyWith<$Res>? get selectedCourse;

}
/// @nodoc
class __$CourseStateCopyWithImpl<$Res>
    implements _$CourseStateCopyWith<$Res> {
  __$CourseStateCopyWithImpl(this._self, this._then);

  final _CourseState _self;
  final $Res Function(_CourseState) _then;

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCourse = freezed,Object? courses = null,}) {
  return _then(_CourseState(
selectedCourse: freezed == selectedCourse ? _self.selectedCourse : selectedCourse // ignore: cast_nullable_to_non_nullable
as CourseModel?,courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<CourseModel>,
  ));
}

/// Create a copy of CourseState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseModelCopyWith<$Res>? get selectedCourse {
    if (_self.selectedCourse == null) {
    return null;
  }

  return $CourseModelCopyWith<$Res>(_self.selectedCourse!, (value) {
    return _then(_self.copyWith(selectedCourse: value));
  });
}
}

// dart format on
