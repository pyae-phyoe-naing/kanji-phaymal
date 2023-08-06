import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/helper.dart';
import 'package:kanji_phay_mal/models/card_model.dart';

AppBar appBar(
    {required int currentIndex,
    required int indicatorIndex,
    required List<CardModel> cards,
    required BuildContext context}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios_new,
        size: 20,
        color: Colors.blue,
      ),
    ),
    title: Row(
      children: [
        Text(
          "${currentIndex == 0 && indicatorIndex == 0 ? 0 : percentage(cards.length, indicatorIndex)}%",
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(59, 130, 246, 1),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            height: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                  color: const Color.fromRGBO(59, 130, 246, 1),
             
                backgroundColor: const Color.fromARGB(255, 208, 208, 208),
                value: currentIndex == 0 && indicatorIndex == 0
                    ? 0
                    : 1 / cards.length * (indicatorIndex),
              ),
            ),
          ),
        ),
      ],
    ),
    actions: [
      Align(
        alignment: Alignment.center,
        child: Text(
          "$indicatorIndex/${cards.length}",
          style: const TextStyle(
            color: Color.fromRGBO(59, 130, 246, 1),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
