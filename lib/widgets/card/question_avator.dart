import 'package:flutter/material.dart';

class QuestionAvator extends StatelessWidget {
  final String name;
  const QuestionAvator({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: CircleAvatar(
        radius: name.length > 1 ? 58 : 50,
        backgroundColor: const Color.fromRGBO(219, 234, 254, 1),
        child: CircleAvatar(
          radius: name.length > 1 ? 42 : 30,
          backgroundColor: const Color.fromRGBO(59, 130, 246, 1),
          child: Text(
            name,
            style: TextStyle(
                fontSize: name.length > 1 ? 18 : 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
