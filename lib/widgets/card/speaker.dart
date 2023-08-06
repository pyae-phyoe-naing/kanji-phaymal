import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Speaker extends StatelessWidget {
  final String text;
  final double iconSize;
  const Speaker({super.key, required this.text, this.iconSize = 28});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color.fromRGBO(235, 252, 242, 1),
      child: IconButton(
          splashRadius: 20,
          onPressed: () => speak(text: text),
          icon:  Icon(
            Icons.volume_up,
            size: iconSize,
            color: const Color.fromRGBO(38, 208, 118, 1),
          )),
    );
  }

  speak({required String text, String lang = "ja-JP"}) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage(lang);
    await flutterTts.speak(text);
  }
}
