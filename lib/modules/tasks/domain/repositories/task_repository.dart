import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';

abstract class TaskRepository {
  /// Get all tasks for the current user
  Stream<List<Task>> getTasks();

  /// Create a new task
  Future<Task> createTask(String title);

  /// Update a task
  Future<void> updateTask(Task task);

  /// Delete a task
  Future<void> deleteTask(String taskId);
}
