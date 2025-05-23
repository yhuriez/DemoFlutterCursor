import 'dart:async';

import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/create_task_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/toggle_task_completion_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/models/task_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskListStateNotifierProvider =
    StateNotifierProvider<TaskListStateNotifier, TaskListState>((ref) {
      return TaskListStateNotifier(
        getTasksUseCase: ref.read(getTasksUseCaseProvider),
        createTaskUseCase: ref.read(createTaskUseCaseProvider),
        toggleTaskCompletionUseCase: ref.read(
          toggleTaskCompletionUseCaseProvider,
        ),
        deleteTaskUseCase: ref.read(deleteTaskUseCaseProvider),
      );
    });

class TaskListStateNotifier extends StateNotifier<TaskListState> {
  final GetTasksUseCase _getTasksUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final ToggleTaskCompletionUseCase _toggleTaskCompletionUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  StreamSubscription<List<Task>>? _tasksSubscription;

  TaskListStateNotifier({
    required GetTasksUseCase getTasksUseCase,
    required CreateTaskUseCase createTaskUseCase,
    required ToggleTaskCompletionUseCase toggleTaskCompletionUseCase,
    required DeleteTaskUseCase deleteTaskUseCase,
  }) : _getTasksUseCase = getTasksUseCase,
       _createTaskUseCase = createTaskUseCase,
       _toggleTaskCompletionUseCase = toggleTaskCompletionUseCase,
       _deleteTaskUseCase = deleteTaskUseCase,
       super(const TaskListState(isLoading: true)) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      _tasksSubscription?.cancel();
      _tasksSubscription = _getTasksUseCase().listen(
        (tasks) {
          state = state.copyWith(
            tasks: tasks,
            isLoading: false,
            errorMessage: null,
          );
        },
        onError: (error) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to load tasks: ${error.toString()}',
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load tasks: ${e.toString()}',
      );
    }
  }

  Future<void> createTask(String title) async {
    try {
      state = state.copyWith(isLoading: true);
      await _createTaskUseCase(title: title);
      // The tasks will be updated through the subscription
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to create task: ${e.toString()}',
      );
    }
  }

  Future<void> toggleTaskCompletion(Task task) async {
    try {
      await _toggleTaskCompletionUseCase(task: task);
      // The tasks will be updated through the subscription
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to update task: ${e.toString()}',
      );
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _deleteTaskUseCase(taskId: taskId);
      // The tasks will be updated through the subscription
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to delete task: ${e.toString()}',
      );
    }
  }

  @override
  void dispose() {
    _tasksSubscription?.cancel();
    super.dispose();
  }
}
