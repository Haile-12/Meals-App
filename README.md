# 🍲 Meals App

**Discover, Cook, Enjoy!** The Meals App is your ultimate culinary companion, offering a delightful way to explore diverse recipes, manage your favorites, and even watch cooking video tutorials. Built with Flutter, it delivers a seamless experience across mobile and web platforms.

## ✨ Features

* **Categorized Meal Browse:** Easily explore meals organized by various categories like Ethiopian, Italian, Quick & Easy, and more.
* **Detailed Recipe Views:** Get comprehensive information for each meal, including ingredients, step-by-step instructions, preparation time, and dietary considerations (gluten-free, vegan, vegetarian, lactose-free).
* **Personalized Favorites:** Mark your favorite meals for quick access and build your go-to recipe collection. Favorites are managed efficiently using **Riverpod**.
* **Integrated Video Tutorials:** For selected meals, watch high-quality cooking demonstrations directly within the app to master new techniques.
* **Responsive & Intuitive UI:** Enjoy a beautiful Material Design interface that adapts gracefully to different screen sizes and orientations.
* **Custom Typography:** Enhanced visual appeal with carefully selected fonts using **Google Fonts**.
* **Developer Info Menu:** A dedicated section providing contact and profile links for the app's developer.

## 🚀 Technologies Used

* **Frontend Framework:** [Flutter](https://flutter.dev/) (Dart)
* **State Management:** [Flutter Riverpod](https://riverpod.dev/) (`^2.6.1`)
* **Video Playback:** [video_player](https://pub.dev/packages/video_player) (`^2.9.5`)
* **External Links:** [url_launcher](https://pub.dev/packages/url_launcher) (`^6.0.20`)
* **Custom Fonts:** [google_fonts](https://pub.dev/packages/google_fonts) (`^6.2.1`)
* **Image Handling:** [transparent_image](https://pub.dev/packages/transparent_image) (`^2.0.1`)
* **Internationalization:** [intl](https://pub.dev/packages/intl) (`^0.20.2`)
* **Icons:** [cupertino_icons](https://pub.dev/packages/cupertino_icons) (`^1.0.8`)
* **App Icons:** [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)


## 📦 Getting Started

Follow these steps to get a local copy of the project up and running on your machine.

### Prerequisites

* [**Flutter SDK**](https://flutter.dev/docs/get-started/install) (Version `3.7.0` or higher recommended, compatible with `sdk: ^3.7.0` in `pubspec.yaml`)
* [**Git**](https://git-scm.com/downloads)
* A code editor like [**VS Code**](https://code.visualstudio.com/) with Flutter/Dart extensions or [**Android Studio**](https://developer.android.com/studio).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Haile-12/meals-app.git](https://github.com/Haile-12/Meals-app.git) 
    cd meals-app
    ```

2.  **Install Flutter dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Android Permissions (Important!):**
    To ensure external links (email, phone, web) work, add the `INTERNET` permission to your `AndroidManifest.xml` file:
    Open `android/app/src/main/AndroidManifest.xml` and add the following line just above the `<application>` tag:
    ```xml
    <manifest xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)">
        <uses-permission android:name="android.permission.INTERNET"/>
        </manifest>
    ```

### Running the Application

1.  **Launch an emulator or connect a device:**
    * For Android: Open Android Studio -> Device Manager and start an AVD, or connect your physical device with USB debugging enabled.
    * For iOS (macOS only): Run `open -a Simulator` in your terminal.

2.  **Run the app:**
    ```bash
    flutter run
    ```
    (To run on a specific device/browser, use `flutter run -d <device_id>` or `flutter run -d chrome`).

---
## 🌳 Project Structure

The Meals App follows a clear and organized structure to ensure maintainability and scalability. Here's a quick tour of the main directories:

```bash
meals-app/
├── android/               # Platform-specific configurations for Android builds.
├── ios/                   # Platform-specific configurations for iOS builds.
├── lib/                   # ✨ Source Code Central! ✨
│   ├── main.dart          # Entry point, global theme, and Riverpod setup.
│   ├── models/            # Defines meal and category structures.
│   ├── data/              # Static dummy recipes and categories.
│   ├── providers/         # Global state management (favorites, meals data).
│   ├── screens/           # Main views users interact with.
│   └── widgets/           # Reusable UI components.
├── assets/                # 🖼️🎥 Media Hub for images and videos.
│   ├── images/
│   └── videos/
├── pubspec.yaml           # Project details and dependencies.
├── README.md              # Project overview and guide.
└── .gitignore             # Keeps your repo clean by ignoring unnecessary files.
```
## 👋 Contributing

Contributions are always welcome! If you have suggestions for improvements, new features, or bug fixes, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name` or `fix/bug-description`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add new feature X'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a Pull Request.

Please ensure your code adheres to the project's coding style and includes relevant tests if applicable.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

* **Developer:** Haile Tassew Belay
* **Email:** hailetassew4545@gmail.com
* **GitHub:** [github.com/Haile-12](https://github.com/Haile-12)
* **LinkedIn:** [linkedin.com/in/haile12_12](https://www.linkedin.com/in/haile12_12)

---
*Built with ❤️ using Flutter and Riverpod.*
