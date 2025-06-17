import 'dart:convert';

import 'package:demo_flutter_cursor/core/data/storage/key_value_storage.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantDaoProvider = Provider<PlantDao>((ref) {
  final keyValueStorage = ref.watch(keyValueStorageProvider);
  return PlantDaoImpl(keyValueStorage: keyValueStorage);
});

abstract class PlantDao {
  Future<void> save(PlantEntity plant);
  Future<PlantEntity?> get(String id);
  Future<List<PlantEntity>> getAll();
  Future<void> saveAll(List<PlantEntity> plants);
  Future<void> delete(String id);
  Future<void> deleteAll();
}

class PlantDaoImpl implements PlantDao {
  final KeyValueStorage _keyValueStorage;
  static const String _plantPrefix = 'plant_';
  static const String _plantsListKey = 'plants_list';

  PlantDaoImpl({required KeyValueStorage keyValueStorage})
    : _keyValueStorage = keyValueStorage;

  @override
  Future<void> save(PlantEntity plant) async {
    final jsonString = jsonEncode(plant.toJson());
    final key = _getKeyForId(plant.id);
    await _keyValueStorage.setString(key, jsonString);

    // Update the list of plant IDs
    final idsList = await _getPlantsIdsList();
    if (!idsList.contains(plant.id)) {
      idsList.add(plant.id);
      await _savePlantsIdsList(idsList);
    }
  }

  @override
  Future<PlantEntity?> get(String id) async {
    final key = _getKeyForId(id);
    final jsonString = _keyValueStorage.getString(key);

    if (jsonString == null) {
      return null;
    }

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return PlantEntity.fromJson(json);
  }

  @override
  Future<List<PlantEntity>> getAll() async {
    final idsList = await _getPlantsIdsList();
    final plants = <PlantEntity>[];

    for (final id in idsList) {
      final plant = await get(id);
      if (plant != null) {
        plants.add(plant);
      }
    }

    return plants;
  }

  @override
  Future<void> saveAll(List<PlantEntity> plants) async {
    final idsList = <String>[];

    for (final plant in plants) {
      await save(plant);
      idsList.add(plant.id);
    }

    await _savePlantsIdsList(idsList);
  }

  @override
  Future<void> delete(String id) async {
    final key = _getKeyForId(id);
    await _keyValueStorage.remove(key);

    // Update the list of plant IDs
    final idsList = await _getPlantsIdsList();
    idsList.remove(id);
    await _savePlantsIdsList(idsList);
  }

  @override
  Future<void> deleteAll() async {
    final idsList = await _getPlantsIdsList();

    for (final id in idsList) {
      final key = _getKeyForId(id);
      await _keyValueStorage.remove(key);
    }

    await _savePlantsIdsList([]);
  }

  // Helper methods
  String _getKeyForId(String id) {
    return '$_plantPrefix$id';
  }

  Future<List<String>> _getPlantsIdsList() async {
    final jsonString = _keyValueStorage.getString(_plantsListKey);

    if (jsonString == null) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.cast<String>();
    } catch (e) {
      // Log error or handle exception
      return [];
    }
  }

  Future<void> _savePlantsIdsList(List<String> idsList) async {
    final jsonString = jsonEncode(idsList);
    await _keyValueStorage.setString(_plantsListKey, jsonString);
  }
}
