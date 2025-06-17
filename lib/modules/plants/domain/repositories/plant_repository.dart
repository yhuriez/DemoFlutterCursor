import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';

abstract class PlantRepository {
  Future<void> addPlant(Plant plant);
}
