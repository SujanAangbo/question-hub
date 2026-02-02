// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionDetailState {

 List<CommentModel> get commentData; bool get isSendButtonEnabled; File? get selectedImage; String? get imageSize; bool get isSendButtonLoading; bool get isReportLoading; bool get isDeleteLoading; bool get isReporting;
/// Create a copy of QuestionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionDetailStateCopyWith<QuestionDetailState> get copyWith => _$QuestionDetailStateCopyWithImpl<QuestionDetailState>(this as QuestionDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionDetailState&&const DeepCollectionEquality().equals(other.commentData, commentData)&&(identical(other.isSendButtonEnabled, isSendButtonEnabled) || other.isSendButtonEnabled == isSendButtonEnabled)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.imageSize, imageSize) || other.imageSize == imageSize)&&(identical(other.isSendButtonLoading, isSendButtonLoading) || other.isSendButtonLoading == isSendButtonLoading)&&(identical(other.isReportLoading, isReportLoading) || other.isReportLoading == isReportLoading)&&(identical(other.isDeleteLoading, isDeleteLoading) || other.isDeleteLoading == isDeleteLoading)&&(identical(other.isReporting, isReporting) || other.isReporting == isReporting));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(commentData),isSendButtonEnabled,selectedImage,imageSize,isSendButtonLoading,isReportLoading,isDeleteLoading,isReporting);

@override
String toString() {
  return 'QuestionDetailState(commentData: $commentData, isSendButtonEnabled: $isSendButtonEnabled, selectedImage: $selectedImage, imageSize: $imageSize, isSendButtonLoading: $isSendButtonLoading, isReportLoading: $isReportLoading, isDeleteLoading: $isDeleteLoading, isReporting: $isReporting)';
}


}

/// @nodoc
abstract mixin class $QuestionDetailStateCopyWith<$Res>  {
  factory $QuestionDetailStateCopyWith(QuestionDetailState value, $Res Function(QuestionDetailState) _then) = _$QuestionDetailStateCopyWithImpl;
@useResult
$Res call({
 List<CommentModel> commentData, bool isSendButtonEnabled, File? selectedImage, String? imageSize, bool isSendButtonLoading, bool isReportLoading, bool isDeleteLoading, bool isReporting
});




}
/// @nodoc
class _$QuestionDetailStateCopyWithImpl<$Res>
    implements $QuestionDetailStateCopyWith<$Res> {
  _$QuestionDetailStateCopyWithImpl(this._self, this._then);

  final QuestionDetailState _self;
  final $Res Function(QuestionDetailState) _then;

/// Create a copy of QuestionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentData = null,Object? isSendButtonEnabled = null,Object? selectedImage = freezed,Object? imageSize = freezed,Object? isSendButtonLoading = null,Object? isReportLoading = null,Object? isDeleteLoading = null,Object? isReporting = null,}) {
  return _then(_self.copyWith(
commentData: null == commentData ? _self.commentData : commentData // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,isSendButtonEnabled: null == isSendButtonEnabled ? _self.isSendButtonEnabled : isSendButtonEnabled // ignore: cast_nullable_to_non_nullable
as bool,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,imageSize: freezed == imageSize ? _self.imageSize : imageSize // ignore: cast_nullable_to_non_nullable
as String?,isSendButtonLoading: null == isSendButtonLoading ? _self.isSendButtonLoading : isSendButtonLoading // ignore: cast_nullable_to_non_nullable
as bool,isReportLoading: null == isReportLoading ? _self.isReportLoading : isReportLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleteLoading: null == isDeleteLoading ? _self.isDeleteLoading : isDeleteLoading // ignore: cast_nullable_to_non_nullable
as bool,isReporting: null == isReporting ? _self.isReporting : isReporting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionDetailState].
extension QuestionDetailStatePatterns on QuestionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionDetailState value)  $default,){
final _that = this;
switch (_that) {
case _QuestionDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CommentModel> commentData,  bool isSendButtonEnabled,  File? selectedImage,  String? imageSize,  bool isSendButtonLoading,  bool isReportLoading,  bool isDeleteLoading,  bool isReporting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionDetailState() when $default != null:
return $default(_that.commentData,_that.isSendButtonEnabled,_that.selectedImage,_that.imageSize,_that.isSendButtonLoading,_that.isReportLoading,_that.isDeleteLoading,_that.isReporting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CommentModel> commentData,  bool isSendButtonEnabled,  File? selectedImage,  String? imageSize,  bool isSendButtonLoading,  bool isReportLoading,  bool isDeleteLoading,  bool isReporting)  $default,) {final _that = this;
switch (_that) {
case _QuestionDetailState():
return $default(_that.commentData,_that.isSendButtonEnabled,_that.selectedImage,_that.imageSize,_that.isSendButtonLoading,_that.isReportLoading,_that.isDeleteLoading,_that.isReporting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CommentModel> commentData,  bool isSendButtonEnabled,  File? selectedImage,  String? imageSize,  bool isSendButtonLoading,  bool isReportLoading,  bool isDeleteLoading,  bool isReporting)?  $default,) {final _that = this;
switch (_that) {
case _QuestionDetailState() when $default != null:
return $default(_that.commentData,_that.isSendButtonEnabled,_that.selectedImage,_that.imageSize,_that.isSendButtonLoading,_that.isReportLoading,_that.isDeleteLoading,_that.isReporting);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionDetailState implements QuestionDetailState {
  const _QuestionDetailState({required final  List<CommentModel> commentData, this.isSendButtonEnabled = true, this.selectedImage, this.imageSize, this.isSendButtonLoading = false, this.isReportLoading = false, this.isDeleteLoading = false, this.isReporting = false}): _commentData = commentData;
  

 final  List<CommentModel> _commentData;
@override List<CommentModel> get commentData {
  if (_commentData is EqualUnmodifiableListView) return _commentData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commentData);
}

@override@JsonKey() final  bool isSendButtonEnabled;
@override final  File? selectedImage;
@override final  String? imageSize;
@override@JsonKey() final  bool isSendButtonLoading;
@override@JsonKey() final  bool isReportLoading;
@override@JsonKey() final  bool isDeleteLoading;
@override@JsonKey() final  bool isReporting;

/// Create a copy of QuestionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionDetailStateCopyWith<_QuestionDetailState> get copyWith => __$QuestionDetailStateCopyWithImpl<_QuestionDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionDetailState&&const DeepCollectionEquality().equals(other._commentData, _commentData)&&(identical(other.isSendButtonEnabled, isSendButtonEnabled) || other.isSendButtonEnabled == isSendButtonEnabled)&&(identical(other.selectedImage, selectedImage) || other.selectedImage == selectedImage)&&(identical(other.imageSize, imageSize) || other.imageSize == imageSize)&&(identical(other.isSendButtonLoading, isSendButtonLoading) || other.isSendButtonLoading == isSendButtonLoading)&&(identical(other.isReportLoading, isReportLoading) || other.isReportLoading == isReportLoading)&&(identical(other.isDeleteLoading, isDeleteLoading) || other.isDeleteLoading == isDeleteLoading)&&(identical(other.isReporting, isReporting) || other.isReporting == isReporting));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_commentData),isSendButtonEnabled,selectedImage,imageSize,isSendButtonLoading,isReportLoading,isDeleteLoading,isReporting);

@override
String toString() {
  return 'QuestionDetailState(commentData: $commentData, isSendButtonEnabled: $isSendButtonEnabled, selectedImage: $selectedImage, imageSize: $imageSize, isSendButtonLoading: $isSendButtonLoading, isReportLoading: $isReportLoading, isDeleteLoading: $isDeleteLoading, isReporting: $isReporting)';
}


}

/// @nodoc
abstract mixin class _$QuestionDetailStateCopyWith<$Res> implements $QuestionDetailStateCopyWith<$Res> {
  factory _$QuestionDetailStateCopyWith(_QuestionDetailState value, $Res Function(_QuestionDetailState) _then) = __$QuestionDetailStateCopyWithImpl;
@override @useResult
$Res call({
 List<CommentModel> commentData, bool isSendButtonEnabled, File? selectedImage, String? imageSize, bool isSendButtonLoading, bool isReportLoading, bool isDeleteLoading, bool isReporting
});




}
/// @nodoc
class __$QuestionDetailStateCopyWithImpl<$Res>
    implements _$QuestionDetailStateCopyWith<$Res> {
  __$QuestionDetailStateCopyWithImpl(this._self, this._then);

  final _QuestionDetailState _self;
  final $Res Function(_QuestionDetailState) _then;

/// Create a copy of QuestionDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentData = null,Object? isSendButtonEnabled = null,Object? selectedImage = freezed,Object? imageSize = freezed,Object? isSendButtonLoading = null,Object? isReportLoading = null,Object? isDeleteLoading = null,Object? isReporting = null,}) {
  return _then(_QuestionDetailState(
commentData: null == commentData ? _self._commentData : commentData // ignore: cast_nullable_to_non_nullable
as List<CommentModel>,isSendButtonEnabled: null == isSendButtonEnabled ? _self.isSendButtonEnabled : isSendButtonEnabled // ignore: cast_nullable_to_non_nullable
as bool,selectedImage: freezed == selectedImage ? _self.selectedImage : selectedImage // ignore: cast_nullable_to_non_nullable
as File?,imageSize: freezed == imageSize ? _self.imageSize : imageSize // ignore: cast_nullable_to_non_nullable
as String?,isSendButtonLoading: null == isSendButtonLoading ? _self.isSendButtonLoading : isSendButtonLoading // ignore: cast_nullable_to_non_nullable
as bool,isReportLoading: null == isReportLoading ? _self.isReportLoading : isReportLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleteLoading: null == isDeleteLoading ? _self.isDeleteLoading : isDeleteLoading // ignore: cast_nullable_to_non_nullable
as bool,isReporting: null == isReporting ? _self.isReporting : isReporting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
