import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/constant.dart';
import 'package:kanji_phay_mal/widgets/question_template.dart';

class N3QuestionPage extends StatefulWidget {
  const N3QuestionPage({super.key});

  @override
  State<N3QuestionPage> createState() => _N3QuestionPageState();
}

class _N3QuestionPageState extends State<N3QuestionPage> {
  

  @override
  Widget build(BuildContext context) {
  
    return const QuestionTemplate(baseUrl: n3Url, title: 'N3');
  }

  
}
