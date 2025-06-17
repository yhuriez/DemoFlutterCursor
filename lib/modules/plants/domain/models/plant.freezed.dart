// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Plant {

 String get id; String get name; String get plantType; int get wateringFrequencyInDays; String? get notes; String? get photoPath; DateTime? get lastWateredDate; DateTime? get nextWateringDate; DateTime? get creationDate; DateTime? get lastUpdateDate;
/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantCopyWith<Plant> get copyWith => _$PlantCopyWithImpl<Plant>(this as Plant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.lastWateredDate, lastWateredDate) || other.lastWateredDate == lastWateredDate)&&(identical(other.nextWateringDate, nextWateringDate) || other.nextWateringDate == nextWateringDate)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,plantType,wateringFrequencyInDays,notes,photoPath,lastWateredDate,nextWateringDate,creationDate,lastUpdateDate);

@override
String toString() {
  return 'Plant(id: $id, name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, lastWateredDate: $lastWateredDate, nextWateringDate: $nextWateringDate, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $PlantCopyWith<$Res>  {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) _then) = _$PlantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String plantType, int wateringFrequencyInDays, String? notes, String? photoPath, DateTime? lastWateredDate, DateTime? nextWateringDate, DateTime? creationDate, DateTime? lastUpdateDate
});




}
/// @nodoc
class _$PlantCopyWithImpl<$Res>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._self, this._then);

  final Plant _self;
  final $Res Function(Plant) _then;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = freezed,Object? photoPath = freezed,Object? lastWateredDate = freezed,Object? nextWateringDate = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,lastWateredDate: freezed == lastWateredDate ? _self.lastWateredDate : lastWateredDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextWateringDate: freezed == nextWateringDate ? _self.nextWateringDate : nextWateringDate // ignore: cast_nullable_to_non_nullable
as DateTime?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _Plant extends Plant {
  const _Plant({required this.id, required this.name, required this.plantType, required this.wateringFrequencyInDays, this.notes, this.photoPath, this.lastWateredDate, this.nextWateringDate, this.creationDate, this.lastUpdateDate}): super._();
  

@override final  String id;
@override final  String name;
@override final  String plantType;
@override final  int wateringFrequencyInDays;
@override final  String? notes;
@override final  String? photoPath;
@override final  DateTime? lastWateredDate;
@override final  DateTime? nextWateringDate;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantCopyWith<_Plant> get copyWith => __$PlantCopyWithImpl<_Plant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&(identical(other.lastWateredDate, lastWateredDate) || other.lastWateredDate == lastWateredDate)&&(identical(other.nextWateringDate, nextWateringDate) || other.nextWateringDate == nextWateringDate)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,plantType,wateringFrequencyInDays,notes,photoPath,lastWateredDate,nextWateringDate,creationDate,lastUpdateDate);

@override
String toString() {
  return 'Plant(id: $id, name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, lastWateredDate: $lastWateredDate, nextWateringDate: $nextWateringDate, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class _$PlantCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$PlantCopyWith(_Plant value, $Res Function(_Plant) _then) = __$PlantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String plantType, int wateringFrequencyInDays, String? notes, String? photoPath, DateTime? lastWateredDate, DateTime? nextWateringDate, DateTime? creationDate, DateTime? lastUpdateDate
});




}
/// @nodoc
class __$PlantCopyWithImpl<$Res>
    implements _$PlantCopyWith<$Res> {
  __$PlantCopyWithImpl(this._self, this._then);

  final _Plant _self;
  final $Res Function(_Plant) _then;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = freezed,Object? photoPath = freezed,Object? lastWateredDate = freezed,Object? nextWateringDate = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(_Plant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,lastWateredDate: freezed == lastWateredDate ? _self.lastWateredDate : lastWateredDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextWateringDate: freezed == nextWateringDate ? _self.nextWateringDate : nextWateringDate // ignore: cast_nullable_to_non_nullable
as DateTime?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
