import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/toggle_task_completion_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/task_repository_fake.dart';

void main() {
  late ToggleTaskCompletionUseCase toggleTaskCompletionUseCase;
  late TaskRepositoryFake taskRepositoryFake;

  setUp(() {
    taskRepositoryFake = TaskRepositoryFake();
    toggleTaskCompletionUseCase = ToggleTaskCompletionUseCase(
      taskRepository: taskRepositoryFake,
    );
  });

  tearDown(() {
    taskRepositoryFake.dispose();
  });

  group('ToggleTaskCompletionUseCase', () {
    test(
      'When called with an incomplete task, toggles it to completed',
      () async {
        // Given
        final incompleteTask = await taskRepositoryFake.createTask(
          'Task to toggle',
        );
        expect(incompleteTask.isCompleted, false);
        expect(incompleteTask.completedAt, isNull);

        // When
        await toggleTaskCompletionUseCase(task: incompleteTask);

        // Then
        expect(taskRepositoryFake.updateTaskCallCount, 1);

        // Verify that the task was toggled to completed
        final tasks = await taskRepositoryFake.getTasks().first;
        expect(tasks.first.isCompleted, true);
        expect(tasks.first.completedAt, isNotNull);
      },
    );

    test(
      'When called with a completed task, toggles it to incomplete',
      () async {
        // Given
        final task = await taskRepositoryFake.createTask('Task to toggle');
        final now = DateTime.now();
        final completedTask = Task(
          id: task.id,
          title: task.title,
          isCompleted: true,
          createdAt: task.createdAt,
          completedAt: now,
        );
        await taskRepositoryFake.updateTask(completedTask);

        // Reset call count after setup
        taskRepositoryFake.reset();

        // When
        await toggleTaskCompletionUseCase(task: completedTask);

        // Then
        expect(taskRepositoryFake.updateTaskCallCount, 1);

        // Verify that the task was toggled to incomplete
        final tasks = await taskRepositoryFake.getTasks().first;
        expect(tasks.first.isCompleted, false);
        expect(tasks.first.completedAt, isNull);
      },
    );

    test('When repository throws an error, the error is propagated', () async {
      // Given
      final task = await taskRepositoryFake.createTask('Test Task');
      taskRepositoryFake.simulateError = true;

      // When & Then
      expect(() => toggleTaskCompletionUseCase(task: task), throwsException);
    });
  });
}
