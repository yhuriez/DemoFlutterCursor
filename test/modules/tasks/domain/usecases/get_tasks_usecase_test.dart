import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/get_tasks_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/task_repository_fake.dart';

void main() {
  late GetTasksUseCase getTasksUseCase;
  late TaskRepositoryFake taskRepositoryFake;

  setUp(() {
    taskRepositoryFake = TaskRepositoryFake();
    getTasksUseCase = GetTasksUseCase(taskRepository: taskRepositoryFake);
  });

  tearDown(() {
    taskRepositoryFake.dispose();
  });

  group('GetTasksUseCase', () {
    test(
      'When called, returns a stream of tasks from the repository',
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
        taskRepositoryFake.addFakeTasks(fakeTasks);

        // When
        final tasksStream = getTasksUseCase();

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
        expect(taskRepositoryFake.getTasksCallCount, 1);
      },
    );

    test('When repository throws an error, the error is propagated', () async {
      // Given
      taskRepositoryFake.simulateError = true;

      // When & Then
      expect(() => getTasksUseCase(), throwsException);
    });
  });
}
