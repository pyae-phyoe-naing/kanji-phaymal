import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/constant.dart';
import 'package:kanji_phay_mal/widgets/question_template.dart';

class N2QuestionPage extends StatefulWidget {
  const N2QuestionPage({super.key});

  @override
  State<N2QuestionPage> createState() => _N2QuestionPageState();
}

class _N2QuestionPageState extends State<N2QuestionPage> {
  

  @override
  Widget build(BuildContext context) {
  
    return const QuestionTemplate(baseUrl: n2Url, title: 'N2');
  }

  
}
