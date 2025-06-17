import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant.freezed.dart';

@freezed
sealed class Plant with _$Plant {
  const factory Plant({
    required String id,
    required String name,
    required String plantType,
    required int wateringFrequencyInDays,
    String? notes,
    String? photoPath,
    DateTime? lastWateredDate,
    DateTime? nextWateringDate,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
  }) = _Plant;

  const Plant._();

  Plant calculateNextWateringDate() {
    final now = DateTime.now();
    final baseDate = lastWateredDate ?? creationDate ?? now;
    final nextDate = baseDate.add(Duration(days: wateringFrequencyInDays));

    return copyWith(nextWateringDate: nextDate);
  }
}
