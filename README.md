# bukit_vista_flutter_assessment

Flutter project for Bukit Vista interview

Muhammad Afif Azizy

Project Structure:
- lib
  - assets
    - (assets that is used in the app)
  - components
    - (widgets, reusable components)
  - features
    - (features, e.g. login, guestdetails, settings etc)
      - bloc (state management, every page should have their own bloc)
      - view (front end)
  - models
    - (models, objects that is used in the app)
  - repository
    - (repositories, convert data from the web to models)
  - service
    - (apis, read apis from the web)
  - app.dart
  - main.dart
  - bloc-observer.dart 
  - constants.dart
  - bukitvista-themes.dart (global themes)
