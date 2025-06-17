// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_plant_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddPlantPageState {

 String get name; String get plantType; int get wateringFrequencyInDays; String get notes; String? get photoPath; Map<String, String> get validationErrors; bool get isLoading; bool get isSuccess; String? get errorMessage;
/// Create a copy of AddPlantPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPlantPageStateCopyWith<AddPlantPageState> get copyWith => _$AddPlantPageStateCopyWithImpl<AddPlantPageState>(this as AddPlantPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPlantPageState&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&const DeepCollectionEquality().equals(other.validationErrors, validationErrors)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,plantType,wateringFrequencyInDays,notes,photoPath,const DeepCollectionEquality().hash(validationErrors),isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'AddPlantPageState(name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, validationErrors: $validationErrors, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AddPlantPageStateCopyWith<$Res>  {
  factory $AddPlantPageStateCopyWith(AddPlantPageState value, $Res Function(AddPlantPageState) _then) = _$AddPlantPageStateCopyWithImpl;
@useResult
$Res call({
 String name, String plantType, int wateringFrequencyInDays, String notes, String? photoPath, Map<String, String> validationErrors, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class _$AddPlantPageStateCopyWithImpl<$Res>
    implements $AddPlantPageStateCopyWith<$Res> {
  _$AddPlantPageStateCopyWithImpl(this._self, this._then);

  final AddPlantPageState _self;
  final $Res Function(AddPlantPageState) _then;

/// Create a copy of AddPlantPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = null,Object? photoPath = freezed,Object? validationErrors = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,validationErrors: null == validationErrors ? _self.validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _AddPlantPageState extends AddPlantPageState {
  const _AddPlantPageState({this.name = '', this.plantType = '', this.wateringFrequencyInDays = 7, this.notes = '', this.photoPath, final  Map<String, String> validationErrors = const {}, this.isLoading = false, this.isSuccess = false, this.errorMessage}): _validationErrors = validationErrors,super._();
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String plantType;
@override@JsonKey() final  int wateringFrequencyInDays;
@override@JsonKey() final  String notes;
@override final  String? photoPath;
 final  Map<String, String> _validationErrors;
@override@JsonKey() Map<String, String> get validationErrors {
  if (_validationErrors is EqualUnmodifiableMapView) return _validationErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_validationErrors);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;

/// Create a copy of AddPlantPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddPlantPageStateCopyWith<_AddPlantPageState> get copyWith => __$AddPlantPageStateCopyWithImpl<_AddPlantPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddPlantPageState&&(identical(other.name, name) || other.name == name)&&(identical(other.plantType, plantType) || other.plantType == plantType)&&(identical(other.wateringFrequencyInDays, wateringFrequencyInDays) || other.wateringFrequencyInDays == wateringFrequencyInDays)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath)&&const DeepCollectionEquality().equals(other._validationErrors, _validationErrors)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,name,plantType,wateringFrequencyInDays,notes,photoPath,const DeepCollectionEquality().hash(_validationErrors),isLoading,isSuccess,errorMessage);

@override
String toString() {
  return 'AddPlantPageState(name: $name, plantType: $plantType, wateringFrequencyInDays: $wateringFrequencyInDays, notes: $notes, photoPath: $photoPath, validationErrors: $validationErrors, isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AddPlantPageStateCopyWith<$Res> implements $AddPlantPageStateCopyWith<$Res> {
  factory _$AddPlantPageStateCopyWith(_AddPlantPageState value, $Res Function(_AddPlantPageState) _then) = __$AddPlantPageStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String plantType, int wateringFrequencyInDays, String notes, String? photoPath, Map<String, String> validationErrors, bool isLoading, bool isSuccess, String? errorMessage
});




}
/// @nodoc
class __$AddPlantPageStateCopyWithImpl<$Res>
    implements _$AddPlantPageStateCopyWith<$Res> {
  __$AddPlantPageStateCopyWithImpl(this._self, this._then);

  final _AddPlantPageState _self;
  final $Res Function(_AddPlantPageState) _then;

/// Create a copy of AddPlantPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? plantType = null,Object? wateringFrequencyInDays = null,Object? notes = null,Object? photoPath = freezed,Object? validationErrors = null,Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,}) {
  return _then(_AddPlantPageState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plantType: null == plantType ? _self.plantType : plantType // ignore: cast_nullable_to_non_nullable
as String,wateringFrequencyInDays: null == wateringFrequencyInDays ? _self.wateringFrequencyInDays : wateringFrequencyInDays // ignore: cast_nullable_to_non_nullable
as int,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,validationErrors: null == validationErrors ? _self._validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
