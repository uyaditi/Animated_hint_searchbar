import 'package:flutter/material.dart';
import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

class Search extends StatefulWidget {
  final List<String> hintTexts;
  final Duration animationDuration;
  final TextStyle? hintStyle;
  final Color searchIconColor;
  final Color micIconColor;
  final Color micIconActiveColor;
  final Color? containerColor;
  final BoxShadow? boxShadow;
  final BorderRadius? borderRadius;
  final double height;
  final double? width; // Make width nullable
  final Color cursorColor;
  final double opacity;

  const Search({
    Key? key,
    this.hintTexts = const ['Pizza', 'Burger', 'Salad'],
    this.animationDuration = const Duration(seconds: 2),
    this.hintStyle,
    this.searchIconColor = Colors.grey,
    this.micIconColor = Colors.grey,
    this.micIconActiveColor = Colors.blue,
    this.containerColor = Colors.white,
    this.boxShadow,
    this.borderRadius,
    this.height = 50,
    this.cursorColor = Colors.black,
    this.opacity = 1.0,
    this.width,
  }) : super(key: key);

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animationTranslate;
  late Animation<double> _animationOpacity;
  final TextEditingController _textEditingController = TextEditingController();
  bool _isTextFieldEmpty = true;
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animationTranslate = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeInOut),
      ),
    );

    _animationOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _textEditingController.addListener(() {
      setState(() {
        _isTextFieldEmpty = _textEditingController.text.isEmpty;
      });
    });

    // Timer to change the hint text every 5 seconds
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_isTextFieldEmpty) {
        _controller.forward().whenComplete(() {
          setState(() {
            currentIndex = (currentIndex + 1) % widget.hintTexts.length;
          });
          _controller.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _textEditingController.dispose();
    _speech.cancel(); // Cancel speech recognition
    super.dispose();
  }

  Future<bool> _handleMicPermission() async {
    bool permitted = false;
    PermissionStatus status = await Permission.microphone.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.microphone.request();
      permitted = status == PermissionStatus.granted;
    } else {
      permitted = true;
    }
    return permitted;
  }

  void _startListening() async {
    if (!_isListening) {
      bool permitted = await _handleMicPermission();
      if (permitted) {
        bool available = await _speech.initialize(
          onStatus: (val) {
            print('onStatus: $val');
            if (val == 'done') {
              setState(() {
                _isListening = false;
              });
            }
          },
          onError: (val) => print('onError: $val'),
        );
        if (available) {
          setState(() => _isListening = true);
          _speech.listen(
            onResult: (val) => setState(() {
              _textEditingController.text = val.recognizedWords;
            }),
          );
        }
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: widget.width ?? screenWidth,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
        boxShadow: widget.boxShadow != null ? [widget.boxShadow!] : [],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: widget.searchIconColor,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_isTextFieldEmpty)
                  AnimatedBuilder(
                    animation: _animationTranslate,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_animationTranslate.value * 70),
                        child: Opacity(
                          opacity: _animationOpacity.value * widget.opacity,
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: widget.hintTexts[currentIndex],
                              hintStyle: widget.hintStyle,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (_isTextFieldEmpty)
                  AnimatedBuilder(
                    animation: _animationTranslate,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, (1 - _animationTranslate.value) * 20),
                        child: Opacity(
                          opacity:
                              (1 - _animationOpacity.value) * widget.opacity,
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: widget.hintTexts[
                                  (currentIndex + 1) % widget.hintTexts.length],
                              hintStyle: widget.hintStyle,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: '',
                    border: InputBorder.none,
                  ),
                  cursorColor: widget.cursorColor,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: _startListening,
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: _isListening
                    ? widget.micIconActiveColor
                    : widget.micIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
