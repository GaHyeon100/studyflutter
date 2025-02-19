import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final Function() onTap; // onTap의 이벤트를 부모위젯에서 처리 할 수 있도록 받아줌

  const Btn({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: const Color(0xffED7738),
              child: child)),
    );
  }
}
