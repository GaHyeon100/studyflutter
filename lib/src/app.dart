import 'package:flutter/material.dart';
import 'package:bamtol_market_app/main.dart';

// StatelessWidget 상속받은 App 클래스
// 생성자 App({}) 는 변하지 않는 값만 받으며, super.key는 flutter가 위젯을 식별하는 키를 부모 클래스인 statelessWidget에 넘겨준다는 의미
class App extends StatefulWidget {
  const App({super.key});

//statelessW의 기본적인 build() 메서드를 재정의 한다는 의미
// BuildContext context는 위젯 트리에서 현재 위젯의 위치 및 상위 위젯에 대한 정보를 담고 있는 객체
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    count = prefs.getInt('counter') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 80, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        setState(() {
          count++;
        });
        await prefs.setInt('counter', count);
      }),
    );
  }
}
