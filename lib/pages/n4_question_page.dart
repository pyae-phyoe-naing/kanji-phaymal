import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/constant.dart';
import 'package:kanji_phay_mal/widgets/question_template.dart';

class N4QuestionPage extends StatefulWidget {
  const N4QuestionPage({super.key});

  @override
  State<N4QuestionPage> createState() => _N4QuestionPageState();
}

class _N4QuestionPageState extends State<N4QuestionPage> {
  

  @override
  Widget build(BuildContext context) {
  
    return const QuestionTemplate(baseUrl: n4Url, title: 'N4');
  }

  
}
