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
            //),
          ],
        ),
      ),
    );
  }
}
