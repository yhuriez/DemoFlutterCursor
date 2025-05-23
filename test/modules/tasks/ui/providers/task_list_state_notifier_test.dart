import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/create_task_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/toggle_task_completion_usecase.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/models/task_list_state.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/task_list_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/repositories/task_repository_fake.dart';

class GetTasksUseCaseFake extends GetTasksUseCase {
  GetTasksUseCaseFake() : super(taskRepository: TaskRepositoryFake());
  final TaskRepositoryFake _repository = TaskRepositoryFake();

  @override
  Stream<List<Task>> call() {
    return _repository.getTasks();
  }

  void addFakeTasks(List<Task> tasks) {
    _repository.addFakeTasks(tasks);
  }

  void simulateError() {
    _repository.simulateError = true;
  }

  void dispose() {
    _repository.dispose();
  }
}

class CreateTaskUseCaseFake extends CreateTaskUseCase {
  CreateTaskUseCaseFake() : super(taskRepository: TaskRepositoryFake());
  final TaskRepositoryFake _repository = TaskRepositoryFake();
  int callCount = 0;

  @override
  Future<Task> call({required String title}) {
    callCount++;
    return _repository.createTask(title);
  }

  void simulateError() {
    _repository.simulateError = true;
  }

  void dispose() {
    _repository.dispose();
  }
}

class ToggleTaskCompletionUseCaseFake extends ToggleTaskCompletionUseCase {
  ToggleTaskCompletionUseCaseFake()
    : super(taskRepository: TaskRepositoryFake());
  final TaskRepositoryFake _repository = TaskRepositoryFake();
  int callCount = 0;

  @override
  Future<void> call({required Task task}) async {
    callCount++;
    final toggledTask = task.toggleCompleted();
    await _repository.updateTask(toggledTask);
  }

  void simulateError() {
    _repository.simulateError = true;
  }

  void dispose() {
    _repository.dispose();
  }
}

class DeleteTaskUseCaseFake extends DeleteTaskUseCase {
  DeleteTaskUseCaseFake() : super(taskRepository: TaskRepositoryFake());
  final TaskRepositoryFake _repository = TaskRepositoryFake();
  int callCount = 0;

  @override
  Future<void> call({required String taskId}) async {
    callCount++;
    await _repository.deleteTask(taskId);
  }

  void simulateError() {
    _repository.simulateError = true;
  }

  void dispose() {
    _repository.dispose();
  }
}

void main() {
  late TaskListStateNotifier taskListStateNotifier;
  late GetTasksUseCaseFake getTasksUseCaseFake;
  late CreateTaskUseCaseFake createTaskUseCaseFake;
  late ToggleTaskCompletionUseCaseFake toggleTaskCompletionUseCaseFake;
  late DeleteTaskUseCaseFake deleteTaskUseCaseFake;

  setUp(() {
    getTasksUseCaseFake = GetTasksUseCaseFake();
    createTaskUseCaseFake = CreateTaskUseCaseFake();
    toggleTaskCompletionUseCaseFake = ToggleTaskCompletionUseCaseFake();
    deleteTaskUseCaseFake = DeleteTaskUseCaseFake();

    taskListStateNotifier = TaskListStateNotifier(
      getTasksUseCase: getTasksUseCaseFake,
      createTaskUseCase: createTaskUseCaseFake,
      toggleTaskCompletionUseCase: toggleTaskCompletionUseCaseFake,
      deleteTaskUseCase: deleteTaskUseCaseFake,
    );
  });

  tearDown(() {
    getTasksUseCaseFake.dispose();
    createTaskUseCaseFake.dispose();
    toggleTaskCompletionUseCaseFake.dispose();
    deleteTaskUseCaseFake.dispose();
  });

  group('TaskListStateNotifier', () {
    test('Initial state is loading', () {
      expect(taskListStateNotifier.state.isLoading, true);
      expect(taskListStateNotifier.state.tasks, isEmpty);
      expect(taskListStateNotifier.state.errorMessage, isNull);
    });

    test(
      'When getTasks returns tasks, state contains tasks and is not loading',
      () async {
        // Given
        final fakeTasks = [
          Task(
            id: 'task-1',
            title: 'Task 1',
            isCompleted: false,
            createdAt: DateTime.now(),
          ),
          Task(
            id: 'task-2',
            title: 'Task 2',
            isCompleted: true,
            createdAt: DateTime.now(),
            completedAt: DateTime.now(),
          ),
        ];
        getTasksUseCaseFake.addFakeTasks(fakeTasks);

        // Wait for the state to update
        await Future.delayed(const Duration(milliseconds: 100));

        // Then
        expect(taskListStateNotifier.state.isLoading, false);
        expect(taskListStateNotifier.state.tasks.length, 2);
        expect(taskListStateNotifier.state.errorMessage, isNull);
      },
    );

    test(
      'When createTask is called, use case is called with correct parameters',
      () async {
        // Given
        const taskTitle = 'New Task';

        // When
        await taskListStateNotifier.createTask(taskTitle);

        // Then
        expect(createTaskUseCaseFake.callCount, 1);
      },
    );

    test(
      'When toggleTaskCompletion is called, use case is called with correct parameters',
      () async {
        // Given
        final task = Task(
          id: 'task-1',
          title: 'Task 1',
          isCompleted: false,
          createdAt: DateTime.now(),
        );

        // When
        await taskListStateNotifier.toggleTaskCompletion(task);

        // Then
        expect(toggleTaskCompletionUseCaseFake.callCount, 1);
      },
    );

    test(
      'When deleteTask is called, use case is called with correct parameters',
      () async {
        // Given
        const taskId = 'task-1';

        // When
        await taskListStateNotifier.deleteTask(taskId);

        // Then
        expect(deleteTaskUseCaseFake.callCount, 1);
      },
    );

    test(
      'When getTasks throws an error, state contains error message',
      () async {
        // Given
        getTasksUseCaseFake.simulateError();

        // Wait for the state to update
        await Future.delayed(const Duration(milliseconds: 100));

        // Then
        expect(taskListStateNotifier.state.isLoading, false);
        expect(taskListStateNotifier.state.errorMessage, isNotNull);
      },
    );
  });
}
