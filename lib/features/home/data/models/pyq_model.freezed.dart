// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pyq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PyqModel {

 int get id; int get course; int get subject; QuestionModel get questions; int? get batch; int get year; int get sn; int get group; String? get createdAt; String? get updatedAt;
/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PyqModelCopyWith<PyqModel> get copyWith => _$PyqModelCopyWithImpl<PyqModel>(this as PyqModel, _$identity);

  /// Serializes this PyqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PyqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.questions, questions) || other.questions == questions)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.year, year) || other.year == year)&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.group, group) || other.group == group)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,course,subject,questions,batch,year,sn,group,createdAt,updatedAt);

@override
String toString() {
  return 'PyqModel(id: $id, course: $course, subject: $subject, questions: $questions, batch: $batch, year: $year, sn: $sn, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PyqModelCopyWith<$Res>  {
  factory $PyqModelCopyWith(PyqModel value, $Res Function(PyqModel) _then) = _$PyqModelCopyWithImpl;
@useResult
$Res call({
 int id, int course, int subject, QuestionModel questions, int? batch, int year, int sn, int group, String? createdAt, String? updatedAt
});


$QuestionModelCopyWith<$Res> get questions;

}
/// @nodoc
class _$PyqModelCopyWithImpl<$Res>
    implements $PyqModelCopyWith<$Res> {
  _$PyqModelCopyWithImpl(this._self, this._then);

  final PyqModel _self;
  final $Res Function(PyqModel) _then;

/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? course = null,Object? subject = null,Object? questions = null,Object? batch = freezed,Object? year = null,Object? sn = null,Object? group = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as QuestionModel,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res> get questions {
  
  return $QuestionModelCopyWith<$Res>(_self.questions, (value) {
    return _then(_self.copyWith(questions: value));
  });
}
}


/// Adds pattern-matching-related methods to [PyqModel].
extension PyqModelPatterns on PyqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PyqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PyqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PyqModel value)  $default,){
final _that = this;
switch (_that) {
case _PyqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PyqModel value)?  $default,){
final _that = this;
switch (_that) {
case _PyqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int course,  int subject,  QuestionModel questions,  int? batch,  int year,  int sn,  int group,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PyqModel() when $default != null:
return $default(_that.id,_that.course,_that.subject,_that.questions,_that.batch,_that.year,_that.sn,_that.group,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int course,  int subject,  QuestionModel questions,  int? batch,  int year,  int sn,  int group,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PyqModel():
return $default(_that.id,_that.course,_that.subject,_that.questions,_that.batch,_that.year,_that.sn,_that.group,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int course,  int subject,  QuestionModel questions,  int? batch,  int year,  int sn,  int group,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PyqModel() when $default != null:
return $default(_that.id,_that.course,_that.subject,_that.questions,_that.batch,_that.year,_that.sn,_that.group,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PyqModel implements PyqModel {
  const _PyqModel({required this.id, required this.course, required this.subject, required this.questions, this.batch, required this.year, required this.sn, required this.group, this.createdAt, this.updatedAt});
  factory _PyqModel.fromJson(Map<String, dynamic> json) => _$PyqModelFromJson(json);

@override final  int id;
@override final  int course;
@override final  int subject;
@override final  QuestionModel questions;
@override final  int? batch;
@override final  int year;
@override final  int sn;
@override final  int group;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PyqModelCopyWith<_PyqModel> get copyWith => __$PyqModelCopyWithImpl<_PyqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PyqModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PyqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.course, course) || other.course == course)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.questions, questions) || other.questions == questions)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.year, year) || other.year == year)&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.group, group) || other.group == group)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,course,subject,questions,batch,year,sn,group,createdAt,updatedAt);

@override
String toString() {
  return 'PyqModel(id: $id, course: $course, subject: $subject, questions: $questions, batch: $batch, year: $year, sn: $sn, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PyqModelCopyWith<$Res> implements $PyqModelCopyWith<$Res> {
  factory _$PyqModelCopyWith(_PyqModel value, $Res Function(_PyqModel) _then) = __$PyqModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int course, int subject, QuestionModel questions, int? batch, int year, int sn, int group, String? createdAt, String? updatedAt
});


@override $QuestionModelCopyWith<$Res> get questions;

}
/// @nodoc
class __$PyqModelCopyWithImpl<$Res>
    implements _$PyqModelCopyWith<$Res> {
  __$PyqModelCopyWithImpl(this._self, this._then);

  final _PyqModel _self;
  final $Res Function(_PyqModel) _then;

/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? course = null,Object? subject = null,Object? questions = null,Object? batch = freezed,Object? year = null,Object? sn = null,Object? group = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PyqModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,course: null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as QuestionModel,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,sn: null == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PyqModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<$Res> get questions {
  
  return $QuestionModelCopyWith<$Res>(_self.questions, (value) {
    return _then(_self.copyWith(questions: value));
  });
}
}

// dart format on
