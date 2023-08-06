import 'package:flutter/material.dart';

class NabButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const NabButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.black,
           
          ),
        ),
      ),
    );
  }
}
