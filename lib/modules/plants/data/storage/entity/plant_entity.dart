// ignore_for_file: invalid_annotation_target

import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_entity.freezed.dart';
part 'plant_entity.g.dart';

@freezed
sealed class PlantEntity with _$PlantEntity {
  const factory PlantEntity({
    @JsonKey(includeIfNull: false) required String id,
    @JsonKey(name: 'creation_date') DateTime? creationDate,
    @JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,
    required String name,
    @JsonKey(name: 'plant_type') required String plantType,
    @JsonKey(name: 'watering_frequency_in_days')
    required int wateringFrequencyInDays,
    String? notes,
    @JsonKey(name: 'photo_path') String? photoPath,
    @JsonKey(name: 'last_watered_date') DateTime? lastWateredDate,
    @JsonKey(name: 'next_watering_date') DateTime? nextWateringDate,
  }) = _PlantEntity;

  const PlantEntity._();

  factory PlantEntity.fromJson(Map<String, dynamic> json) =>
      _$PlantEntityFromJson(json);

  Plant toModel() {
    return Plant(
      id: id,
      name: name,
      plantType: plantType,
      wateringFrequencyInDays: wateringFrequencyInDays,
      notes: notes,
      photoPath: photoPath,
      lastWateredDate: lastWateredDate,
      nextWateringDate: nextWateringDate,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
    );
  }

  factory PlantEntity.fromModel(Plant plant) {
    return PlantEntity(
      id: plant.id,
      name: plant.name,
      plantType: plant.plantType,
      wateringFrequencyInDays: plant.wateringFrequencyInDays,
      notes: plant.notes,
      photoPath: plant.photoPath,
      lastWateredDate: plant.lastWateredDate,
      nextWateringDate: plant.nextWateringDate,
      creationDate: plant.creationDate,
      lastUpdateDate: plant.lastUpdateDate,
    );
  }
}
