import 'package:get/get.dart';

class DataLoadController extends GetxController {
  RxBool isDataLoad = false
      .obs; // isDataLoad는 클래스변수 isDataLoad(isDataLoad.value) : 값 호출 , 내부 값(false) 변경은 isDataLoad(true)

  void loadData() async {
    await Future.delayed(const Duration(
        milliseconds: 10000)); //비동기(async)지만, 딜레이 2초 시킨 다음에 다음 코드 실행(await)
    isDataLoad(true);
  }
}
