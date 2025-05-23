import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTasksUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  final taskRepository = ref.read(taskRepositoryProvider);
  return GetTasksUseCase(taskRepository: taskRepository);
});

class GetTasksUseCase {
  final TaskRepository _taskRepository;

  GetTasksUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;

  /// Returns a stream of all tasks
  Stream<List<Task>> call() {
    return _taskRepository.getTasks();
  }
}
