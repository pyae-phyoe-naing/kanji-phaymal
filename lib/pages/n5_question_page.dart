import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/constant.dart';
import 'package:kanji_phay_mal/widgets/question_template.dart';

class N5QuestionPage extends StatefulWidget {
  const N5QuestionPage({super.key});

  @override
  State<N5QuestionPage> createState() => _N5QuestionPageState();
}

class _N5QuestionPageState extends State<N5QuestionPage> {
  

  @override
  Widget build(BuildContext context) {
  
    return const QuestionTemplate(baseUrl: n5Url, title: 'N5');
  }

  
}
