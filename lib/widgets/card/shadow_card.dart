import 'package:flutter/material.dart';

class ShadowCard extends StatelessWidget {
  final double zAxis;
  final double width;
  final double height;
  final Color color;
  const ShadowCard({super.key,required this.zAxis,required this.width,required this.height,required this.color});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width ,
      height: height,
      transform: Matrix4.rotationZ(zAxis),
      decoration:  BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              spreadRadius: 0.001,
              blurRadius: 0.001),
        ],
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
