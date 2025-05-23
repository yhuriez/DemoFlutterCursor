import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/json_converters.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
sealed class TaskDTO with _$TaskDTO {
  const TaskDTO._();

  const factory TaskDTO({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() DateTime? completedAt,
  }) = _TaskDTO;

  factory TaskDTO.fromJson(String id, Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json..['id'] = id);
}
