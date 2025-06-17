import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PlantFormFields extends StatelessWidget {
  final String name;
  final String plantType;
  final int wateringFrequencyInDays;
  final String notes;
  final String? photoPath;
  final Map<String, String> validationErrors;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPlantTypeChanged;
  final ValueChanged<int> onWateringFrequencyChanged;
  final ValueChanged<String> onNotesChanged;
  final ValueChanged<String?> onPhotoPathChanged;

  const PlantFormFields({
    super.key,
    required this.name,
    required this.plantType,
    required this.wateringFrequencyInDays,
    required this.notes,
    required this.photoPath,
    required this.validationErrors,
    required this.onNameChanged,
    required this.onPlantTypeChanged,
    required this.onWateringFrequencyChanged,
    required this.onNotesChanged,
    required this.onPhotoPathChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Plant Name Field
        _buildTextField(
          context: context,
          label: t.plants.addPlant.form.name.label,
          hint: t.plants.addPlant.form.name.hint,
          value: name,
          onChanged: onNameChanged,
          errorKey: 'name',
          isRequired: true,
        ),
        const SizedBox(height: 16),

        // Plant Type Field
        _buildTextField(
          context: context,
          label: t.plants.addPlant.form.plantType.label,
          hint: t.plants.addPlant.form.plantType.hint,
          value: plantType,
          onChanged: onPlantTypeChanged,
          errorKey: 'plantType',
          isRequired: true,
        ),
        const SizedBox(height: 16),

        // Watering Frequency Field
        _buildNumberField(
          context: context,
          label: t.plants.addPlant.form.wateringFrequency.label,
          hint: t.plants.addPlant.form.wateringFrequency.hint,
          value: wateringFrequencyInDays,
          onChanged: onWateringFrequencyChanged,
          errorKey: 'wateringFrequency',
        ),
        const SizedBox(height: 16),

        // Notes Field
        _buildTextField(
          context: context,
          label: t.plants.addPlant.form.notes.label,
          hint: t.plants.addPlant.form.notes.hint,
          value: notes,
          onChanged: onNotesChanged,
          errorKey: 'notes',
          maxLines: 3,
          maxLength: 500,
        ),
        const SizedBox(height: 16),

        // Photo Field
        _buildPhotoField(context),
      ],
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String label,
    required String hint,
    required String value,
    required ValueChanged<String> onChanged,
    required String errorKey,
    bool isRequired = false,
    int maxLines = 1,
    int? maxLength,
  }) {
    final hasError = validationErrors.containsKey(errorKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w500,
            ),
            children:
                isRequired
                    ? [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: context.colors.error),
                      ),
                    ]
                    : null,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.grey1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.grey1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error, width: 2),
            ),
            errorText: hasError ? validationErrors[errorKey] : null,
            filled: true,
            fillColor: context.colors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberField({
    required BuildContext context,
    required String label,
    required String hint,
    required int value,
    required ValueChanged<int> onChanged,
    required String errorKey,
  }) {
    final hasError = validationErrors.containsKey(errorKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value.toString(),
          onChanged: (val) {
            final intVal = int.tryParse(val);
            if (intVal != null) {
              onChanged(intVal);
            }
          },
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.6),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.grey1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.grey1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.colors.error, width: 2),
            ),
            errorText: hasError ? validationErrors[errorKey] : null,
            filled: true,
            fillColor: context.colors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.plants.addPlant.form.photo.label,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        if (photoPath != null) ...[
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.colors.grey1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(photoPath!),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: context.colors.surface,
                    child: Icon(
                      Icons.broken_image,
                      size: 48,
                      color: context.colors.onSurface.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => onPhotoPathChanged(null),
            icon: const Icon(Icons.delete_outline),
            label: Text(t.plants.addPlant.form.photo.removePhoto),
            style: OutlinedButton.styleFrom(
              foregroundColor: context.colors.error,
              side: BorderSide(color: context.colors.error),
            ),
          ),
        ] else ...[
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library_outlined),
                  label: Text(t.plants.addPlant.form.photo.selectPhoto),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.colors.primary,
                    side: BorderSide(color: context.colors.primary),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: Text(t.plants.addPlant.form.photo.takePhoto),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: context.colors.primary,
                    side: BorderSide(color: context.colors.primary),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      onPhotoPathChanged(pickedFile.path);
    }
  }
}
