import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/modules/tasks/domain/models/task.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/providers/task_list_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListPage extends ConsumerWidget {
  static const routeName = 'tasks';

  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListState = ref.watch(taskListStateNotifierProvider);
    final notifier = ref.read(taskListStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(context.t.tasks.list.title)),
      body: _buildBody(context, taskListState, notifier),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context, notifier),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    taskListState,
    TaskListStateNotifier notifier,
  ) {
    if (taskListState.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(context.t.tasks.list.loading),
          ],
        ),
      );
    }

    if (taskListState.hasError) {
      return Center(child: Text(taskListState.errorMessage!));
    }

    if (taskListState.isEmpty) {
      return Center(child: Text(context.t.tasks.list.empty_state));
    }

    return ListView.builder(
      itemCount: taskListState.tasks.length,
      itemBuilder: (context, index) {
        final task = taskListState.tasks[index];
        return _buildTaskItem(context, task, notifier);
      },
    );
  }

  Widget _buildTaskItem(
    BuildContext context,
    Task task,
    TaskListStateNotifier notifier,
  ) {
    return Dismissible(
      key: Key(task.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        notifier.deleteTask(task.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Task deleted'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // In a real app, we would implement an undo action
              },
            ),
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) => notifier.toggleTaskCompletion(task),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Text(
          task.isCompleted
              ? context.t.tasks.task.complete
              : context.t.tasks.task.incomplete,
          style: TextStyle(color: task.isCompleted ? Colors.grey : Colors.blue),
        ),
      ),
    );
  }

  Future<void> _showAddTaskDialog(
    BuildContext context,
    TaskListStateNotifier notifier,
  ) async {
    final controller = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Task title'),
            autofocus: true,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                notifier.createTask(value);
                Navigator.of(context).pop();
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  notifier.createTask(controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
