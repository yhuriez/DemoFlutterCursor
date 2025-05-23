import 'package:demo_flutter_cursor/modules/tasks/data/api/dto/task_dto.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/api/task_api.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final taskApi = ref.read(taskApiProvider);
  return TaskRepositoryImpl(taskApi: taskApi);
});

class TaskRepositoryImpl implements TaskRepository {
  final TaskApi _taskApi;

  TaskRepositoryImpl({required TaskApi taskApi}) : _taskApi = taskApi;

  @override
  Stream<List<Task>> getTasks() {
    return _taskApi.getTasks().map((taskDTOs) {
      return taskDTOs.map(_mapDtoToTask).toList();
    });
  }

  @override
  Future<Task> createTask(String title) async {
    final taskDTO = await _taskApi.createTask(title);
    return _mapDtoToTask(taskDTO);
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskDTO = _mapTaskToDto(task);
    await _taskApi.updateTask(taskDTO);
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await _taskApi.deleteTask(taskId);
  }

  // Private methods to map between DTO and domain model
  Task _mapDtoToTask(TaskDTO dto) {
    return Task(
      id: dto.id,
      title: dto.title,
      isCompleted: dto.isCompleted,
      createdAt: dto.createdAt,
      completedAt: dto.completedAt,
    );
  }

  TaskDTO _mapTaskToDto(Task task) {
    return TaskDTO(
      id: task.id,
      title: task.title,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      completedAt: task.completedAt,
    );
  }
}
