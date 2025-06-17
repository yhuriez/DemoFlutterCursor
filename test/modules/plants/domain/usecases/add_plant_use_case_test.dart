import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_plant_repository.dart';

void main() {
  late AddPlantUseCase addPlantUseCase;
  late FakePlantRepository fakePlantRepository;

  setUp(() {
    fakePlantRepository = FakePlantRepository();
    addPlantUseCase = AddPlantUseCase(plantRepository: fakePlantRepository);
  });

  group('AddPlantUseCase', () {
    test(
      'should add plant to repository when valid plant is provided',
      () async {
        // Arrange
        const plant = Plant(
          id: '1',
          name: 'Rose',
          plantType: 'Flower',
          wateringFrequencyInDays: 3,
          notes: 'Beautiful red rose',
        );

        // Act
        await addPlantUseCase(plant);

        // Assert
        final savedPlants = fakePlantRepository.getAllPlants();
        expect(savedPlants.length, 1);
        expect(savedPlants.first.id, plant.id);
        expect(savedPlants.first.name, plant.name);
        expect(savedPlants.first.plantType, plant.plantType);
        expect(
          savedPlants.first.wateringFrequencyInDays,
          plant.wateringFrequencyInDays,
        );
        expect(savedPlants.first.notes, plant.notes);
        expect(
          savedPlants.first.nextWateringDate,
          isNotNull,
        ); // Should be calculated
      },
    );

    test('should throw exception when repository fails', () async {
      // Arrange
      const plant = Plant(
        id: '1',
        name: 'Rose',
        plantType: 'Flower',
        wateringFrequencyInDays: 3,
      );
      fakePlantRepository.setShouldThrowError(true);

      // Act & Assert
      expect(() async => await addPlantUseCase(plant), throwsException);
    });

    test('should add plant with calculated next watering date', () async {
      // Arrange
      final now = DateTime.now();
      final plant = Plant(
        id: '1',
        name: 'Rose',
        plantType: 'Flower',
        wateringFrequencyInDays: 7,
        creationDate: now,
      );
      final plantWithNextDate = plant.calculateNextWateringDate();

      // Act
      await addPlantUseCase(plantWithNextDate);

      // Assert
      final savedPlants = fakePlantRepository.getAllPlants();
      expect(savedPlants.length, 1);
      expect(savedPlants.first.nextWateringDate, isNotNull);
      expect(
        savedPlants.first.nextWateringDate?.difference(now).inDays,
        equals(7),
      );
    });
  });
}
