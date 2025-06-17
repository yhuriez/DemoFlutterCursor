import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';

/// Mock implementation of AddPlantUseCase for testing purposes
class FakeAddPlantUseCase implements AddPlantUseCase {
  final List<Plant> savedPlants = [];
  final Set<String> calledWithIds = {};
  Exception? exceptionToThrow;
  bool wasCalledWithAnyPlant = false;

  @override
  Future<void> call(Plant plant) async {
    calledWithIds.add(plant.id);
    wasCalledWithAnyPlant = true;

    if (exceptionToThrow != null) {
      throw exceptionToThrow!;
    }

    savedPlants.add(plant);
  }

  void reset() {
    savedPlants.clear();
    calledWithIds.clear();
    exceptionToThrow = null;
    wasCalledWithAnyPlant = false;
  }

  bool wasCalled() {
    return wasCalledWithAnyPlant;
  }

  bool wasCalledWith(String plantId) {
    return calledWithIds.contains(plantId);
  }

  Plant? getLastSavedPlant() {
    return savedPlants.isNotEmpty ? savedPlants.last : null;
  }

  int get totalCalls => savedPlants.length;
}
