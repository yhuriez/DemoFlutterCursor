import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleTaskCompletionUseCaseProvider =
    Provider<ToggleTaskCompletionUseCase>((ref) {
      final taskRepository = ref.read(taskRepositoryProvider);
      return ToggleTaskCompletionUseCase(taskRepository: taskRepository);
    });

class ToggleTaskCompletionUseCase {
  final TaskRepository _taskRepository;

  ToggleTaskCompletionUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  /// Toggles the completion status of the given task
  Future<void> call({required Task task}) {
    final updatedTask = task.toggleCompleted();
    return _taskRepository.updateTask(updatedTask);
  }
}
