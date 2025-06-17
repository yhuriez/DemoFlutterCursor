import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';

class FakePlantRepository implements PlantRepository {
  final List<Plant> _plants = [];
  bool _shouldThrowError = false;

  void addPlantToStorage(Plant plant) {
    _plants.add(plant);
  }

  void clear() {
    _plants.clear();
  }

  void setShouldThrowError(bool shouldThrow) {
    _shouldThrowError = shouldThrow;
  }

  List<Plant> getAllPlants() {
    return List.unmodifiable(_plants);
  }

  @override
  Future<void> addPlant(Plant plant) async {
    if (_shouldThrowError) {
      throw Exception('Repository error');
    }
    _plants.add(plant);
  }
}
