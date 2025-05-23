import 'dart:async';

import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryFake implements TaskRepository {
  final List<Task> _tasks = [];
  int getTasksCallCount = 0;
  int createTaskCallCount = 0;
  int updateTaskCallCount = 0;
  int deleteTaskCallCount = 0;
  bool simulateError = false;

  final _tasksStreamController = StreamController<List<Task>>.broadcast();

  @override
  Stream<List<Task>> getTasks() {
    getTasksCallCount++;
    if (simulateError) {
      throw Exception('Failed to get tasks');
    }

    _tasksStreamController.add(_tasks);
    return _tasksStreamController.stream;
  }

  @override
  Future<Task> createTask(String title) async {
    createTaskCallCount++;
    if (simulateError) {
      throw Exception('Failed to create task');
    }

    final newTask = Task(
      id: 'task-${_tasks.length + 1}',
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    _tasks.add(newTask);
    _tasksStreamController.add(_tasks);
    return newTask;
  }

  @override
  Future<void> updateTask(Task task) async {
    updateTaskCallCount++;
    if (simulateError) {
      throw Exception('Failed to update task');
    }

    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      _tasksStreamController.add(_tasks);
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    deleteTaskCallCount++;
    if (simulateError) {
      throw Exception('Failed to delete task');
    }

    _tasks.removeWhere((task) => task.id == taskId);
    _tasksStreamController.add(_tasks);
  }

  void addFakeTasks(List<Task> tasks) {
    _tasks.addAll(tasks);
    _tasksStreamController.add(_tasks);
  }

  void clearTasks() {
    _tasks.clear();
    _tasksStreamController.add(_tasks);
  }

  void reset() {
    getTasksCallCount = 0;
    createTaskCallCount = 0;
    updateTaskCallCount = 0;
    deleteTaskCallCount = 0;
    simulateError = false;
  }

  void dispose() {
    _tasksStreamController.close();
  }
}
