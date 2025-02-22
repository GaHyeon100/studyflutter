//page
import 'package:bamtol_market_app/src/home/page/home_page.dart';
import 'package:bamtol_market_app/src/user/login/page/login_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bamtol_market_app/src/app.dart';
// firebase
import 'package:bamtol_market_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
//firebase auth
import 'package:firebase_auth/firebase_auth.dart';
//sharedpreferences
import 'package:shared_preferences/shared_preferences.dart';
// controller
import 'package:bamtol_market_app/src/splash/controller/splash_controller.dart';
import 'package:bamtol_market_app/src/common/data_load_controller.dart';
import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:bamtol_market_app/src/user/repository/authentication_repository.dart';
import 'package:bamtol_market_app/src/user/login/controller/login_controller.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '당근마켓 클론 코딩',
      initialRoute: '/',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Color(0xff212123),
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: Color(0xff212123)),
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController()); // SplashController를 앱 전반에서 사용가능함
        Get.put(DataLoadController());

        var authenticationRepository =
            AuthenticationRepository(FirebaseAuth.instance);
        Get.put(authenticationRepository);
        Get.put(AuthenticationController(authenticationRepository));
      }),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut<LoginController>(
                  () => LoginController(Get.find<AuthenticationRepository>()));
            }))
      ],
    );
  }
}
