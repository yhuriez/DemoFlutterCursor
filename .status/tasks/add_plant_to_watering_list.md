# Task : Add plant to watering reminder list

Status: To Do
Priority: High
Dependencies: None

## Requirements
The user should be able to add a new plant to their watering reminder list with all necessary information for tracking watering schedules.

- User can add a plant with basic information (name, plant type, watering frequency)
- User can specify watering frequency in days (e.g., every 3 days, every week)
- User can add optional notes about the plant
- User can upload or select a photo for the plant
- System validates required fields before saving
- System saves the plant to local storage
- User receives confirmation when plant is successfully added
- User can navigate back to the plant list after adding

## Steps
1. Domain layer:
- Create Plant model with properties (id, name, plantType, wateringFrequencyInDays, notes, photoPath, lastWateredDate, nextWateringDate)
- Create PlantRepository interface with addPlant method
- Create AddPlantUseCase with empty implementation
- Create unit tests for AddPlantUseCase using fake repositories
- Execute unit tests
- Implement AddPlantUseCase following domain_layer.mdc rules
- Execute unit tests again

2. Data layer:
- Create tests for PlantRepository implementation
- Execute unit tests
- Create Plant entity for data persistence
- Implement PlantDao for local storage
- Implement PlantRepositoryImpl with addPlant method
- Execute tests again
- Follow data_layer.mdc rules for repository implementation

3. UI layer:
- Create AddPlantPageState model for form state management
- Create AddPlantPageStateNotifier following ui_layer.mdc rules
- Create AddPlantPage widget as entry point
- Create AddPlantForm component for form handling
- Create plant form widgets (text fields, frequency selector, photo picker)
- Implement form validation and submission logic

## Acceptance criteria
- User can fill out a form with plant name (required), plant type (required), and watering frequency (required)
- User can optionally add notes about the plant (max 500 characters)
- User can optionally add a photo by selecting from gallery or taking a new photo
- Form validates that required fields are not empty
- Form validates that watering frequency is a positive integer between 1 and 365 days
- System calculates next watering date based on current date and frequency
- Plant is saved to local storage when form is valid and submitted
- User sees loading state during save operation
- User sees success message after successful save
- User is navigated back to plant list after successful save
- User sees error message if save operation fails
- Form can be cancelled, returning user to plant list without saving
- All text content supports internationalization

## Technical notes
- Module location: `lib/modules/plants/`
- Plant model should include calculated nextWateringDate property
- Use Riverpod StateNotifier pattern for form state management
- Use local storage (SQLite via sqflite package) for data persistence
- Image handling should support both camera capture and gallery selection
- Form validation should provide real-time feedback
- Follow existing navigation patterns in the app
- Integration with home module for displaying plant list 