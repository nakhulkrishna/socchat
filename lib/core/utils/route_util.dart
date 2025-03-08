import 'package:flutter/material.dart';
import 'package:socchat/core/constants/strings.dart';
import 'package:socchat/core/models/user_model.dart';
import 'package:socchat/ui/screen/auth/login/login_screen.dart';
import 'package:socchat/ui/screen/auth/signup/signup_screen.dart';
import 'package:socchat/ui/screen/bottom_navigation/chat_list/chat_room/chat_romm_screen.dart';
import 'package:socchat/ui/screen/splash/splash_screen.dart';
import 'package:socchat/ui/screen/wrapper/wrapper.dart';

class RouteUtil {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case signup:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case wrapper:
        return MaterialPageRoute(builder: (context) => Wrapper());
      case chatroom:
        return MaterialPageRoute(
            builder: (context) => ChatRommScreen(
                  receiver: arg as UserModel,
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(child: Text("No Route Found")),
                ));
    }
  }
}
