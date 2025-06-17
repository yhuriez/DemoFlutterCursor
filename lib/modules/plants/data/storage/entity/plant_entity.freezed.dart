// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantEntity {

@JsonKey(includeIfNull: false) String get id;@JsonKey(name: 'creation_date') DateTime? get creationDate;@JsonKey(name: 'last_update_date') DateTime? get lastUpdateDate; String get name;@JsonKey(name: 'plant_type') String get plantType;@JsonKey(name: 'watering_frequency_in_days') int get wateringFrequencyInDays; String? get notes;@JsonKey(name: 'photo_path') String? get photoPath;@JsonKey(name: 'last_watered_date') DateTime? get lastWateredDate;@JsonKey(name: 'next_watering_date') DateTime? get nextWateringDate;
/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantEntityCopyWith<PlantEntity> get copyWith => _$PlantEntityCopyWithImpl<PlantEntity>(this as PlantEntity, _$identity);

  /// Serializes this PlantEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.lastWateredDate, lastWateredDate) || other.lastWateredDate == lastWateredDate)&&(identical(other.nextWateringDate, nextWateringDate) || other.nextWateringDate == nextWateringDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,plantType,wateringFrequencyInDays,notes,photoPath,lastWateredDate,nextWateringDate);

@override
String toString() {
  return 'PlantEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, lastWateredDate: $lastWateredDate, nextWateringDate: $nextWateringDate)';
}


}

/// @nodoc
abstract mixin class $PlantEntityCopyWith<$Res>  {
  factory $PlantEntityCopyWith(PlantEntity value, $Res Function(PlantEntity) _then) = _$PlantEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name,@JsonKey(name: 'plant_type') String plantType,@JsonKey(name: 'watering_frequency_in_days') int wateringFrequencyInDays, String? notes,@JsonKey(name: 'photo_path') String? photoPath,@JsonKey(name: 'last_watered_date') DateTime? lastWateredDate,@JsonKey(name: 'next_watering_date') DateTime? nextWateringDate
});




}
/// @nodoc
class _$PlantEntityCopyWithImpl<$Res>
    implements $PlantEntityCopyWith<$Res> {
  _$PlantEntityCopyWithImpl(this._self, this._then);

  final PlantEntity _self;
  final $Res Function(PlantEntity) _then;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = freezed,Object? photoPath = freezed,Object? lastWateredDate = freezed,Object? nextWateringDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,lastWateredDate: freezed == lastWateredDate ? _self.lastWateredDate : lastWateredDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextWateringDate: freezed == nextWateringDate ? _self.nextWateringDate : nextWateringDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlantEntity extends PlantEntity {
  const _PlantEntity({@JsonKey(includeIfNull: false) required this.id, @JsonKey(name: 'creation_date') this.creationDate, @JsonKey(name: 'last_update_date') this.lastUpdateDate, required this.name, @JsonKey(name: 'plant_type') required this.plantType, @JsonKey(name: 'watering_frequency_in_days') required this.wateringFrequencyInDays, this.notes, @JsonKey(name: 'photo_path') this.photoPath, @JsonKey(name: 'last_watered_date') this.lastWateredDate, @JsonKey(name: 'next_watering_date') this.nextWateringDate}): super._();
  factory _PlantEntity.fromJson(Map<String, dynamic> json) => _$PlantEntityFromJson(json);

@override@JsonKey(includeIfNull: false) final  String id;
@override@JsonKey(name: 'creation_date') final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date') final  DateTime? lastUpdateDate;
@override final  String name;
@override@JsonKey(name: 'plant_type') final  String plantType;
@override@JsonKey(name: 'watering_frequency_in_days') final  int wateringFrequencyInDays;
@override final  String? notes;
@override@JsonKey(name: 'photo_path') final  String? photoPath;
@override@JsonKey(name: 'last_watered_date') final  DateTime? lastWateredDate;
@override@JsonKey(name: 'next_watering_date') final  DateTime? nextWateringDate;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantEntityCopyWith<_PlantEntity> get copyWith => __$PlantEntityCopyWithImpl<_PlantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.lastWateredDate, lastWateredDate) || other.lastWateredDate == lastWateredDate)&&(identical(other.nextWateringDate, nextWateringDate) || other.nextWateringDate == nextWateringDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,plantType,wateringFrequencyInDays,notes,photoPath,lastWateredDate,nextWateringDate);

@override
String toString() {
  return 'PlantEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, lastWateredDate: $lastWateredDate, nextWateringDate: $nextWateringDate)';
}


}

/// @nodoc
abstract mixin class _$PlantEntityCopyWith<$Res> implements $PlantEntityCopyWith<$Res> {
  factory _$PlantEntityCopyWith(_PlantEntity value, $Res Function(_PlantEntity) _then) = __$PlantEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name,@JsonKey(name: 'plant_type') String plantType,@JsonKey(name: 'watering_frequency_in_days') int wateringFrequencyInDays, String? notes,@JsonKey(name: 'photo_path') String? photoPath,@JsonKey(name: 'last_watered_date') DateTime? lastWateredDate,@JsonKey(name: 'next_watering_date') DateTime? nextWateringDate
});




}
/// @nodoc
class __$PlantEntityCopyWithImpl<$Res>
    implements _$PlantEntityCopyWith<$Res> {
  __$PlantEntityCopyWithImpl(this._self, this._then);

  final _PlantEntity _self;
  final $Res Function(_PlantEntity) _then;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = freezed,Object? photoPath = freezed,Object? lastWateredDate = freezed,Object? nextWateringDate = freezed,}) {
  return _then(_PlantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,lastWateredDate: freezed == lastWateredDate ? _self.lastWateredDate : lastWateredDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextWateringDate: freezed == nextWateringDate ? _self.nextWateringDate : nextWateringDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
