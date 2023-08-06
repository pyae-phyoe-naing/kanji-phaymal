import 'package:kanji_phay_mal/models/card_model.dart';

class QuestionModel {
  final int id;
  final String name;
  final String level;
  final List<CardModel> cards;
  QuestionModel({required this.id, required this.name,required this.level, required this.cards});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      cards: (json['cards'] as List)
          .map((cardModel) => CardModel.fromJson(cardModel))
          .toList());
}
