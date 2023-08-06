import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/models/card_model.dart';
import 'package:kanji_phay_mal/widgets/card/speaker.dart';

class ShowAnswer extends StatelessWidget {
  final CardModel card;
  const ShowAnswer({super.key,required this.card});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              card.answer,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Speaker(
            text: card.answer,
            iconSize: 33,
          ),
        ],
      ),
    );
  }
}
