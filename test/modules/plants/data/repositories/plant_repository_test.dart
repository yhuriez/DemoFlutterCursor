import 'package:demo_flutter_cursor/modules/plants/data/repositories/plant_repository.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_plant_dao.dart';

void main() {
  late PlantRepository repository;
  late FakePlantDao fakeDao;

  setUp(() {
    fakeDao = FakePlantDao();
    repository = PlantRepositoryImpl(dao: fakeDao);
  });

  group('PlantRepository.addPlant', () {
    test(
      'should save plant to local storage when addPlant is called',
      () async {
        // Arrange
        final plant = Plant(
          id: '1',
          name: 'Monstera Deliciosa',
          plantType: 'Tropical',
          wateringFrequencyInDays: 7,
          notes: 'Beautiful plant',
          photoPath: '/path/to/photo.jpg',
          creationDate: DateTime(2024, 1, 1),
          lastUpdateDate: DateTime(2024, 1, 1),
        );

        // Act
        await repository.addPlant(plant);

        // Assert
        expect(fakeDao.getSavedEntities(), hasLength(1));
        final savedEntity = fakeDao.getSavedEntities().first;
        expect(savedEntity.id, equals('1'));
        expect(savedEntity.name, equals('Monstera Deliciosa'));
        expect(savedEntity.plantType, equals('Tropical'));
        expect(savedEntity.wateringFrequencyInDays, equals(7));
        expect(savedEntity.notes, equals('Beautiful plant'));
        expect(savedEntity.photoPath, equals('/path/to/photo.jpg'));
      },
    );

    test(
      'should save plant with calculated next watering date when provided',
      () async {
        // Arrange
        final creationDate = DateTime(2024, 1, 1);
        final plant =
            Plant(
              id: '2',
              name: 'Cactus',
              plantType: 'Succulent',
              wateringFrequencyInDays: 14,
              creationDate: creationDate,
            ).calculateNextWateringDate();

        // Act
        await repository.addPlant(plant);

        // Assert
        expect(fakeDao.getSavedEntities(), hasLength(1));
        final savedEntity = fakeDao.getSavedEntities().first;
        expect(
          savedEntity.nextWateringDate,
          equals(creationDate.add(Duration(days: 14))),
        );
      },
    );

    test('should save plant with minimal required fields', () async {
      // Arrange
      final plant = Plant(
        id: '3',
        name: 'Simple Plant',
        plantType: 'Unknown',
        wateringFrequencyInDays: 5,
      );

      // Act
      await repository.addPlant(plant);

      // Assert
      expect(fakeDao.getSavedEntities(), hasLength(1));
      final savedEntity = fakeDao.getSavedEntities().first;
      expect(savedEntity.id, equals('3'));
      expect(savedEntity.name, equals('Simple Plant'));
      expect(savedEntity.plantType, equals('Unknown'));
      expect(savedEntity.wateringFrequencyInDays, equals(5));
      expect(savedEntity.notes, isNull);
      expect(savedEntity.photoPath, isNull);
    });

    test('should update timestamps when saving plant', () async {
      // Arrange
      final creationDate = DateTime(2024, 1, 1);
      final plant = Plant(
        id: '4',
        name: 'Time Test Plant',
        plantType: 'Test',
        wateringFrequencyInDays: 3,
        creationDate: creationDate,
      );

      // Act
      await repository.addPlant(plant);

      // Assert
      expect(fakeDao.getSavedEntities(), hasLength(1));
      final savedEntity = fakeDao.getSavedEntities().first;
      expect(savedEntity.creationDate, equals(creationDate));
      expect(savedEntity.lastUpdateDate, isNotNull);
      expect(savedEntity.lastUpdateDate!.isAfter(creationDate), isTrue);
    });
  });
}
