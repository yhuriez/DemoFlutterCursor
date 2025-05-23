import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/create_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/task_repository_fake.dart';

void main() {
  late CreateTaskUseCase createTaskUseCase;
  late TaskRepositoryFake taskRepositoryFake;

  setUp(() {
    taskRepositoryFake = TaskRepositoryFake();
    createTaskUseCase = CreateTaskUseCase(taskRepository: taskRepositoryFake);
  });

  tearDown(() {
    taskRepositoryFake.dispose();
  });

  group('CreateTaskUseCase', () {
    test('When called, creates a new task using the repository', () async {
      // Given
      const taskTitle = 'New Task';

      // When
      final createdTask = await createTaskUseCase(title: taskTitle);

      // Then
      expect(
        createdTask,
        isA<Task>()
            .having((task) => task.title, 'task title', taskTitle)
            .having((task) => task.isCompleted, 'task is not completed', false),
      );
      expect(taskRepositoryFake.createTaskCallCount, 1);

      // Verify that the task was added to the list
      final tasks = await taskRepositoryFake.getTasks().first;
      expect(tasks.length, 1);
      expect(tasks.first.title, taskTitle);
    });

    test('When repository throws an error, the error is propagated', () async {
      // Given
      taskRepositoryFake.simulateError = true;

      // When & Then
      expect(() => createTaskUseCase(title: 'Test'), throwsException);
    });
  });
}
