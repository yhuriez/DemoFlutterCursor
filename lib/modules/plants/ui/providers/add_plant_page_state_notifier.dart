import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/models/add_plant_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final addPlantPageStateNotifierProvider =
    StateNotifierProvider<AddPlantPageStateNotifier, AddPlantPageState>((ref) {
      return AddPlantPageStateNotifier(
        addPlantUseCase: ref.read(addPlantUseCaseProvider),
      );
    });

class AddPlantPageStateNotifier extends StateNotifier<AddPlantPageState> {
  final AddPlantUseCase _addPlantUseCase;
  final Uuid _uuid = const Uuid();

  AddPlantPageStateNotifier({required AddPlantUseCase addPlantUseCase})
    : _addPlantUseCase = addPlantUseCase,
      super(const AddPlantPageState());

  void updateName(String name) {
    final errors = Map<String, String>.from(state.validationErrors);

    // Clear previous name error
    errors.remove('name');

    // Add validation error if name is empty
    if (name.trim().isEmpty) {
      errors['name'] = 'Name is required';
    }

    state = state.copyWith(name: name, validationErrors: errors);
  }

  void updatePlantType(String plantType) {
    final errors = Map<String, String>.from(state.validationErrors);

    // Clear previous plant type error
    errors.remove('plantType');

    // Add validation error if plant type is empty
    if (plantType.trim().isEmpty) {
      errors['plantType'] = 'Plant type is required';
    }

    state = state.copyWith(plantType: plantType, validationErrors: errors);
  }

  void updateWateringFrequency(int frequency) {
    final errors = Map<String, String>.from(state.validationErrors);

    // Clear previous frequency error
    errors.remove('wateringFrequency');

    // Add validation error if frequency is invalid
    if (frequency <= 0 || frequency > 365) {
      errors['wateringFrequency'] =
          'Watering frequency must be between 1 and 365 days';
    }

    state = state.copyWith(
      wateringFrequencyInDays: frequency,
      validationErrors: errors,
    );
  }

  void updateNotes(String notes) {
    final errors = Map<String, String>.from(state.validationErrors);

    // Clear previous notes error
    errors.remove('notes');

    // Add validation error if notes are too long
    if (notes.length > 500) {
      errors['notes'] = 'Notes must be 500 characters or less';
    }

    state = state.copyWith(notes: notes, validationErrors: errors);
  }

  void updatePhotoPath(String? photoPath) {
    state = state.copyWith(photoPath: photoPath);
  }

  Future<void> submitForm() async {
    if (!state.canSubmit) {
      return;
    }

    // Set loading state
    state = state.copyWith(
      isLoading: true,
      isSuccess: false,
      errorMessage: null,
    );

    try {
      final now = DateTime.now();
      final plant = Plant(
        id: _uuid.v4(),
        name: state.name.trim(),
        plantType: state.plantType.trim(),
        wateringFrequencyInDays: state.wateringFrequencyInDays,
        notes: state.notes.trim().isEmpty ? null : state.notes.trim(),
        photoPath: state.photoPath,
        creationDate: now,
        lastUpdateDate: now,
      );

      await _addPlantUseCase(plant);

      // Set success state
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      debugPrint('Error submitting plant: $e');

      // Set error state
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: 'Failed to save plant. Please try again.',
      );
    }
  }

  void resetForm() {
    state = const AddPlantPageState();
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
