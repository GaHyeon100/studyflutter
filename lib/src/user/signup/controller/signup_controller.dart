import 'package:bamtol_market_app/src/user/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:bamtol_market_app/src/user/model/user_model.dart';

class SignupController extends GetxController {
  final UserRepository _userRepository;
  final String uid; // SNS로그인시 받은 uid를 넘겨 받아서 회원가입 시 함께 저장
  SignupController(this._userRepository, this.uid);

  RxString userNickName = ''.obs;
  RxBool isPossibleUseNickName = false.obs;

  @override
  void onInit() {
    super.onInit();
    debounce(
        userNickName,
        checkDuplicationNickName //이벤트 함수
        ,
        time: const Duration(
            milliseconds:
                500)); // 닉네임 중복 여부 판단하기 위해 userRepository로 데이터 베이스 조회, 닉네임 입력시 이 함수 호출됨 ( 즉시 데이터 베이스에 조회하면, 서버에 부하가 발생할 수 있어서 방지를 위해 debounce 기술 사용 _ 사용자 입력이 일정 시간 없을 때 데이터 베이스 조회를 실행하도록 함 즉, 사용자 입력이 더 이상 발생하지 않은 후 0.5초가 지나면 이벤트 함수가 실행됨)
  }

  checkDuplicationNickName(String value) async {
    var isPossibleUse = await _userRepository.checkDuplicationNickName(value);
    isPossibleUseNickName(isPossibleUse);
  }

  changeNickName(String nickName) {
    userNickName(nickName);
  }

  Future<String?> signup() async {
    var newUser = UserModel.create(userNickName.value, uid);
    var result = await _userRepository.signup(newUser);
    return result;
  }
}
