import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createTaskUseCaseProvider = Provider<CreateTaskUseCase>((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return CreateTaskUseCase(taskRepository: taskRepository);
});

class CreateTaskUseCase {
  final TaskRepository _taskRepository;

  CreateTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  /// Creates a new task with the given title
  Future<Task> call({required String title}) {
    return _taskRepository.createTask(title);
  }
}
