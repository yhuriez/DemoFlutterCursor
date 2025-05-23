import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateTaskUseCaseProvider = Provider<UpdateTaskUseCase>((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return UpdateTaskUseCase(taskRepository: taskRepository);
});

class UpdateTaskUseCase {
  final TaskRepository _taskRepository;

  UpdateTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  /// Updates the given task
  Future<void> call({required Task task}) {
    return _taskRepository.updateTask(task);
  }
}
