// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDTO _$TaskDTOFromJson(Map json) => _TaskDTO(
  id: json['id'] as String,
  title: json['title'] as String,
  isCompleted: json['isCompleted'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  completedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['completedAt'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$TaskDTOToJson(_TaskDTO instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'isCompleted': instance.isCompleted,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'completedAt': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.completedAt,
    const TimestampConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
