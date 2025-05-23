import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list_state.freezed.dart';

@freezed
sealed class TaskListState with _$TaskListState {
  const TaskListState._();

  const factory TaskListState({
    @Default([]) List<Task> tasks,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TaskListState;

  bool get hasError => errorMessage != null;
  bool get isEmpty => tasks.isEmpty && !isLoading && !hasError;
}
