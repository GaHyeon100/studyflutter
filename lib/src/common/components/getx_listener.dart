import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxListener<T> extends StatefulWidget {
  final Rx<T> stream; //감지할 GetX 상태
  final Widget child; //하위 위젯
  final Function(T) listen; //값이 변경될 때 실행할 콜백 함수
  final Function()? initCall; //null이 아니면 실행될 함수
  const GetxListener({
    super.key,
    this.initCall,
    required this.stream,
    required this.listen,
    required this.child,
  });

  @override
  State<GetxListener> createState() {
    stream.listen(listen); // stream 값이 바뀔 때 listen 함수가 실행됨
    return _GetxListenerState();
  }
}

class _GetxListenerState extends State<GetxListener> {
  @override
  void initState() {
    super.initState();

    if (widget.initCall != null) {
      widget.initCall!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
