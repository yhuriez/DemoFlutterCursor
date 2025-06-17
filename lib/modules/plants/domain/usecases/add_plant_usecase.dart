import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final addPlantUseCaseProvider = Provider<AddPlantUseCase>((ref) {
  // TODO: inject repository when repository provider is created
  throw UnimplementedError('Repository provider not yet implemented');
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
