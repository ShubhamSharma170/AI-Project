import 'package:ai_project/helper/colors.dart';
import 'package:ai_project/helper/hive.dart';
import 'package:ai_project/helper/text_style.dart';
import 'package:ai_project/pages/auth/login_page.dart';
import 'package:ai_project/pages/auth/signup_page.dart';
import 'package:ai_project/pages/splash%20page/splash_page.dart';
import 'package:ai_project/routes/route_page/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.initializeHive();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: blue00C2FF,

          titleTextStyle: TextStyleHelper.textStyle(
            fontWeight: FontWeight.w500,

            fontSize: 22,
          ),
        ),
      ),
      onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      // home: SplashPage(),
      home: SignupPage(),
    );
  }
}
