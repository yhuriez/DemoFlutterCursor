import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_plant_page_state.freezed.dart';

@freezed
sealed class AddPlantPageState with _$AddPlantPageState {
  const factory AddPlantPageState({
    @Default('') String name,
    @Default('') String plantType,
    @Default(7) int wateringFrequencyInDays,
    @Default('') String notes,
    String? photoPath,
    @Default({}) Map<String, String> validationErrors,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _AddPlantPageState;

  const AddPlantPageState._();

  /// Check if the form has any validation errors
  bool get hasValidationErrors => validationErrors.isNotEmpty;

  /// Check if required fields are filled
  bool get areRequiredFieldsFilled =>
      name.trim().isNotEmpty &&
      plantType.trim().isNotEmpty &&
      wateringFrequencyInDays > 0;

  /// Check if the form is valid for submission
  bool get canSubmit =>
      areRequiredFieldsFilled && !hasValidationErrors && !isLoading;
}
