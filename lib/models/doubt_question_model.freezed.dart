// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doubt_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DoubtQuestionModel {

 String get id; List<QuestionBlockModel> get content; String get marks; bool get isSolved; String get createdAt; String get updatedAt;
/// Create a copy of DoubtQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoubtQuestionModelCopyWith<DoubtQuestionModel> get copyWith => _$DoubtQuestionModelCopyWithImpl<DoubtQuestionModel>(this as DoubtQuestionModel, _$identity);

  /// Serializes this DoubtQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoubtQuestionModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.marks, marks) || other.marks == marks)&&(identical(other.isSolved, isSolved) || other.isSolved == isSolved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(content),marks,isSolved,createdAt,updatedAt);

@override
String toString() {
  return 'DoubtQuestionModel(id: $id, content: $content, marks: $marks, isSolved: $isSolved, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DoubtQuestionModelCopyWith<$Res>  {
  factory $DoubtQuestionModelCopyWith(DoubtQuestionModel value, $Res Function(DoubtQuestionModel) _then) = _$DoubtQuestionModelCopyWithImpl;
@useResult
$Res call({
 String id, List<QuestionBlockModel> content, String marks, bool isSolved, String createdAt, String updatedAt
});




}
/// @nodoc
class _$DoubtQuestionModelCopyWithImpl<$Res>
    implements $DoubtQuestionModelCopyWith<$Res> {
  _$DoubtQuestionModelCopyWithImpl(this._self, this._then);

  final DoubtQuestionModel _self;
  final $Res Function(DoubtQuestionModel) _then;

/// Create a copy of DoubtQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? marks = null,Object? isSolved = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<QuestionBlockModel>,marks: null == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as String,isSolved: null == isSolved ? _self.isSolved : isSolved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DoubtQuestionModel].
extension DoubtQuestionModelPatterns on DoubtQuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DoubtQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DoubtQuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DoubtQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _DoubtQuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DoubtQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DoubtQuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<QuestionBlockModel> content,  String marks,  bool isSolved,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DoubtQuestionModel() when $default != null:
return $default(_that.id,_that.content,_that.marks,_that.isSolved,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<QuestionBlockModel> content,  String marks,  bool isSolved,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DoubtQuestionModel():
return $default(_that.id,_that.content,_that.marks,_that.isSolved,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<QuestionBlockModel> content,  String marks,  bool isSolved,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DoubtQuestionModel() when $default != null:
return $default(_that.id,_that.content,_that.marks,_that.isSolved,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DoubtQuestionModel implements DoubtQuestionModel {
  const _DoubtQuestionModel({required this.id, required final  List<QuestionBlockModel> content, required this.marks, required this.isSolved, required this.createdAt, required this.updatedAt}): _content = content;
  factory _DoubtQuestionModel.fromJson(Map<String, dynamic> json) => _$DoubtQuestionModelFromJson(json);

@override final  String id;
 final  List<QuestionBlockModel> _content;
@override List<QuestionBlockModel> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  String marks;
@override final  bool isSolved;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of DoubtQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DoubtQuestionModelCopyWith<_DoubtQuestionModel> get copyWith => __$DoubtQuestionModelCopyWithImpl<_DoubtQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoubtQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DoubtQuestionModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.marks, marks) || other.marks == marks)&&(identical(other.isSolved, isSolved) || other.isSolved == isSolved)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_content),marks,isSolved,createdAt,updatedAt);

@override
String toString() {
  return 'DoubtQuestionModel(id: $id, content: $content, marks: $marks, isSolved: $isSolved, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DoubtQuestionModelCopyWith<$Res> implements $DoubtQuestionModelCopyWith<$Res> {
  factory _$DoubtQuestionModelCopyWith(_DoubtQuestionModel value, $Res Function(_DoubtQuestionModel) _then) = __$DoubtQuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, List<QuestionBlockModel> content, String marks, bool isSolved, String createdAt, String updatedAt
});




}
/// @nodoc
class __$DoubtQuestionModelCopyWithImpl<$Res>
    implements _$DoubtQuestionModelCopyWith<$Res> {
  __$DoubtQuestionModelCopyWithImpl(this._self, this._then);

  final _DoubtQuestionModel _self;
  final $Res Function(_DoubtQuestionModel) _then;

/// Create a copy of DoubtQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? marks = null,Object? isSolved = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DoubtQuestionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<QuestionBlockModel>,marks: null == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as String,isSolved: null == isSolved ? _self.isSolved : isSolved // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
