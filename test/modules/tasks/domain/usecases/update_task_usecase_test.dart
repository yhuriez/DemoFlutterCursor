import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/update_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/task_repository_fake.dart';

void main() {
  late UpdateTaskUseCase updateTaskUseCase;
  late TaskRepositoryFake taskRepositoryFake;

  setUp(() {
    taskRepositoryFake = TaskRepositoryFake();
    updateTaskUseCase = UpdateTaskUseCase(taskRepository: taskRepositoryFake);
  });

  tearDown(() {
    taskRepositoryFake.dispose();
  });

  group('UpdateTaskUseCase', () {
    test('When called, updates a task using the repository', () async {
      // Given
      final task = await taskRepositoryFake.createTask('Task to update');
      final updatedTask = Task(
        id: task.id,
        title: 'Updated Task',
        isCompleted: true,
        createdAt: task.createdAt,
        completedAt: DateTime.now(),
      );

      // When
      await updateTaskUseCase(task: updatedTask);

      // Then
      expect(taskRepositoryFake.updateTaskCallCount, 1);

      // Verify that the task was updated
      final tasks = await taskRepositoryFake.getTasks().first;
      expect(tasks.first.title, 'Updated Task');
      expect(tasks.first.isCompleted, true);
      expect(tasks.first.completedAt, isNotNull);
    });

    test('When repository throws an error, the error is propagated', () async {
      // Given
      final task = await taskRepositoryFake.createTask('Test Task');
      taskRepositoryFake.simulateError = true;

      // When & Then
      expect(() => updateTaskUseCase(task: task), throwsException);
    });
  });
}
