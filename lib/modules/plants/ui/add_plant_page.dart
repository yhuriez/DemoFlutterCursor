import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/components/add_plant_form.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/add_plant_page_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/models/add_plant_page_state.dart';
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlantPage extends ConsumerStatefulWidget {
  static const routeName = 'add-plant';

  const AddPlantPage({super.key});

  @override
  ConsumerState<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends ConsumerState<AddPlantPage> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(addPlantPageStateNotifierProvider.notifier);

    ref.listen<AddPlantPageState>(addPlantPageStateNotifierProvider, (
      previous,
      current,
    ) {
      // Show success message and navigate back when plant is successfully added
      if (current.isSuccess && previous?.isSuccess != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.plants.addPlant.successMessage),
            backgroundColor: context.colors.primary,
          ),
        );
        Navigator.of(context).pop();
      }

      // Show error message when submission fails
      if (current.errorMessage != null &&
          previous?.errorMessage != current.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(current.errorMessage!),
            backgroundColor: context.colors.error,
            action: SnackBarAction(
              label: t.common.dismiss,
              onPressed: () => notifier.clearError(),
            ),
          ),
        );
      }
    });

    final state = ref.watch(addPlantPageStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.plants.addPlant.title,
          style: context.textTheme.titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () => notifier.resetForm(),
            child: Text(
              t.plants.addPlant.reset,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddPlantForm(
            state: state,
            onNameChanged: notifier.updateName,
            onPlantTypeChanged: notifier.updatePlantType,
            onWateringFrequencyChanged: notifier.updateWateringFrequency,
            onNotesChanged: notifier.updateNotes,
            onPhotoPathChanged: notifier.updatePhotoPath,
            onSubmit: notifier.submitForm,
          ),
        ),
      ),
    );
  }
}
