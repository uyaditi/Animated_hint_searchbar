# Animated_hint_searchbar

A customizable search bar with speech recognition and dynamic hint text animations for Flutter.

## Features

- **Dynamic Hint Text Animations**: Animated hint text changes periodically to provide suggestions to the user.
- **Speech Recognition**: Users can search by speaking, thanks to the integrated speech-to-text functionality.
- **Customizable**: Various parameters to customize the appearance and behavior of the search bar.

## Demo

Check out the video demo to see Animated_hint_searchbar in action:

[![Watch the video](https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)

## Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_hint_searchbar: ^0.0.1
```

## Import the package

```dart
import 'package:animated_hint_searchbar/animated_hint_searchbar.dart';
```

## Usage

Here is an example of how to use the `Animated_hint_searchbar` widget:

```dart
import 'package:flutter/material.dart';
import 'package:animated_hint_searchbar/animated_hint_searchbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VoiceHintSearch(
            hintTexts: ['Sushi', 'Pasta', 'Salad'],
            animationDuration: Duration(seconds: 1),
            hintStyle: TextStyle(color: Colors.blue, fontSize: 18),
            searchIconColor: Colors.green,
            micIconColor: Colors.black,
            micIconActiveColor: Colors.blue,
            containerColor: Colors.yellow[100]!,
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
            height: 60,
            width: 360,
          ),
        ],
      ),
    );
  }
}
```

## Parameters

Here are the customizable parameters available in `Animated_hint_searchbar`:

- `hintTexts` (List<String>): List of hint texts to display in the search bar. Provides dynamic suggestions to the user.
- `animationDuration` (Duration): Duration of the hint text animation. Controls how fast the hints change.
- `hintStyle` (TextStyle?): Style of the hint text. Customizes the appearance of the hint text.
- `searchIconColor` (Color): Color of the search icon. Matches the search bar with your app's theme.
- `micIconColor` (Color): Color of the microphone icon when inactive. Indicates the state of the mic.
- `micIconActiveColor` (Color): Color of the microphone icon when active. Indicates when the mic is recording.
- `containerColor` (Color): Background color of the search bar. Integrates the search bar with your app's design.
- `boxShadow` (BoxShadow?): Shadow effect for the search bar container. Adds depth to the search bar UI.
- `borderRadius` (BorderRadius?) : Radius for the search bar container. Adds more layers to the search bar UI.
- `height` (double): Height of the search bar. Allows customization of the search bar size.
- `width` (double): Width of the search bar. Allows customization of the search bar size.

## Authors

Developed by Aryan Surve (aryan2509surve@gmail.com) and Aditi Gaikwad (aditigaikwad003@gmail.com)
Drop a like if you enjoy using this package!
