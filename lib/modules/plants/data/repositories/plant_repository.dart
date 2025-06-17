import 'package:demo_flutter_cursor/modules/plants/data/storage/plant_dao.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  final dao = ref.watch(plantDaoProvider);
  return PlantRepositoryImpl(dao: dao);
});

class PlantRepositoryImpl implements PlantRepository {
  final PlantDao _dao;

  PlantRepositoryImpl({required PlantDao dao}) : _dao = dao;

  @override
  Future<void> addPlant(Plant plant) async {
    final now = DateTime.now();

    // Update timestamps and calculate next watering date if needed
    final plantWithTimestamps = plant.copyWith(
      creationDate: plant.creationDate ?? now,
      lastUpdateDate: now,
    );

    final plantWithNextWatering =
        plantWithTimestamps.nextWateringDate == null
            ? plantWithTimestamps.calculateNextWateringDate()
            : plantWithTimestamps;

    // Convert to entity and save
    final entity = PlantEntity.fromModel(plantWithNextWatering);
    await _dao.save(entity);
  }
}
