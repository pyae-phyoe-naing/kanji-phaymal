class CardModel {
  final String name;
  final String answer;
  final List questions;
  CardModel(
      {required this.name, required this.answer, required this.questions});

 factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
      name: json['name'], answer: json['answer'], questions: json['questions']);
}
