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
  animated_hint_searchbar: ^1.0.0
```

## Import the package

```dart
import 'package:animated_hint_searchbar/animated_hint_searchbar.dart';
```

## Usage

Here is an example of how to use the `animated_hint_searchbar` widget:

```dart
import 'package:animated_hint_searchbar/animated_hint_searchbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchExample(),
    );
  }
}

class SearchExample extends StatefulWidget {
  @override
  _SearchExampleState createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffcf3),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 90, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Animated Searchbar',
              style: TextStyle(
                color: Color(0xff6f6d5f),
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Search(
                    textEditingController: _textEditingController,
                    micEnabled: true,
                    onSearchPressed: () {},
                    cursorColor: Colors.white,
                    hintStyle:
                        TextStyle(color: Color(0xff6f6d5f), fontSize: 20),
                    opacity: 0.5,
                    fontFamily: 'Roboto',
                    textColor: Color(0xff6f6d5f),
                    containerColor: const Color(0xffebe8d6),
                    verticalDivider_color: Color(0xff6f6d5f),
                    micIconColor: Color(0xff6f6d5f),
                    searchIconColor: Color(0xff6f6d5f),
                    micIconActiveColor: Colors.red,
                    height: 50,
                    width: 390,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Customizable Parameters

### Required Parameters

- `textEditingController` (TextEditingController): Controller for managing the text being edited. Required to handle text input.
- `micEnabled` (bool): Flag to enable or disable the microphone button. Required to indicate mic availability.
- `onSearchPressed` (VoidCallback?): Callback function when the search icon is pressed. Required to define search action.

### Optional Parameters

- `searchIcon` (IconData): Icon for the search button. Defaults to `Icons.search`.
- `hintTexts` (List<String>): List of hint texts to display in the search bar. Provides dynamic suggestions to the user. Defaults to `['Pizza', 'Burger', 'Salad']`.
- `animationDuration` (Duration): Duration of the hint text animation. Controls how fast the hints change. Defaults to `Duration(seconds: 2)`.
- `hintStyle` (TextStyle?): Style of the hint text. Customizes the appearance of the hint text.
- `searchIconColor` (Color): Color of the search icon. Matches the search bar with your app's theme. Defaults to `Colors.grey`.
- `micIconColor` (Color): Color of the microphone icon when inactive. Indicates the state of the mic. Defaults to `Colors.grey`.
- `micIconActiveColor` (Color): Color of the microphone icon when active. Indicates when the mic is recording. Defaults to `Colors.blue`.
- `containerColor` (Color): Background color of the search bar. Integrates the search bar with your app's design. Defaults to `Colors.white`.
- `boxShadow` (BoxShadow?): Shadow effect for the search bar container. Adds depth to the search bar UI.
- `borderRadius` (BorderRadius?): Radius for the search bar container. Adds more layers to the search bar UI.
- `height` (double): Height of the search bar. Allows customization of the search bar size. Defaults to `50`.
- `width` (double?): Width of the search bar. Allows customization of the search bar size.
- `cursorColor` (Color): Color of the text cursor. Defaults to `Colors.blue`.
- `opacity` (double): Opacity of the search bar background. Defaults to `0.7`.
- `fontFamily` (String): Font family for the text. Defaults to `Mukti`.
- `textColor` (Color): Color of the search text. Defaults to `Colors.black`.
- `verticalDivider_color` (Color): Color of the vertical divider between the text field and the microphone icon. Defaults to `Colors.black`.

By using these parameters, you can customize the appearance and behavior of the `Animated_hint_searchbar` to match your app's design and functionality requirements.

## Authors

Developed by Aryan Surve (aryan2509surve@gmail.com) and Aditi Gaikwad (aditigaikwad003@gmail.com)
Drop a like if you enjoy using this package!
