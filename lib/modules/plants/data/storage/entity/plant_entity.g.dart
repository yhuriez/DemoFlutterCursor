// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantEntity _$PlantEntityFromJson(Map json) => _PlantEntity(
  id: json['id'] as String,
  creationDate:
      json['creation_date'] == null
          ? null
          : DateTime.parse(json['creation_date'] as String),
  lastUpdateDate:
      json['last_update_date'] == null
          ? null
          : DateTime.parse(json['last_update_date'] as String),
  name: json['name'] as String,
  plantType: json['plant_type'] as String,
  wateringFrequencyInDays: (json['watering_frequency_in_days'] as num).toInt(),
  notes: json['notes'] as String?,
  photoPath: json['photo_path'] as String?,
  lastWateredDate:
      json['last_watered_date'] == null
          ? null
          : DateTime.parse(json['last_watered_date'] as String),
  nextWateringDate:
      json['next_watering_date'] == null
          ? null
          : DateTime.parse(json['next_watering_date'] as String),
);

Map<String, dynamic> _$PlantEntityToJson(_PlantEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creation_date': instance.creationDate?.toIso8601String(),
      'last_update_date': instance.lastUpdateDate?.toIso8601String(),
      'name': instance.name,
      'plant_type': instance.plantType,
      'watering_frequency_in_days': instance.wateringFrequencyInDays,
      'notes': instance.notes,
      'photo_path': instance.photoPath,
      'last_watered_date': instance.lastWateredDate?.toIso8601String(),
      'next_watering_date': instance.nextWateringDate?.toIso8601String(),
    };
