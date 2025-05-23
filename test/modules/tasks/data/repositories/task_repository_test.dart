import 'package:demo_flutter_cursor/modules/tasks/data/api/dto/task_dto.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/repositories/task_repository_impl.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/repositories/task_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/api/task_api_fake.dart';

void main() {
  late TaskRepository taskRepository;
  late TaskApiFake taskApiFake;

  setUp(() {
    taskApiFake = TaskApiFake();
    taskRepository = TaskRepositoryImpl(taskApi: taskApiFake);
  });

  tearDown(() {
    taskApiFake.dispose();
  });

  group('TaskRepository', () {
    test('When getTasks is called, returns a stream of tasks', () async {
      // Given
      final fakeTasks = [
        TaskDTO(
          id: 'task-1',
          title: 'Task 1',
          isCompleted: false,
          createdAt: DateTime.now(),
        ),
        TaskDTO(
          id: 'task-2',
          title: 'Task 2',
          isCompleted: true,
          createdAt: DateTime.now(),
          completedAt: DateTime.now(),
        ),
      ];
      taskApiFake.addFakeTasks(fakeTasks);

      // When
      final tasksStream = taskRepository.getTasks();

      // Then
      expect(
        await tasksStream.first,
        isA<List<Task>>()
            .having((tasks) => tasks.length, 'tasks count', 2)
            .having((tasks) => tasks[0].id, 'first task id', 'task-1')
            .having((tasks) => tasks[0].title, 'first task title', 'Task 1')
            .having(
              (tasks) => tasks[0].isCompleted,
              'first task is not completed',
              false,
            )
            .having((tasks) => tasks[1].id, 'second task id', 'task-2')
            .having((tasks) => tasks[1].title, 'second task title', 'Task 2')
            .having(
              (tasks) => tasks[1].isCompleted,
              'second task is completed',
              true,
            ),
      );
      expect(taskApiFake.getTasksCallCount, 1);
    });

    test('When createTask is called, creates a new task', () async {
      // Given
      const taskTitle = 'New Task';

      // When
      final createdTask = await taskRepository.createTask(taskTitle);

      // Then
      expect(
        createdTask,
        isA<Task>()
            .having((task) => task.title, 'task title', taskTitle)
            .having((task) => task.isCompleted, 'task is not completed', false),
      );
      expect(taskApiFake.createTaskCallCount, 1);

      // Verify that the task was added to the list
      final tasks = await taskRepository.getTasks().first;
      expect(tasks.length, 1);
      expect(tasks.first.title, taskTitle);
    });

    test('When updateTask is called, updates the task', () async {
      // Given
      final fakeTask = TaskDTO(
        id: 'task-1',
        title: 'Task 1',
        isCompleted: false,
        createdAt: DateTime.now(),
      );
      taskApiFake.addFakeTasks([fakeTask]);
      final tasks = await taskRepository.getTasks().first;
      final taskToUpdate = tasks.first.toggleCompleted();

      // When
      await taskRepository.updateTask(taskToUpdate);

      // Then
      expect(taskApiFake.updateTaskCallCount, 1);

      // Verify that the task was updated
      final updatedTasks = await taskRepository.getTasks().first;
      expect(updatedTasks.first.isCompleted, true);
      expect(updatedTasks.first.completedAt, isNotNull);
    });

    test('When deleteTask is called, deletes the task', () async {
      // Given
      final fakeTask = TaskDTO(
        id: 'task-1',
        title: 'Task 1',
        isCompleted: false,
        createdAt: DateTime.now(),
      );
      taskApiFake.addFakeTasks([fakeTask]);
      final tasks = await taskRepository.getTasks().first;
      expect(tasks.length, 1);

      // When
      await taskRepository.deleteTask(tasks.first.id);

      // Then
      expect(taskApiFake.deleteTaskCallCount, 1);

      // Verify that the task was deleted
      final deletedTasks = await taskRepository.getTasks().first;
      expect(deletedTasks.length, 0);
    });

    test('When TaskApi throws an error, the error is propagated', () async {
      // Given
      taskApiFake.simulateError = true;

      // When & Then
      expect(() => taskRepository.getTasks(), throwsException);
      expect(() => taskRepository.createTask('Test'), throwsException);
      expect(
        () => taskRepository.updateTask(
          Task(
            id: 'task-1',
            title: 'Task 1',
            isCompleted: false,
            createdAt: DateTime.now(),
          ),
        ),
        throwsException,
      );
      expect(() => taskRepository.deleteTask('task-1'), throwsException);
    });
  });
}
