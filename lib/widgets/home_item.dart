import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final String title;
  final Widget widget;
  const HomeItem({super.key, required this.onTap,required this.widget,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 150,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:onTap,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                width: 80,
                height: 80,
                decoration:  BoxDecoration(
                  color:color ?? const Color.fromRGBO(114, 146, 255, 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                alignment: Alignment.center,
                child: widget,
              ),
            ),
             Text(title)
          ],
        ),
      ),
    );
  }
}
