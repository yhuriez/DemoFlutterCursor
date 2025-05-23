import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/models/task_list_state.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/task_list_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../../test_utils.dart';

// Create a mock StateNotifier for testing
class MockTaskListStateNotifier extends StateNotifier<TaskListState>
    implements TaskListStateNotifier {
  MockTaskListStateNotifier(TaskListState initialState) : super(initialState);

  bool createTaskCalled = false;
  bool toggleTaskCompletionCalled = false;
  bool deleteTaskCalled = false;
  String? lastCreatedTaskTitle;
  Task? lastToggledTask;
  String? lastDeletedTaskId;

  @override
  Future<void> createTask(String title) async {
    createTaskCalled = true;
    lastCreatedTaskTitle = title;
  }

  @override
  Future<void> toggleTaskCompletion(Task task) async {
    toggleTaskCompletionCalled = true;
    lastToggledTask = task;
  }

  @override
  Future<void> deleteTask(String taskId) async {
    deleteTaskCalled = true;
    lastDeletedTaskId = taskId;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

void main() {
  late MockTaskListStateNotifier mockTaskListStateNotifier;
  final mockGoRouter = MockGoRouter();

  setUp(() {
    mockTaskListStateNotifier = MockTaskListStateNotifier(
      const TaskListState(isLoading: false),
    );
  });

  group('TaskListPage', () {
    testWidgets('When loading, shows loading indicator', (tester) async {
      // Given
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        const TaskListState(isLoading: true),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );

      // Then
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('When empty, shows empty state message', (tester) async {
      // Given
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        const TaskListState(isLoading: false, tasks: []),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );

      // Then
      expect(
        find.text('No tasks yet. Create your first task!'),
        findsOneWidget,
      );
    });

    testWidgets('When error, shows error message', (tester) async {
      // Given
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        const TaskListState(
          isLoading: false,
          errorMessage: 'Error loading tasks',
        ),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );

      // Then
      expect(find.text('Error loading tasks'), findsOneWidget);
    });

    testWidgets('Shows list of tasks when available', (tester) async {
      // Given
      final now = DateTime.now();
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        TaskListState(
          isLoading: false,
          tasks: [
            Task(
              id: 'task-1',
              title: 'Task 1',
              isCompleted: false,
              createdAt: now,
            ),
            Task(
              id: 'task-2',
              title: 'Task 2',
              isCompleted: true,
              createdAt: now,
              completedAt: now,
            ),
          ],
        ),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );

      // Then
      expect(find.text('Task 1'), findsOneWidget);
      expect(find.text('Task 2'), findsOneWidget);
      expect(find.byType(Checkbox), findsNWidgets(2));
    });

    testWidgets('When checkbox clicked, toggles task completion', (
      tester,
    ) async {
      // Given
      final now = DateTime.now();
      final task = Task(
        id: 'task-1',
        title: 'Task 1',
        isCompleted: false,
        createdAt: now,
      );
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        TaskListState(isLoading: false, tasks: [task]),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();

      // Then
      expect(mockTaskListStateNotifier.toggleTaskCompletionCalled, true);
      expect(mockTaskListStateNotifier.lastToggledTask?.id, task.id);
    });

    testWidgets('Tapping FAB shows dialog to create task', (tester) async {
      // Given
      mockTaskListStateNotifier = MockTaskListStateNotifier(
        const TaskListState(isLoading: false, tasks: []),
      );

      // When
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            taskListStateNotifierProvider.overrideWith(
              (ref) => mockTaskListStateNotifier,
            ),
          ],
          child: MaterialApp(home: TaskListPage()),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Then
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });
}

class MockGoRouter extends Mock implements GoRouter {}
