import 'package:flutter/material.dart';
import 'package:kanji_phay_mal/helper.dart';
import 'package:kanji_phay_mal/widgets/card/speaker.dart';

class SelectAnsItem extends StatelessWidget {
  final int? selectedIndex;
  final int index;
  final String name;
  final String ques;
  final List<Map<String, dynamic>> answers;
  const SelectAnsItem({super.key,required this.selectedIndex,required this.index,required this.answers ,required this.name, required this.ques});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            backgroundColor: checkAnsExist(answers,name, ques)
                ? const Color.fromRGBO(237, 233, 254, 1)
                : const Color.fromARGB(255, 251, 234, 243),
            radius: 15,
            child: checkAnsExist(answers,name, ques)
                ? const Icon(
                    Icons.done,
                    size: 14,
                  )
                : Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: checkAnsExist(answers,name, ques)
                          ? const Color.fromRGBO(139, 92, 246, 1)
                          : const Color.fromARGB(255, 249, 40, 151),
                    ),
                  )),
        Text(
          ques,
          style: TextStyle(
            fontSize: 14,
            color: selectedIndex != null && selectedIndex == index
                ? Colors.blue
                : Colors.black,
          ),
        ),
        Speaker(text: ques),
      ],
    );
  }
}
