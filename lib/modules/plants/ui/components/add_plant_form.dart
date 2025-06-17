import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/models/add_plant_page_state.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/widgets/plant_form_fields.dart';
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:flutter/material.dart';

class AddPlantForm extends StatelessWidget {
  final AddPlantPageState state;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPlantTypeChanged;
  final ValueChanged<int> onWateringFrequencyChanged;
  final ValueChanged<String> onNotesChanged;
  final ValueChanged<String?> onPhotoPathChanged;
  final VoidCallback onSubmit;

  const AddPlantForm({
    super.key,
    required this.state,
    required this.onNameChanged,
    required this.onPlantTypeChanged,
    required this.onWateringFrequencyChanged,
    required this.onNotesChanged,
    required this.onPhotoPathChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlantFormFields(
            name: state.name,
            plantType: state.plantType,
            wateringFrequencyInDays: state.wateringFrequencyInDays,
            notes: state.notes,
            photoPath: state.photoPath,
            validationErrors: state.validationErrors,
            onNameChanged: onNameChanged,
            onPlantTypeChanged: onPlantTypeChanged,
            onWateringFrequencyChanged: onWateringFrequencyChanged,
            onNotesChanged: onNotesChanged,
            onPhotoPathChanged: onPhotoPathChanged,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: state.canSubmit ? onSubmit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child:
                state.isLoading
                    ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.colors.onPrimary,
                        ),
                      ),
                    )
                    : Text(
                      t.plants.addPlant.form.submit,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
