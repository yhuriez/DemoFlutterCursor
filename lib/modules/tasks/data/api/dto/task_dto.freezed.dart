// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDTO {

 String get id; String get title; bool get isCompleted;@TimestampConverter() DateTime get createdAt;@TimestampConverter() DateTime? get completedAt;
/// Create a copy of TaskDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDTOCopyWith<TaskDTO> get copyWith => _$TaskDTOCopyWithImpl<TaskDTO>(this as TaskDTO, _$identity);

  /// Serializes this TaskDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted,createdAt,completedAt);

@override
String toString() {
  return 'TaskDTO(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $TaskDTOCopyWith<$Res>  {
  factory $TaskDTOCopyWith(TaskDTO value, $Res Function(TaskDTO) _then) = _$TaskDTOCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isCompleted,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime? completedAt
});




}
/// @nodoc
class _$TaskDTOCopyWithImpl<$Res>
    implements $TaskDTOCopyWith<$Res> {
  _$TaskDTOCopyWithImpl(this._self, this._then);

  final TaskDTO _self;
  final $Res Function(TaskDTO) _then;

/// Create a copy of TaskDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskDTO extends TaskDTO {
  const _TaskDTO({required this.id, required this.title, this.isCompleted = false, @TimestampConverter() required this.createdAt, @TimestampConverter() this.completedAt}): super._();
  factory _TaskDTO.fromJson(Map<String, dynamic> json) => _$TaskDTOFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey() final  bool isCompleted;
@override@TimestampConverter() final  DateTime createdAt;
@override@TimestampConverter() final  DateTime? completedAt;

/// Create a copy of TaskDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDTOCopyWith<_TaskDTO> get copyWith => __$TaskDTOCopyWithImpl<_TaskDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted,createdAt,completedAt);

@override
String toString() {
  return 'TaskDTO(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskDTOCopyWith<$Res> implements $TaskDTOCopyWith<$Res> {
  factory _$TaskDTOCopyWith(_TaskDTO value, $Res Function(_TaskDTO) _then) = __$TaskDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isCompleted,@TimestampConverter() DateTime createdAt,@TimestampConverter() DateTime? completedAt
});




}
/// @nodoc
class __$TaskDTOCopyWithImpl<$Res>
    implements _$TaskDTOCopyWith<$Res> {
  __$TaskDTOCopyWithImpl(this._self, this._then);

  final _TaskDTO _self;
  final $Res Function(_TaskDTO) _then;

/// Create a copy of TaskDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_TaskDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
