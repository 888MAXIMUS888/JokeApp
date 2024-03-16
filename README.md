# joke_app

Test Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to Compile and Run the Test Project

To compile and run the Test project, follow these steps:
1. Ensure you have the following prerequisites:

    - Flutter SDK version 3.3.10 or newer
    - IDE of your choice (e.g., Visual Studio Code or Android Studio)
    - Xcode and CocoaPods (if targeting iOS devices)

    - Used Flutter Intl for localization. Also used plugins([Android Studio](https://plugins.jetbrains.com/plugin/13666-flutter-intl) / [VS Code](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)) for autogenerate code.
    
2. Run `flutter pub get` in the repository root folder to fetch the required dependencies.
3. Used [retrofit](https://pub.dev/packages/retrofit) for API calls. After clone application OR after change             app_api_service.dart Need to call.  
   Run `dart run build_runner build --delete-conflicting-outputs` to generate necessary files based on code generation annotations.


