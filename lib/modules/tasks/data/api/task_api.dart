import 'package:demo_flutter_cursor/modules/tasks/data/api/dto/task_dto.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/api/task_api_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskApiProvider = Provider<TaskApi>((ref) => TaskApiImpl());

abstract class TaskApi {
  /// Get all tasks for the current user
  Stream<List<TaskDTO>> getTasks();

  /// Create a new task
  Future<TaskDTO> createTask(String title);

  /// Update a task
  Future<void> updateTask(TaskDTO task);

  /// Delete a task
  Future<void> deleteTask(String taskId);
}
