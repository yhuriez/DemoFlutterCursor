import 'package:demo_flutter_cursor/modules/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repositories/task_repository_fake.dart';

void main() {
  late DeleteTaskUseCase deleteTaskUseCase;
  late TaskRepositoryFake taskRepositoryFake;

  setUp(() {
    taskRepositoryFake = TaskRepositoryFake();
    deleteTaskUseCase = DeleteTaskUseCase(taskRepository: taskRepositoryFake);
  });

  tearDown(() {
    taskRepositoryFake.dispose();
  });

  group('DeleteTaskUseCase', () {
    test('When called, deletes a task using the repository', () async {
      // Given
      final task = await taskRepositoryFake.createTask('Task to delete');
      final tasks = await taskRepositoryFake.getTasks().first;
      expect(tasks.length, 1);

      // Reset call count after setup
      taskRepositoryFake.reset();

      // When
      await deleteTaskUseCase(taskId: task.id);

      // Then
      expect(taskRepositoryFake.deleteTaskCallCount, 1);

      // Verify that the task was deleted
      final tasksAfterDeletion = await taskRepositoryFake.getTasks().first;
      expect(tasksAfterDeletion.length, 0);
    });

    test('When repository throws an error, the error is propagated', () async {
      // Given
      final task = await taskRepositoryFake.createTask('Test Task');
      taskRepositoryFake.simulateError = true;

      // When & Then
      expect(() => deleteTaskUseCase(taskId: task.id), throwsException);
    });
  });
}
