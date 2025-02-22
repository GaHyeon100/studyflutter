import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository authenticationRepository;
  LoginController(this.authenticationRepository);

  void googleLogin() async {
    await authenticationRepository.signInWithGoogle();
  }

  void appaleLogin() async {
    await authenticationRepository.signInWithApple();
  }
}
