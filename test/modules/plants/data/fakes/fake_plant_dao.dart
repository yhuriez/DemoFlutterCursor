import 'package:demo_flutter_cursor/modules/plants/data/storage/plant_dao.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';

class FakePlantDao implements PlantDao {
  final Map<String, PlantEntity> _data = {};
  final List<PlantEntity> _savedEntities = [];

  void addPlant(String id, PlantEntity entity) {
    _data[id] = entity;
  }

  List<PlantEntity> getSavedEntities() {
    return _savedEntities;
  }

  @override
  Future<PlantEntity?> get(String id) async {
    return _data[id];
  }

  @override
  Future<void> save(PlantEntity entity) async {
    _data[entity.id] = entity;
    _savedEntities.add(entity);
  }

  @override
  Future<List<PlantEntity>> getAll() async {
    return _data.values.toList();
  }

  @override
  Future<void> saveAll(List<PlantEntity> plants) async {
    for (final plant in plants) {
      await save(plant);
    }
  }

  @override
  Future<void> delete(String id) async {
    _data.remove(id);
  }

  @override
  Future<void> deleteAll() async {
    _data.clear();
    _savedEntities.clear();
  }
}
