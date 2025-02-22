import 'package:get/get.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:bamtol_market_app/src/user/model/user_model.dart';
import 'package:bamtol_market_app/src/common/enum/authentication_status.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Rx<UserModel> userModel = const UserModel().obs;

  Rx<AuthenticationStatus> status = AuthenticationStatus.init.obs;

  void authCheck() async {
    _authenticationRepository.user.listen((user) {
      _userStateChangedEvent(user);
    });
  }

  void _userStateChangedEvent(UserModel? user) async {
    if (user == null) {
      // unknown (user이 null이면 로그인 안된 상태)
      status(AuthenticationStatus.unknown);
    } else {
      // authentication or unAuthentication (user이 등록된 상태_로그인 된 상태)
    }
  }

  void logout() async {
    await _authenticationRepository.logout();
  }
}
