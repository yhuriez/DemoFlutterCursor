import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return DeleteTaskUseCase(taskRepository: taskRepository);
});

class DeleteTaskUseCase {
  final TaskRepository _taskRepository;

  DeleteTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  /// Deletes the task with the given ID
  Future<void> call({required String taskId}) {
    return _taskRepository.deleteTask(taskId);
  }
}
