# Document Recognition

A new Flutter project for recognizing text in documents using the camera and Google ML Kit.

## Getting Started

This project is a starting point for a Flutter application that uses the camera to capture images and Google ML Kit to recognize text in those images.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- An IDE such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

Note that this app is intended for Android/iOS so it needs to be run directly on a Android/iOS device or emulator.

Tutorials for setting up an Android emulator in:
- VSCode: [https://medium.com/@bosctechlabs/code-of-how-to-set-up-an-emulator-for-vscode-updated-ad4365c0559b](https://medium.com/@bosctechlabs/code-of-how-to-set-up-an-emulator-for-vscode-updated-ad4365c0559b)
- AndroidStudio: [https://developer.android.com/studio/run/emulator](https://developer.android.com/studio/run/emulator)


### Installation

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd document_recognition
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the app:
    ```sh
    flutter run
    ```

### Project Structure
```
document_recognition
├── android
    ├── app
        ├── src
            ├── main
                └── AndroidManifest.xml
├── ios
    ├── Runner
        └── Info.plist
├── lib
    ├── main.dart
    ├── ocr_service.dart
├── linux
├── macos
├── test
├── web
├── windows
├──pubspec.yaml
└── README.md
```

### Key Files

- [main.dart](/lib/main.dart): The main entry point for the application.
- [ocr_service.dart](/lib/ocr_service.dart): This file contains the `OCRService` class, which uses the Google ML Kit to recognize text from images captured by the camera. It processes the image and updates the recognized text, which can be accessed through a getter.
- [pubspec.yaml](pubspec.yaml): The project's configuration file, including dependencies.
- [AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml): Android-specific configuration.
- [Info.plist](/ios/Runner/Info.plist): iOS-specific configuration.
- [analysis_options.yaml](analysis_options.yaml): Configuration for Dart static analysis.

### Dependencies

- [flutter](https://docs.flutter.dev/release/archive): The Flutter SDK.
- [provider](https://pub.dev/packages/provider): State management.
- [camera](https://pub.dev/packages/camera): Access to the device's camera.
- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition): Text recognition using Google ML Kit.

### Permissions

Ensure the following permissions are set in your platform-specific configuration files:

- **Android**: [AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml)
    ```xml
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-feature android:name="android.hardware.camera" android:required="true"/>
    ```

- **iOS**: [Info.plist](/ios/Runner/Info.plist)
    ```plist
    <key>NSCameraUsageDescription</key>
    <string>Camera permission is required for document recognition.</string>
    ```

### Linting

This project uses the `flutter_lints` package for linting. The lint rules are configured in [analysis_options.yaml](analysis_options.yaml).

### Contributing

Contributions are welcome! Please open an issue or submit a pull request.

### License

This project is licensed under the MIT License - see the LICENSE file for details.

### Acknowledgements

- [Flutter](https://flutter.dev/)
- [Google ML Kit](https://developers.google.com/ml-kit)