import 'package:flutter/material.dart';

List<Map<String, dynamic>> favoriteCards = [];

percentage(int totalCount, int index) =>
    ((1 / totalCount * index) * 100).toStringAsFixed(0);

bool checkAnsExist(
    List<Map<String, dynamic>> answers, String quesName, String que) {
  return answers
          .firstWhere(
            (ans) => ans['quesName'] == quesName && ans['ans'] == que,
            orElse: () => {},
          )
          .isEmpty
      ? false
      : true;
}

bool checkFavoriteExist(int id,String level) {
  return favoriteCards.firstWhere(
      (element) =>
          element['id'] == id &&
          element['level'] == level,
      orElse: () => {}).isEmpty ? false :true;
}

toastMessage(String title, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 180,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 400),
      backgroundColor: color,
      content: Text(
        title,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
