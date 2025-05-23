import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
sealed class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required String title,
    required bool isCompleted,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _Task;

  /// Create a new task with the given title
  factory Task.create({required String id, required String title}) {
    return Task(
      id: id,
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
  }

  /// Toggle the completed status of the task
  Task toggleCompleted() {
    return copyWith(
      isCompleted: !isCompleted,
      completedAt: isCompleted ? null : DateTime.now(),
    );
  }
}
