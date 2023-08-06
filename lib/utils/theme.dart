import 'package:flutter/material.dart';

class AppTheme {

  static const Color scaffoldBg = Color.fromRGBO(248, 249, 251, 1);

  static  BoxDecoration boxDecoration = const BoxDecoration(
    color: Color.fromRGBO(254, 254, 254, 1),
 
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          spreadRadius: 0.001,
          blurRadius: 0.001),
    ],
  );

  
}


//Blue
// Color.fromRGBO(219, 234, 254, 1)
// Color.fromRGBO(59, 130, 246, 1)
//Purple
// Color.fromRGBO(237, 233, 254, 1)
//Color.fromRGBO(139, 92, 246, 1)

//Yellow
// const Color.fromRGBO(254, 249, 195, 1)
// Color.fromRGBO(245, 158, 11, 1)