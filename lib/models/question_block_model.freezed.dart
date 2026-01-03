// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionBlockModel {

 Map<String, dynamic> get data; QuestionType get type; int? get indent;
/// Create a copy of QuestionBlockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionBlockModelCopyWith<QuestionBlockModel> get copyWith => _$QuestionBlockModelCopyWithImpl<QuestionBlockModel>(this as QuestionBlockModel, _$identity);

  /// Serializes this QuestionBlockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionBlockModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.type, type) || other.type == type)&&(identical(other.indent, indent) || other.indent == indent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),type,indent);

@override
String toString() {
  return 'QuestionBlockModel(data: $data, type: $type, indent: $indent)';
}


}

/// @nodoc
abstract mixin class $QuestionBlockModelCopyWith<$Res>  {
  factory $QuestionBlockModelCopyWith(QuestionBlockModel value, $Res Function(QuestionBlockModel) _then) = _$QuestionBlockModelCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data, QuestionType type, int? indent
});




}
/// @nodoc
class _$QuestionBlockModelCopyWithImpl<$Res>
    implements $QuestionBlockModelCopyWith<$Res> {
  _$QuestionBlockModelCopyWithImpl(this._self, this._then);

  final QuestionBlockModel _self;
  final $Res Function(QuestionBlockModel) _then;

/// Create a copy of QuestionBlockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? type = null,Object? indent = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,indent: freezed == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionBlockModel].
extension QuestionBlockModelPatterns on QuestionBlockModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionBlockModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionBlockModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionBlockModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionBlockModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionBlockModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionBlockModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> data,  QuestionType type,  int? indent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionBlockModel() when $default != null:
return $default(_that.data,_that.type,_that.indent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> data,  QuestionType type,  int? indent)  $default,) {final _that = this;
switch (_that) {
case _QuestionBlockModel():
return $default(_that.data,_that.type,_that.indent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> data,  QuestionType type,  int? indent)?  $default,) {final _that = this;
switch (_that) {
case _QuestionBlockModel() when $default != null:
return $default(_that.data,_that.type,_that.indent);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _QuestionBlockModel implements QuestionBlockModel {
  const _QuestionBlockModel({required final  Map<String, dynamic> data, required this.type, this.indent}): _data = data;
  factory _QuestionBlockModel.fromJson(Map<String, dynamic> json) => _$QuestionBlockModelFromJson(json);

 final  Map<String, dynamic> _data;
@override Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override final  QuestionType type;
@override final  int? indent;

/// Create a copy of QuestionBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionBlockModelCopyWith<_QuestionBlockModel> get copyWith => __$QuestionBlockModelCopyWithImpl<_QuestionBlockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionBlockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionBlockModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.type, type) || other.type == type)&&(identical(other.indent, indent) || other.indent == indent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),type,indent);

@override
String toString() {
  return 'QuestionBlockModel(data: $data, type: $type, indent: $indent)';
}


}

/// @nodoc
abstract mixin class _$QuestionBlockModelCopyWith<$Res> implements $QuestionBlockModelCopyWith<$Res> {
  factory _$QuestionBlockModelCopyWith(_QuestionBlockModel value, $Res Function(_QuestionBlockModel) _then) = __$QuestionBlockModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> data, QuestionType type, int? indent
});




}
/// @nodoc
class __$QuestionBlockModelCopyWithImpl<$Res>
    implements _$QuestionBlockModelCopyWith<$Res> {
  __$QuestionBlockModelCopyWithImpl(this._self, this._then);

  final _QuestionBlockModel _self;
  final $Res Function(_QuestionBlockModel) _then;

/// Create a copy of QuestionBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? type = null,Object? indent = freezed,}) {
  return _then(_QuestionBlockModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,indent: freezed == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
