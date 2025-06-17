import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/add_plant_page_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/models/add_plant_page_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_add_plant_usecase.dart';

void main() {
  late FakeAddPlantUseCase fakeAddPlantUseCase;
  late AddPlantPageStateNotifier notifier;

  setUp(() {
    fakeAddPlantUseCase = FakeAddPlantUseCase();
    notifier = AddPlantPageStateNotifier(addPlantUseCase: fakeAddPlantUseCase);
  });

  group('AddPlantPageStateNotifier', () {
    test('initial state should have default values', () {
      // Assert
      expect(notifier.state.name, equals(''));
      expect(notifier.state.plantType, equals(''));
      expect(notifier.state.wateringFrequencyInDays, equals(7));
      expect(notifier.state.notes, equals(''));
      expect(notifier.state.photoPath, isNull);
      expect(notifier.state.validationErrors, isEmpty);
      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.isSuccess, isFalse);
      expect(notifier.state.errorMessage, isNull);
      expect(notifier.state.canSubmit, isFalse);
    });

    group('updateName', () {
      test('should update name and clear name validation error', () {
        // Arrange
        notifier.state = notifier.state.copyWith(
          validationErrors: {'name': 'Name is required'},
        );

        // Act
        notifier.updateName('Monstera');

        // Assert
        expect(notifier.state.name, equals('Monstera'));
        expect(notifier.state.validationErrors.containsKey('name'), isFalse);
      });

      test('should validate name when empty', () {
        // Act
        notifier.updateName('');

        // Assert
        expect(notifier.state.name, equals(''));
        expect(notifier.state.validationErrors['name'], isNotNull);
      });
    });

    group('updatePlantType', () {
      test(
        'should update plant type and clear plant type validation error',
        () {
          // Arrange
          notifier.state = notifier.state.copyWith(
            validationErrors: {'plantType': 'Plant type is required'},
          );

          // Act
          notifier.updatePlantType('Tropical');

          // Assert
          expect(notifier.state.plantType, equals('Tropical'));
          expect(
            notifier.state.validationErrors.containsKey('plantType'),
            isFalse,
          );
        },
      );
    });

    group('updateWateringFrequency', () {
      test('should update watering frequency when valid', () {
        // Act
        notifier.updateWateringFrequency(14);

        // Assert
        expect(notifier.state.wateringFrequencyInDays, equals(14));
        expect(
          notifier.state.validationErrors.containsKey('wateringFrequency'),
          isFalse,
        );
      });

      test('should add validation error when frequency is invalid', () {
        // Act
        notifier.updateWateringFrequency(0);

        // Assert
        expect(notifier.state.wateringFrequencyInDays, equals(0));
        expect(notifier.state.validationErrors['wateringFrequency'], isNotNull);
      });
    });

    group('updateNotes', () {
      test('should update notes', () {
        // Act
        notifier.updateNotes('Beautiful plant that needs care');

        // Assert
        expect(notifier.state.notes, equals('Beautiful plant that needs care'));
      });

      test('should add validation error when notes are too long', () {
        // Arrange
        final longNotes = 'a' * 501; // More than 500 characters

        // Act
        notifier.updateNotes(longNotes);

        // Assert
        expect(notifier.state.notes, equals(longNotes));
        expect(notifier.state.validationErrors['notes'], isNotNull);
      });
    });

    group('updatePhotoPath', () {
      test('should update photo path', () {
        // Act
        notifier.updatePhotoPath('/path/to/photo.jpg');

        // Assert
        expect(notifier.state.photoPath, equals('/path/to/photo.jpg'));
      });

      test('should allow null photo path', () {
        // Act
        notifier.updatePhotoPath(null);

        // Assert
        expect(notifier.state.photoPath, isNull);
      });
    });

    group('submitForm', () {
      test('should not submit when form is invalid', () async {
        // Act
        await notifier.submitForm();

        // Assert
        expect(fakeAddPlantUseCase.wasCalled(), isFalse);
        expect(notifier.state.isLoading, isFalse);
        expect(notifier.state.isSuccess, isFalse);
      });

      test('should submit successfully when form is valid', () async {
        // Arrange
        notifier.updateName('Monstera');
        notifier.updatePlantType('Tropical');
        notifier.updateWateringFrequency(7);

        // Act
        await notifier.submitForm();

        // Assert
        expect(fakeAddPlantUseCase.wasCalled(), isTrue);
        expect(notifier.state.isLoading, isFalse);
        expect(notifier.state.isSuccess, isTrue);
        expect(notifier.state.errorMessage, isNull);

        final savedPlant = fakeAddPlantUseCase.getLastSavedPlant();
        expect(savedPlant, isNotNull);
        expect(savedPlant!.name, equals('Monstera'));
        expect(savedPlant.plantType, equals('Tropical'));
        expect(savedPlant.wateringFrequencyInDays, equals(7));
      });

      test('should handle error during submission', () async {
        // Arrange
        notifier.updateName('Monstera');
        notifier.updatePlantType('Tropical');
        notifier.updateWateringFrequency(7);
        fakeAddPlantUseCase.exceptionToThrow = Exception(
          'Failed to save plant',
        );

        // Act
        await notifier.submitForm();

        // Assert
        expect(notifier.state.isLoading, isFalse);
        expect(notifier.state.isSuccess, isFalse);
        expect(notifier.state.errorMessage, isNotNull);
      });

      test('should set loading state during submission', () async {
        // Arrange
        notifier.updateName('Monstera');
        notifier.updatePlantType('Tropical');
        notifier.updateWateringFrequency(7);

        // Act & Assert
        final future = notifier.submitForm();
        expect(notifier.state.isLoading, isTrue);
        await future;
        expect(notifier.state.isLoading, isFalse);
      });
    });

    group('resetForm', () {
      test('should reset all form fields to default values', () {
        // Arrange
        notifier.updateName('Test');
        notifier.updatePlantType('Test Type');
        notifier.updateNotes('Test notes');
        notifier.updatePhotoPath('/test/path.jpg');

        // Act
        notifier.resetForm();

        // Assert
        expect(notifier.state.name, equals(''));
        expect(notifier.state.plantType, equals(''));
        expect(notifier.state.wateringFrequencyInDays, equals(7));
        expect(notifier.state.notes, equals(''));
        expect(notifier.state.photoPath, isNull);
        expect(notifier.state.validationErrors, isEmpty);
        expect(notifier.state.isLoading, isFalse);
        expect(notifier.state.isSuccess, isFalse);
        expect(notifier.state.errorMessage, isNull);
      });
    });
  });
}
