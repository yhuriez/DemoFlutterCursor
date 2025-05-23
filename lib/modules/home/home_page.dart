import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/modules/tasks/ui/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// this homepage is for demo purpose only
/// You can delete it and start from scratch
class HomePage extends ConsumerWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/${TaskListPage.routeName}');
                },
                child: const Text('Go to Tasks'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
