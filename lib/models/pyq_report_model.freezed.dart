// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pyq_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PyqReportModel {

 String get id; int get course; int get subject; String get message; int? get year; int? get batch; int? get sn;
/// Create a copy of PyqReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PyqReportModelCopyWith<PyqReportModel> get copyWith => _$PyqReportModelCopyWithImpl<PyqReportModel>(this as PyqReportModel, _$identity);

  /// Serializes this PyqReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PyqReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.year, year) || other.year == year)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.sn, sn) || other.sn == sn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,course,subject,message,year,batch,sn);

@override
String toString() {
  return 'PyqReportModel(id: $id, course: $course, subject: $subject, message: $message, year: $year, batch: $batch, sn: $sn)';
}


}

/// @nodoc
abstract mixin class $PyqReportModelCopyWith<$Res>  {
  factory $PyqReportModelCopyWith(PyqReportModel value, $Res Function(PyqReportModel) _then) = _$PyqReportModelCopyWithImpl;
@useResult
$Res call({
 String id, int course, int subject, String message, int? year, int? batch, int? sn
});




}
/// @nodoc
class _$PyqReportModelCopyWithImpl<$Res>
    implements $PyqReportModelCopyWith<$Res> {
  _$PyqReportModelCopyWithImpl(this._self, this._then);

  final PyqReportModel _self;
  final $Res Function(PyqReportModel) _then;

/// Create a copy of PyqReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? course = null,Object? subject = null,Object? message = null,Object? year = freezed,Object? batch = freezed,Object? sn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PyqReportModel].
extension PyqReportModelPatterns on PyqReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PyqReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PyqReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PyqReportModel value)  $default,){
final _that = this;
switch (_that) {
case _PyqReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PyqReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _PyqReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int course,  int subject,  String message,  int? year,  int? batch,  int? sn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PyqReportModel() when $default != null:
return $default(_that.id,_that.course,_that.subject,_that.message,_that.year,_that.batch,_that.sn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int course,  int subject,  String message,  int? year,  int? batch,  int? sn)  $default,) {final _that = this;
switch (_that) {
case _PyqReportModel():
return $default(_that.id,_that.course,_that.subject,_that.message,_that.year,_that.batch,_that.sn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int course,  int subject,  String message,  int? year,  int? batch,  int? sn)?  $default,) {final _that = this;
switch (_that) {
case _PyqReportModel() when $default != null:
return $default(_that.id,_that.course,_that.subject,_that.message,_that.year,_that.batch,_that.sn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PyqReportModel implements PyqReportModel {
   _PyqReportModel({required this.id, required this.course, required this.subject, required this.message, this.year, this.batch, this.sn});
  factory _PyqReportModel.fromJson(Map<String, dynamic> json) => _$PyqReportModelFromJson(json);

@override final  String id;
@override final  int course;
@override final  int subject;
@override final  String message;
@override final  int? year;
@override final  int? batch;
@override final  int? sn;

/// Create a copy of PyqReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PyqReportModelCopyWith<_PyqReportModel> get copyWith => __$PyqReportModelCopyWithImpl<_PyqReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PyqReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PyqReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.message, message) || other.message == message)&&(identical(other.year, year) || other.year == year)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.sn, sn) || other.sn == sn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,course,subject,message,year,batch,sn);

@override
String toString() {
  return 'PyqReportModel(id: $id, course: $course, subject: $subject, message: $message, year: $year, batch: $batch, sn: $sn)';
}


}

/// @nodoc
abstract mixin class _$PyqReportModelCopyWith<$Res> implements $PyqReportModelCopyWith<$Res> {
  factory _$PyqReportModelCopyWith(_PyqReportModel value, $Res Function(_PyqReportModel) _then) = __$PyqReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int course, int subject, String message, int? year, int? batch, int? sn
});




}
/// @nodoc
class __$PyqReportModelCopyWithImpl<$Res>
    implements _$PyqReportModelCopyWith<$Res> {
  __$PyqReportModelCopyWithImpl(this._self, this._then);

  final _PyqReportModel _self;
  final $Res Function(_PyqReportModel) _then;

/// Create a copy of PyqReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? course = null,Object? subject = null,Object? message = null,Object? year = freezed,Object? batch = freezed,Object? sn = freezed,}) {
  return _then(_PyqReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
