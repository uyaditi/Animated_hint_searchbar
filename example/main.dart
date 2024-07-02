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
      body: Center(
        child: Search(
            hintTexts: ['Sushi', 'Pasta', 'Salad'],
            animationDuration: Duration(seconds: 1),
            hintStyle: TextStyle(color: Colors.blue, fontSize: 18),
            searchIconColor: Colors.blue,
            micIconColor: Colors.black,
            micIconActiveColor: Colors.blue,
            containerColor: Colors.blueGrey[50],
            boxShadow: BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
            height: 60,
            width: 370),
      ),
    );
  }
}
