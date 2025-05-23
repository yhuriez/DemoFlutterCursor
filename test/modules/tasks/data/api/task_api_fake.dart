import 'dart:async';

import 'package:demo_flutter_cursor/modules/tasks/data/api/dto/task_dto.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/api/task_api.dart';

class TaskApiFake implements TaskApi {
  final List<TaskDTO> _tasks = [];
  int getTasksCallCount = 0;
  int createTaskCallCount = 0;
  int updateTaskCallCount = 0;
  int deleteTaskCallCount = 0;
  bool simulateError = false;

  final _tasksStreamController = StreamController<List<TaskDTO>>.broadcast();

  @override
  Stream<List<TaskDTO>> getTasks() {
    getTasksCallCount++;
    if (simulateError) {
      throw Exception('Failed to get tasks');
    }

    // Émet la liste de tâches actuelles et retourne le stream
    _tasksStreamController.add(_tasks);
    return _tasksStreamController.stream;
  }

  @override
  Future<TaskDTO> createTask(String title) async {
    createTaskCallCount++;
    if (simulateError) {
      throw Exception('Failed to create task');
    }

    final newTask = TaskDTO(
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
  Future<void> updateTask(TaskDTO task) async {
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

  void addFakeTasks(List<TaskDTO> tasks) {
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
