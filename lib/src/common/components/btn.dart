import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final Function() onTap; // onTap의 이벤트를 부모위젯에서 처리 할 수 있도록 받아줌
  final EdgeInsets padding;
  final Color color;

  const Btn(
      {super.key,
      required this.child,
      required this.onTap,
      this.color =
          const Color(0xffED7738), // 값이 정의되지 않으면 Color(0xffED7738)로 초기화 됨
      this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(padding: padding, color: color, child: child)),
    );
  }
}
