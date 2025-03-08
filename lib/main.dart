import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socchat/core/services/database_service.dart';
import 'package:socchat/core/utils/route_util.dart';
import 'package:socchat/firebase_options.dart';
import 'package:socchat/ui/screen/other/user_provider.dart';
import 'package:socchat/ui/screen/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(Socchat());
}

class Socchat extends StatelessWidget {
  const Socchat({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => UserProvider(DatabaseService()),
        child: MaterialApp(
            onGenerateRoute: RouteUtil.onGenerateRoute, home: SplashScreen()),
      ),
    );
  }
}
