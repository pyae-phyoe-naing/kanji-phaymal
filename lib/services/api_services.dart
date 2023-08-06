import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kanji_phay_mal/models/question_model.dart';

class ApiServices {
  Future<List<QuestionModel>> getAllQuiz(String urlPath) async {
    Uri url = Uri.parse(urlPath);
   
      Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      List<QuestionModel> allQuizs = [];
      for (var quiz in data['data']) {
        allQuizs.add(QuestionModel.fromJson(quiz));
      }
      return allQuizs;
   
    
  }
}
