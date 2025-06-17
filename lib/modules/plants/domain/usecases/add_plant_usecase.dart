import 'package:demo_flutter_cursor/modules/plants/data/repositories/plant_repository.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPlantUseCaseProvider = Provider<AddPlantUseCase>((ref) {
  final repository = ref.watch(plantRepositoryProvider);
  return AddPlantUseCase(plantRepository: repository);
});

class AddPlantUseCase {
  final PlantRepository _plantRepository;

  AddPlantUseCase({required PlantRepository plantRepository})
    : _plantRepository = plantRepository;

  Future<void> call(Plant plant) async {
    // Calculate next watering date if not already set
    final plantWithNextDate =
        plant.nextWateringDate == null
            ? plant.calculateNextWateringDate()
            : plant;

    // Add plant to repository
    await _plantRepository.addPlant(plantWithNextDate);
  }
}
